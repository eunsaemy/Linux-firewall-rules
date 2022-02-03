#!/bin/bash

# EXTERNAL="192.168.0.13"
EXTERNAL="192.168.0.16"

# Outbound TCP packets on allowed ports (80, 443, 7000)
if [ "`hping3 $EXTERNAL -p 80 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 1.1: hping3 $EXTERNAL -p 80 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound TCP port 80 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 1.1: hping3 $EXTERNAL -p 80 -c 3 -S" >> internal_results.txt
    echo "Result: Accept outbound TCP port 80 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -p 443 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 1.2: hping3 $EXTERNAL -p 443 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound TCP port 443 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 1.2: hping3 $EXTERNAL -p 443 -c 3 -S" >> internal_results.txt
    echo "Result: Accept outbound TCP port 443 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -p 7000 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 1.3: hping3 $EXTERNAL -p 7000 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound TCP port 7000 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 1.3: hping3 $EXTERNAL -p 7000 -c 3 -S" >> internal_results.txt
    echo "Result: Accept outbound TCP port 7000 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# Outbound TCP packets on unallowed ports (7005, 8002)
if [ "`hping3 $EXTERNAL -p 7005 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 1.4: hping3 $EXTERNAL -p 7005 -c 3 -S" >> internal_results.txt
	echo "Result: Drop outbound TCP port 7005 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 1.4: hping3 $EXTERNAL -p 7005 -c 3 -S" >> internal_results.txt
    echo "Result: Drop outbound TCP port 7005 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -p 8002 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 1.5: hping3 $EXTERNAL -p 8002 -c 3 -S" >> internal_results.txt
	echo "Result: Drop outbound TCP port 8002 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 1.5: hping3 $EXTERNAL -p 8002 -c 3 -S" >> internal_results.txt
    echo "Result: Drop outbound TCP port 8002 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# Outbound UDP packets on allowed ports (53, 78, 9000)
if [ "`hping3 $EXTERNAL -2 -p 53 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 2.1: hping3 $EXTERNAL -2 -p 53 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound UDP port 53 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 2.1: hping3 $EXTERNAL -2 -p 53 -c 3 -S" >> internal_results.txt
    echo "Result: Accept outbound UDP port 53 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -2 -p 78 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 2.2: hping3 $EXTERNAL -2 -p 78 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound UDP port 78 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 2.2: hping3 $EXTERNAL -2 -p 78 -c 3 -S" >> internal_results.txt
    echo "Result: Accept outbound UDP port 78 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -2 -p 9000 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 2.3: hping3 $EXTERNAL -2 -p 9000 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound UDP port 9000 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 2.3: hping3 $EXTERNAL -2 -p 9000 -c 3 -S" >> internal_results.txt
    echo "Result: Accept outbound UDP port 9000 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# Outbound UDP packets on unallowed ports (7005, 8002)
if [ "`hping3 $EXTERNAL -2 -p 7005 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 2.4: hping3 $EXTERNAL -2 -p 7005 -c 3 -S" >> internal_results.txt
	echo "Result: Drop outbound UDP port 7005 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 2.4: hping3 $EXTERNAL -2 -p 7005 -c 3 -S" >> internal_results.txt
    echo "Result: Drop outbound UDP port 7005 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -2 -p 8002 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 2.5: hping3 $EXTERNAL -2 -p 8002 -c 3 -S" >> internal_results.txt
	echo "Result: Drop outbound UDP port 8002 PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 2.5: hping3 $EXTERNAL -2 -p 8002 -c 3 -S" >> internal_results.txt
    echo "Result: Drop outbound UDP port 8002 FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# Outbound ICMP packets based on type numbers
if [ "`hping3 $EXTERNAL -1 --icmptype 8 -c 3 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 3.1: hping3 $EXTERNAL -1 --icmptype 8 -c 3" >> internal_results.txt
	echo "Result: Accept outbound ICMP PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 3.1: hping3 $EXTERNAL -1 --icmptype 8 -c 3" >> internal_results.txt
    echo "Result: Accept outbound ICMP FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -1 --icmptype 13 -c 3 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 3.2: hping3 $EXTERNAL -1 --icmptype 13 -c 3" >> internal_results.txt
	echo "Result: Drop outbound ICMP PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 3.2: hping3 $EXTERNAL -1 --icmptype 13 -c 3" >> internal_results.txt
    echo "Result: Drop outbound ICMP FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# Drop all TCP packets with the SYN and FIN bit set
if [ "`hping3 $EXTERNAL -p 80 -c 3 -SF 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 4: hping3 $EXTERNAL -p 80 -c 3 -SF" >> internal_results.txt
	echo "Result: Drop outbound SYN,FIN PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 4: hping3 $EXTERNAL -p 80 -c 3 -SF" >> internal_results.txt
    echo "Result: Drop outbound SYN,FIN FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# Do not allow Telnet packets at all
if [ "`hping3 $EXTERNAL -p 23 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
    echo "Test 5: hping3 $EXTERNAL -p 23 -c 3 -S" >> internal_results.txt
	echo "Result: Drop outbound Telnet PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 5: hping3 $EXTERNAL -p 23 -c 3 -S" >> internal_results.txt
    echo "Result: Drop outbound Telnet FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# ------------------------------

# Accept outbound ssh packets
if [ "`hping3 $EXTERNAL -p 22 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
    echo "Test 6: hping3 $EXTERNAL -p 22 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound ssh packets PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
    echo "Test 6: hping3 $EXTERNAL -p 22 -c 3 -S" >> internal_results.txt
    echo "Result: Accept outbound ssh packets FAILED" >> internal_results.txt
    echo "" >> internal_results.txt
fi

# Accept outbound http packets
if [ "`hping3 $EXTERNAL -p 80 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
	echo "Test 7.1: hping3 $EXTERNAL -p 80 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound http packets PASSED" >> internal_results.txt
	echo "" >> internal_results.txt
else
	echo "Test 7.1: hping3 $EXTERNAL -p 80 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound http packets FAILED" >> internal_results.txt
	echo "" >> internal_results.txt
fi

# Accept outbound https packets
if [ "`hping3 $EXTERNAL -p 443 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
	echo "Test 7.2: hping3 $EXTERNAL -p 443 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound https packets PASSED"$'\r' >> internal_results.txt
    echo "" >> internal_results.txt
else
	echo "Test 7.2: hping3 $EXTERNAL -p 443 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound https packets FAILED"$'\r' >> internal_results.txt
	echo "" >> internal_results.txt
fi

# Accept outbound DNS packets
if [ "`hping3 $EXTERNAL -p 53 -c 3 -S 2>&1 | grep -o ' 0%'`" == " 0%" ]
then
	echo "Test 7.3: hping3 $EXTERNAL -p 53 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound DNS packets PASSED"$'\r' >> internal_results.txt
	echo "" >> internal_results.txt
else
	echo "Test 7.3: hping3 $EXTERNAL -p 53 -c 3 -S" >> internal_results.txt
	echo "Result: Accept outbound DNS packets FAILED"$'\r' >> internal_results.txt
	echo "" >> internal_results.txt
fi

# Drop outbound traffic to reserved port 0
if [ "`hping3 $EXTERNAL -p 0 -c 3 -S 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
	echo "Test 8.1: hping3 $EXTERNAL -p 0 -c 3 -S" >> internal_results.txt
	echo "Result: Drop outbound traffic to reserved port 0 (TCP) PASSED"$'\r' >> internal_results.txt
	echo "" >> internal_results.txt
else
	echo "Test 8.1: hping3 $EXTERNAL -p 0 -c 3 -S" >> internal_results.txt
	echo "Result: Drop outbound traffic to reserved port 0 (TCP) FAILED"$'\r' >> internal_results.txt
	echo "" >> internal_results.txt
fi

if [ "`hping3 $EXTERNAL -2 -p 0 -c 3 -A 2>&1 | grep -o ' 100%'`" == " 100%" ]
then
	echo "Test 8.2: hping3 $EXTERNAL -2 -p 0 -c 3 -A" >> internal_results.txt
	echo "Result: Drop outbound traffic to reserved port 0 (UDP) PASSED"$'\r' >> internal_results.txt
	echo "" >> internal_results.txt
else
	echo "Test 8.2: hping3 $EXTERNAL -2 -p 0 -c 3 -A" >> internal_results.txt
	echo "Result: Drop outbound traffic to reserved port 0 (UDP) FAILED"$'\r' >> internal_results.txt
	echo "" >> internal_results.txt
fi
