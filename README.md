## Mange Firewall Rules on Linux by Using Iptables

Design, implement, and test a firewall for Linux that will implement the following rules:
- Inbound/Outbound TCP packets on allowed ports
- Inbound/Outbound UDP packets on allowed ports
- Inbound/Outbound ICMP packets based on type numbers
- Drop all packets destined for the firewall host from the outside
- Do not accept any packets with a source address from the outside matching your internal network
- You must ensure the firewall rejects those connections that are coming the "wrong" way
- Accept all TCP packets that belong to an existing connection (on allowed ports)
- Drop all TCP packets with the SYN and FIN bit set
- Do not allow Telnet packets at all
- For FTP and SSH services, set control connections to "Minimum Delay" and FTP data to "Maximum Throughput"

- Permit inbound/outbound ssh packets
- Permit inbound/outbound www packets
- Drop inbound traffic to port 80 (http) from source ports less than 1024
- Drop all incomfing packets from reserved port 0 as well as outbound traffic to port 0

### Configuration:
config.sh:
FORWARD_ADDRESS -> IP address of the firewall machine
EXTERNAL -> IP address of the external machine

outbound_test.sh:
EXTERNAL -> IP address of the external machine

### To set-up firewall machine:
./firewall.sh setup

### To set firewall rules:
./firewall.sh rules

### To reset firewall rules to default:
./firewall.sh flush

### To check iptables
./firewall.sh status1

### To set-up external machine:
./firewall.sh external

### To set-up internal machine:
./firewall.sh internal
