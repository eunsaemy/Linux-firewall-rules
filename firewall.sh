#!/bin/bash

source config.sh

#--------- Flush all IP accounting rules ---------
flush()
{
    iptables -t mangle -F
    iptables -t nat -F PREROUTING
	iptables -F
	iptables -X
	iptables -Z

	iptables -P INPUT ACCEPT
	iptables -P OUTPUT ACCEPT
	iptables -P FORWARD ACCEPT

	echo "Firewall rules have been reset!"
}

#--------- Firewall Setup ---------
firewall_setup()
{
    dnf -y install hping3

    ifconfig $INTERNAL_INTERFACE $FIREWALL_ADDRESS up
    echo "1" > /proc/sys/net/ipv4/ip_forward
    route add -net $EXTERNAL_SUBNET netmask 255.255.255.0 gw $EXTERNAL_ADDRESS
    route add -net $INTERNAL_SUBNET gw $FIREWALL_ADDRESS
    iptables -A POSTROUTING -t nat -s $INTERNAL_SUBNET -o $EXTERNAL_INTERFACE -j MASQUERADE
    route -n

	rm /etc/resolv.conf
    touch /etc/resolv.conf
    echo "nameserver 8.8.8.8" > /etc/resolv.conf

	echo "Firewall setup complete!"
}

#--------- Internal Setup ---------
internal_setup()
{
    dnf -y install hping3

    ifconfig $EXTERNAL_INTERFACE down
    ifconfig $INTERNAL_INTERFACE $INTERNAL_ADDRESS up
	route add default gw $FIREWALL_ADDRESS
    route -n

	rm /etc/resolv.conf
    touch /etc/resolv.conf
    sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'

	echo "Internal setup complete!"
}

#--------- External Setup ---------
external_setup()
{
    dnf -y install hping3

	route add -net $INTERNAL_SUBNET gw $FORWARD_ADDRESS

	echo "External setup complete!"
}

firewall_rules()
{
    #--------- Set the default policies to DROP ---------
    iptables -P INPUT DROP
	iptables -P OUTPUT DROP
	iptables -P FORWARD DROP

	#--------- Set routing rules ---------
	iptables -A PREROUTING -t nat -i eno1 -j DNAT --to-destination $INTERNAL_ADDRESS

    #--------- Drop all packets destined for the firewall host from the outside ---------
	iptables -A INPUT -i $EXTERNAL_INTERFACE -d $FORWARD_ADDRESS -j DROP

    #--------- Do not accept any packets with a source address from the outside matching your internal network ---------
    iptables -A FORWARD -i $EXTERNAL_INTERFACE -s $INTERNAL_SUBNET -j DROP

    #--------- Do not allow Telnet packets at all ---------
    iptables -A FORWARD -p tcp --dport 23 -j DROP
    iptables -A FORWARD -p tcp --sport 23 -j DROP

    #--------- Drop all TCP packets with the SYN and FIN bit set ---------
    iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
	
	#--------- Drop all inbound/outbound packets from reserved port 0 ---------
    iptables -A FORWARD -p tcp --dport 0 -j DROP
    iptables -A FORWARD -p tcp --sport 0 -j DROP
    iptables -A FORWARD -p udp --dport 0 -j DROP
    iptables -A FORWARD -p udp --sport 0 -j DROP

    #--------- Drop inbound/outbound traffic to port 80 from source ports less than 1024 ---------
	iptables -A FORWARD -p tcp --dport 80 --sport 0:1023 -j DROP
    iptables -A FORWARD -p udp --dport 80 --sport 0:1023 -j DROP

    #--------- Inbound/Outbound TCP packets on allowed ports ---------
    iptables -A FORWARD -p tcp -m multiport --dport $TCP_PORT -j ACCEPT -m state --state NEW,ESTABLISHED
    iptables -A FORWARD -p tcp -m multiport --sport $TCP_PORT -j ACCEPT -m state --state NEW,ESTABLISHED

    #--------- Inbound/Outbound UDP packets on allowed ports ---------
	iptables -A PREROUTING -t nat -i eno1 -j DNAT --to-destination $INTERNAL_ADDRESS
	iptables -A FORWARD -p udp -m multiport --dport $UDP_PORT -j ACCEPT -m state --state NEW,ESTABLISHED
	iptables -A FORWARD -p udp -m multiport --sport $UDP_PORT -j ACCEPT -m state --state NEW,ESTABLISHED

    #--------- Inbound/Outbound ICMP packets based on type numbers ---------
    for pt in "${ICMP_TYPE[@]}"
    do
        iptables -A FORWARD -p icmp --icmp-type $pt -j ACCEPT -m state --state NEW,ESTABLISHED
    done

    #--------- Firewall rejects connections coming the "wrong" way (inbound SYN packets to high ports) ---------
	iptables -A FORWARD -p tcp --syn --dport 1024:65535 -j DROP

    # For FTP and SSH services, set control connections to "Minimum Delay" and FTP data to "Maximum Throughput"
    iptables -A PREROUTING -t mangle -p tcp -m multiport --sport 21,22 -j TOS --set-tos Minimize-Delay
    iptables -A PREROUTING -t mangle -p tcp -m multiport --sport 21 -j TOS --set-tos Maximize-Throughput

    iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

    #--------- Inbound/Outbound ssh packets ---------
	iptables -A FORWARD -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
	iptables -A FORWARD -p udp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
	iptables -A FORWARD -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
	iptables -A FORWARD -p udp --sport 22 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

	#--------- Inbound/Outbound www packets ---------
	iptables -A FORWARD -p tcp -m multiport --dport 53,80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
    iptables -A FORWARD -p udp -m multiport --dport 53,80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
	iptables -A FORWARD -p tcp -m multiport --sport 53,80,443 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    iptables -A FORWARD -p udp -m multiport --sport 53,80,443 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

    #--------- Enables ssh for demo ---------
    iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    iptables -A INPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

    iptables -A OUTPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
}

#--------- Run code ---------

if [ "$1" = "flush" ]
then
	flush
elif [ "$1" = "setup" ]
then
	firewall_setup
elif [ "$1" = "rules" ]
then
    firewall_rules
    echo "Firewall rules have been implemented!"
elif [ "$1" = "internal" ]
then
	internal_setup
elif [ "$1" = "external" ]
then
	external_setup
elif [ "$1" = "status1" ]
then
    iptables -L -n -v
elif [ "$1" = "status2" ]
then
	iptables -L -n -v -t nat
else
	echo "Error: invalid input"
fi
