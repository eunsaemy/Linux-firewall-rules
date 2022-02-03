#!/bin/bash

FIREWALL="192.168.1.1"

# Inbound TCP packets on allowed ports (80, 443, 7000)
if [ "`hping3 $FIREWALL -p 80 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 1.1: hping3 $FIREWALL -p 80 -c 3 -S" >> external_results.txt
	echo "Result: Accept outbound TCP port 80 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 1.1: hping3 $FIREWALL -p 80 -c 3 -S" >> external_results.txt
    echo "Result: Accept outbound TCP port 80 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -p 443 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 1.2: hping3 $FIREWALL -p 443 -c 3 -S" >> external_results.txt
	echo "Result: Accept outbound TCP port 443 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 1.2: hping3 $FIREWALL -p 443 -c 3 -S" >> external_results.txt
    echo "Result: Accept outbound TCP port 443 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -p 7000 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 1.3: hping3 $FIREWALL -p 7000 -c 3 -S" >> external_results.txt
	echo "Result: Accept outbound TCP port 7000 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 1.3: hping3 $FIREWALL -p 7000 -c 3 -S" >> external_results.txt
    echo "Result: Accept outbound TCP port 7000 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Inbound TCP packets on unallowed ports (7005, 8002)
if [ "`hping3 $FIREWALL -p 7005 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 1.4: hping3 $FIREWALL -p 7005 -c 3 -S" >> external_results.txt
	echo "Result: Drop outbound TCP port 7005 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 1.4: hping3 $FIREWALL -p 7005 -c 3 -S" >> external_results.txt
    echo "Result: Drop outbound TCP port 7005 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -p 8002 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 1.5: hping3 $FIREWALL -p 8002 -c 3 -S" >> external_results.txt
	echo "Result: Drop outbound TCP port 8002 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 1.5: hping3 $FIREWALL -p 8002 -c 3 -S" >> external_results.txt
    echo "Result: Drop outbound TCP port 8002 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Inbound UDP packets on allowed ports (53, 78, 9000)
if [ "`hping3 $FIREWALL -2 -p 53 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 2.1: hping3 $FIREWALL -2 -p 53 -c 3 -S" >> external_results.txt
	echo "Result: Accept outbound UDP port 53 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 2.1: hping3 $FIREWALL -2 -p 53 -c 3 -S" >> external_results.txt
    echo "Result: Accept outbound UDP port 53 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -2 -p 78 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 2.2: hping3 $FIREWALL -2 -p 78 -c 3 -S" >> external_results.txt
	echo "Result: Accept outbound UDP port 78 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 2.2: hping3 $FIREWALL -2 -p 78 -c 3 -S" >> external_results.txt
    echo "Result: Accept outbound UDP port 78 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -2 -p 9000 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 2.3: hping3 $FIREWALL -2 -p 9000 -c 3 -S" >> external_results.txt
	echo "Result: Accept outbound UDP port 9000 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 2.3: hping3 $FIREWALL -2 -p 9000 -c 3 -S" >> external_results.txt
    echo "Result: Accept outbound UDP port 9000 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Inbound UDP packets on unallowed ports (7005, 8002)
if [ "`hping3 $FIREWALL -2 -p 7005 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 2.4: hping3 $FIREWALL -2 -p 7005 -c 3 -S" >> external_results.txt
	echo "Result: Drop outbound UDP port 7005 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 2.4: hping3 $FIREWALL -2 -p 7005 -c 3 -S" >> external_results.txt
    echo "Result: Drop outbound UDP port 7005 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -2 -p 8002 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 2.5: hping3 $FIREWALL -2 -p 8002 -c 3 -S" >> external_results.txt
	echo "Result: Drop outbound UDP port 8002 PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 2.5: hping3 $FIREWALL -2 -p 8002 -c 3 -S" >> external_results.txt
    echo "Result: Drop outbound UDP port 8002 FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Inbound ICMP packets based on type numbers
if [ "`hping3 $FIREWALL -1 --icmptype 8 -c 3 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 3.1: hping3 $FIREWALL -1 --icmptype 8 -c 3" >> external_results.txt
	echo "Result: Accept outbound ICMP PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 3.1: hping3 $FIREWALL -1 --icmptype 8 -c 3" >> external_results.txt
    echo "Result: Accept outbound ICMP FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -1 --icmptype 13 -c 3 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 3.2: hping3 $FIREWALL -1 --icmptype 13 -c 3" >> external_results.txt
	echo "Result: Drop outbound ICMP PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 3.2: hping3 $FIREWALL -1 --icmptype 13 -c 3" >> external_results.txt
    echo "Result: Drop outbound ICMP FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Drop all TCP packets with the SYN and FIN bit set
if [ "`hping3 $FIREWALL -p 80 -c 3 -SF 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 4: hping3 $FIREWALL -p 80 -c 3 -SF" >> external_results.txt
	echo "Result: Drop inbound SYN,FIN PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 4: hping3 $FIREWALL -p 80 -c 3 -SF" >> external_results.txt
    echo "Result: Drop inbound SYN,FIN FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Do not allow Telnet packets at all
if [ "`hping3 $FIREWALL -p 23 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 5: hping3 $FIREWALL -p 23 -c 3 -S" >> external_results.txt
	echo "Result: Drop inbound Telnet PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 5: hping3 $FIREWALL -p 23 -c 3 -S" >> external_results.txt
    echo "Result: Drop inbound Telnet FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# ------------------------------

# Accept inbound ssh packets
if [ "`hping3 $FIREWALL -p 22 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 6: hping3 $FIREWALL -p 22 -c 3 -S" >> external_results.txt
	echo "Result: Accept inbound ssh packets PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 6: hping3 $FIREWALL -p 22 -c 3 -S" >> external_results.txt
    echo "Result: Accept inbound ssh packets FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Accept inbound http packets
if [ "`hping3 $FIREWALL -p 80 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 7.1: hping3 $FIREWALL -p 80 -c 3 -S" >> external_results.txt
	echo "Result: Accept inbound http packets PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 7.1: hping3 $FIREWALL -p 80 -c 3 -S" >> external_results.txt
    echo "Result: Accept inbound http packets FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Accept inbound https packets
if [ "`hping3 $FIREWALL -p 443 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 7.2: hping3 $FIREWALL -p 443 -c 3 -S" >> external_results.txt
	echo "Result: Accept inbound https packets PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 7.2: hping3 $FIREWALL -p 443 -c 3 -S" >> external_results.txt
    echo "Result: Accept inbound https packets FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Accept inbound DNS packets
if [ "`hping3 $FIREWALL -p 53 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 7.3: hping3 $FIREWALL -p 53 -c 3 -S" >> external_results.txt
	echo "Result: Accept inbound DNS packets PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 7.3: hping3 $FIREWALL -p 53 -c 3 -S" >> external_results.txt
    echo "Result: Accept inbound DNS packets FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Drop inbound traffic from source ports less than 1024
if [ "`hping3 $FIREWALL -s 1 -p 80 -k -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 8.1: hping3 $FIREWALL -s 1 -p 80 -k -c 3 -S" >> external_results.txt
	echo "Result: Drop inbound traffic from source ports less than 1024 (1) PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 8.1: hping3 $FIREWALL -s 1 -p 80 -k -c 3 -S" >> external_results.txt
    echo "Result: Drop inbound traffic from source ports less than 1024 (1) FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -s 1023 -p 80 -k -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 8.2: hping3 $FIREWALL -s 1023 -p 80 -k -c 3 -S" >> external_results.txt
	echo "Result: Drop inbound traffic from source ports less than 1024 (1023) PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 8.2: hping3 $FIREWALL -s 1023 -p 80 -k -c 3 -S" >> external_results.txt
    echo "Result: Drop inbound traffic from source ports less than 1024 (1023)" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -s 1024 -p 80 -k -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 8.3: hping3 $FIREWALL -s 1024 -p 80 -k -c 3 -S" >> external_results.txt
	echo "Result: Accept inbound traffic from source ports 1024 and greater (1024) PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 8.3: hping3 $FIREWALL -s 1024 -p 80 -k -c 3 -S" >> external_results.txt
    echo "Result: Accept inbound traffic from source ports 1024 and greater (1024) FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

# Drop inbound traffic to reserved port 0
if [ "`hping3 $FIREWALL -p 0 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 9.1: hping3 $FIREWALL -p 0 -c 3 -S" >> external_results.txt
	echo "Result: Drop inbound traffic to reserved port 0 (TCP) PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 9.1: hping3 $FIREWALL -p 0 -c 3 -S" >> external_results.txt
    echo "Result: Drop inbound traffic to reserved port 0 (TCP) FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -2 -p 0 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 9.2: hping3 $FIREWALL -2 -p 0 -c 3 -S" >> external_results.txt
	echo "Result: Drop inbound traffic to reserved port 0 (UDP) PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 9.2: hping3 $FIREWALL -2 -p 0 -c 3 -S" >> external_results.txt
    echo "Result: Drop inbound traffic to reserved port 0 (UDP) FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -s 0 -p 80 -k -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 9.3: hping3 $FIREWALL -s 0 -p 80 -k -c 3 -S" >> external_results.txt
	echo "Result: Drop inbound traffic from reserved port 0 (TCP) PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 9.3: hping3 $FIREWALL -s 0 -p 80 -k -c 3 -S" >> external_results.txt
    echo "Result: Drop inbound traffic from reserved port 0 (TCP) FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi

if [ "`hping3 $FIREWALL -2 -s 0 -p 78 -k -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 9.4: hping3 $FIREWALL -2 -s 0 -p 78 -k -c 3 -S" >> external_results.txt
	echo "Result: Drop inbound traffic from reserved port 0 (UDP) PASSED" >> external_results.txt
	echo "" >> external_results.txt
else
    echo "Test 9.4: hping3 $FIREWALL -2 -s 0 -p 78 -k -c 3 -S" >> external_results.txt
    echo "Result: Drop inbound traffic from reserved port 0 (UDP) FAILED" >> external_results.txt
    echo "" >> external_results.txt
fi
