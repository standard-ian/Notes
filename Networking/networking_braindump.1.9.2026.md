## Dump 3

All configuration examples here are in Cisco
#### Review
Every IP node needs:
1. Gateway
2. Netmask
3. IP address

Layer 3 Switches: Shodan, Glados, Core 1, Core 3

#### How to connect a network to a host:
Once we know what switchport is linked to a host via ethernet cables, we can configure the switchport. 
```
configure terminal 
//enters config mode
	interface $swport  
	//enters config mode for a specific interface
	  shutdown //take the interface down
	  description $desc  //set the description
	  switchport mode access  
	  switchport access vlan $vlan  //set the vlan
	  ip address $ip_address $mask //set ip address and mask
	  spanning-tree portfast  
	  ip access-group NoDHCP in  
	  switchport port-security aging time 7  
	  switchport port-security  
	  switchport port-security maximum 5  
	  ip arp inspection limit none  
	  ip verify source  
	  no shutdown
```
The variables `$` in the above are filled by the actual port, description, and vlan

1. Pick a switchport (I picked 48). This is `Gi1/0/48` Meaning Gigabit/0/Port Num
2. Switch must be `no shutdown` for interface to be active

## Dump 4
#### Ethernet
LAN Protocol
Specified Layers 1 and 2 
Link layer hasn't changed much but the physical is constantly evolving
PHY used to be bus based (2 conductors)

##### Ethernet Packet
1. Layer
2. Preamble (7 octets)
3. Start of Frame Delimiter (1 octet)
4. MAC Destination (6 octets)
5. MAC Source (6 octets)
6. 802.1Q tag (optional) (4 octets)
7. Ethertype or Length (IEEE 802.3 2 octets)
8. Payload (46-1500 octets)
9. Frame Check sequence (32 bit CRC (4 octets))
10. Interpacket Gap (12 octets)

##### Bridge Table
When receiving a frame on any port, "learn" that the source MAC address is associated with that port, and put it in the Bridge Table.

When forwarding a frame, look up the destination MAC address in the table, and transmit it on the associated port (but not if the port is the one from which this frame was received)

If not found in the table, then flood it to all the ports, except the one where this frame was received.

![[Screenshot 2026-01-09 at 8.55.26 PM.png]]
##### Spanning Tree
Each segment selects a "Designated Bridge" 

Each Bridge (other than root) selects a "Root Port"

Spanning Tree turns off (blocks) all the ports on a bridge, then turns on the root port and all ports having this bridge as the Designated Bridge.

###### There are variations on this:
- MSTP -- Handles multiple vlans in each spanning tree instance
    
- PVSTP (Cisco) -- Has a spanning tree instance for each vlan
    
- RSTP -- Rapid Spanning Tree -- subsecond convergence (vs ~50s) and proposed/agreement topology changes.  (vs “silence implies consent”)
    
- RootGuard, BPDUGuard, Portfast

#### Unicast Flooding 
![[Screenshot 2026-01-09 at 9.09.53 PM.png]]
An issue where traffic is routed in such a way traffic may reach hosts along the route from between two other hosts. If there is sensitive information, someone could be logging sensitive information by examining the ports.

Solutions? Use cryptography, Port Security, and avoid asymmetric paths in the LAN.

At PSU we configure traffic to take a specific path, unless a router goes down or something

Set Bridge Table timers to router's ARP timers to that most efficient routes are re-broadcast frequently. May have to dial in MAC address timeout and broadcast timeout.

#### Virtual LANs
![[Pasted image 20260109212248.png]]
VLANS define broadcast domains.
A VLAN could be configured to span multiple switches, but a "trunk" would be required to connect switches. Packets sent over these trunks would have a special header to indicate the intended VLAN.
Break up the total switch ports in a custom configuration.

Routers evolve from many routers to one for many switches, to the logic for routing disappearing into the chips within the switches themselves.
##### 802.1Q VLAN Tagging
![[Pasted image 20260109211938.png]]

##### Configuring VLANs on a switch
```
interface $swport  
  switchport mode access  
  switchport access vlan $vlan  
 

interface $swport
  switchport mode trunk
  switchport trunk allowed vlan 7,3967
```
Then configuring switchports to be on that VLAN
```
set interfaces ge-4/0/47 description "caplab04.ece.pdx.edu_[60-04_C-614]"
set interfaces ge-4/0/47 unit 0 family ethernet-switching interface-mode access
set interfaces ge-4/0/47 unit 0 family ethernet-switching vlan members 1212
set interfaces ae0 unit 0 family ethernet-switching interface-mode trunk
set interfaces ae0 unit 0 family ethernet-switching vlan members all
```

#### Link Aggregation
Ensures a "conversation" stays on one link to avoid out of order delivery. Splits traffic using a hashing function.
All of the physical links on each end of the aggregate link must have the same bridge-id

##### To Configure
- Tell the switch you want each physical interface in a particular aggregate
```
interface TenGigabitEthernet1/1
 description shodan
 switchport trunk allowed vlan 1-3992,3994-4094
 switchport mode trunk
 channel-group 13 mode active
```    
- Configure the aggregate
```
interface TenGigabitEthernet1/3
 description shodan
 switchport trunk allowed vlan 1-3992,3994-4094
 switchport mode trunk
 channel-group 13 mode active

```    
- Cisco:  Configure the members identical to the aggregate
```
interface Port-channel13
 switchport
 switchport trunk allowed vlan 1-3992,3994-4094
 switchport mode trunk
```

- Tell the switch you want each physical interface in a particular aggregateA
```
set interfaces xe-0/2/3 ether-options 802.3ad ae0
set interfaces xe-6/2/3 ether-options 802.3ad ae0
```
    
- Configure the aggregate
```
set interfaces ae0 description "link to radiant"
set interfaces ae0 aggregated-ether-options minimum-links 1
set interfaces ae0 aggregated-ether-options link-speed 10g
set interfaces ae0 aggregated-ether-options lacp passive
set interfaces ae0 aggregated-ether-options lacp periodic fast
set interfaces ae0 unit 0 family ethernet-switching interface-mode trunk
set interfaces ae0 unit 0 family ethernet-switching vlan members all
```
#### Summary 
- Ethernet defines networks at physical and link layers.
    
- Learning bridges track which MAC addresses are on which ports, and store this information in the Bridge Table
    
- Spanning Tree handles loops
    
- Unicast flooding is a thing
    
- Vlans define broadcast domains
    
- 802.1Q tags frames to let multiple vlans use the same link.
    
- LACP lets us use multiple PHY to make one logical link.

## Dump 5
#### Internet Protocol 
Packet switched network.
Packet is a datagram.

IP moves datagrams through an internet.
Each router looks at a packet and uses it's route table and the destination MAC to know what is the next hop.

There is a counter that is decremented IPV4 Time to Live or IPV6 Hop Limit, when it is 0, the datagram is dropped.

Round trips are two way problems (except for stateful firewalls and NATs)

#### IPV4
![[Pasted image 20260123193622.png]]
#### IPV6
![[Pasted image 20260123193642.png]]
#### Fragmentation
An intermediate node may fragment a packet
Assembly only happens at the final destination. The Identification field and fragment offset are used to reassemble.
#### IPv4 Classes (Now deprecated, replaced by CIDR)
- A:  0xxxxxxx `(1-126).*.*.*/8` was for really big sites
- B: 10xxxxxx `(128-191).*.*.*/16` was for medium sites (like PSU)
- C: 110xxxxx `(192-223).*.*.*/24` was for small sites
- D: 1110xxxx `(224-240).*.*.*` is multicast
- E: 1111xxxx `(241-255).*.*.*` is Experimental

##### Special
- `127.0.0.0/8` – loopback (in case you need 16k localhosts)
- `169.254.0.0/16` – link local
- `224.0.0.0/24` – link local multicast
- `255.255.255.255/32` – broadcast
Directed broadcast has been significantly curtailed to prevent DDoS
##### Private
- `10.0.0.0/8`
- `172.16.0.0/12`
- `192.168.0.0/16`

#### IPv6 Addresses
128 bit addresses, separated into 8 :-separated groups of 4 hex digits
:: means fill with 0-groups

8+8 separates network location from network identity
standard netmask is /64
`fe80::/10` is link-local
`fe80::1/10` is PSU's local
`::1` is loopback

`2610:10::/32` is PSU's IPv6 assignment

MCECS uses `2610:10:20:208`

#### Subnetting 
An IP address is just a 32 bit or 128 but number, but it also encodes network topology and endpoint ID

#### Assistive Protocols
##### ARP (Address Resolution Protocol) 
ARP probe asks for MAC
ARP reply answers
Gratuitous ARP is an ARP reply with no ask
When a host is assigned an IP on a network, it broadcasts it and if it gets no replies, it can use that IP-MAC mapping
System caches use these arp mappings
`arp-an` to see ARP cach
##### Neighbor Discovery
Neighbor solicutation/advertising
`ip neighbor` on linux

#### Encapsulation and Stack
![[Pasted image 20260123200819.png]]
#### "Conversation"
![[Pasted image 20260123201358.png]]

#### NAT (Network Address Translation)
Replaces source or destination addresses in each packet (return ops get the reverse)
NAT with PAT allows many to 1, so many may internal hosts can share 1 address

#### Review
1. IP is the packet switched protocol used on the internet
2. Packet headers have fields and options
3. Fragmentation is a thing (in IPv4)
4. ARP and neighbor discovery map IP addresses to layer-2 addresses
5. Higher-stack protocols are encapsulated as the payload for lower-stack protocols.
6. Subnetting lets us encode network topology into an IP address.
7. NAT exists and is, unfortunately, useful.

8. IETF - Internet Engineering Task Force
9. IANA  - Internet Assigned Number Authority
10. IESG - Internet Engineering Steering Group
11. IP - Internet Protocol
12. Internet - The big network of networks we all love.
13. internet - any network that uses IP
14. IP Header - Part of a datagram that is used to route the datagram across the Network.
15. Datagram - An IP Packet of data.
16. RFC - Request For Comments - Working documents of the IETF.
17. IPv4 Address Exhaustion - running out of IPv4 addresses

## Dump 6
#### Terminal Control Protocol (TCP)
Provides 2-way stream of data to the application layer

Used by higher level protocols like ssh, http(s), etc

![[Pasted image 20260123202823.png]]

#### Common Flags
SYN - synchronize
ACK - all but first packet
Read RFCs for others

#### TCP Connection Table
```
Active Internet connections (including servers)
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)    
tcp4       0      0  10.200.10.69.55711     192.178.163.95.443     ESTABLISHED
tcp4       0      0  10.200.10.69.55710     192.178.163.95.443     ESTABLISHED
tcp4       0      0  10.200.10.69.55709     151.101.129.91.443     ESTABLISHED
tcp4       0      0  10.200.10.69.55708     74.125.195.113.443     ESTABLISHED
tcp4       0      0  10.200.10.69.55699     151.101.193.91.443     ESTABLISHED
tcp4       0      0  10.200.10.69.55697     172.253.117.95.443     ESTABLISHED
tcp4       0      0  10.200.10.69.55696     172.253.117.95.443     ESTABLISHED
tcp4       0      0  10.200.10.69.55692     34.107.243.93.443      ESTABLISHED
tcp4       0      0  10.200.10.69.55689     74.125.135.94.443      ESTABLISHED
tcp4       0      0  10.200.10.69.55687     108.177.98.95.443      ESTABLISHED
tcp4       0      0  10.200.10.69.55686     192.178.163.102.443    ESTABLISHED
tcp4       0      0  10.200.10.69.55685     108.177.98.95.443      ESTABLISHED
tcp6       0      0  *.55405                *.*                    LISTEN     
tcp4       0      0  *.55405                *.*                    LISTEN     
tcp4       0      0  10.232.42.3.54528      10.0.70.105.445        ESTABLISHED
tcp6       0      0  fe80::f87b:841e:.1025  fe80::d25c:4958:.1026  ESTABLISHED
tcp6       0      0  fe80::f87b:841e:.1024  fe80::d25c:4958:.1024  ESTABLISHED
```

#### Connection Setup
Need a 3 way handshake to first make sure packets will not get lost.
1. SYN
2. SYN | ACK
3. ACK
![[Pasted image 20260123203602.png]]

Sliding connection window, wait until you receive the ACK from the segment sent three segments ago. If the packets or the ACKs get lost, wait more before transmitting more. 

Track the time rate it takes for ACKs to come back, delay a little bit to maintain the same # of packets it takes to get ACKs. If all devices use the algorithm an equilibrium will be realized.

FIN|ACK sent when connection can all the packets are sent. Both sides send a mutual FIN and ACK to each other's FIN

RST could be sent if there is an error or a reboot or something where TCP caches are cleared out

#### TCP Throughput
$$\frac{9.77Max\ Seg\ Size}{Round\ Trip\ Time\sqrt{loss}}$$

Because of physical limitations, it is difficult to get faster than $\frac{2}{3}$ the speed of light.

Bigger windows on hosts can improve throughput, but this requires more memory to be allocated. Now, Kernels automatically scale window size.
$$\frac{Window\ Size}{RTT}$$
The default maximum TCP window size is 65,535 bytes (or 64 KiB)

#### PMTU
![[Pasted image 20260123205440.png]]
#### Connection Hijacking
TCP Packets could be vulnerable. If you could see the size of a packet and forge a response, you could take over an existing connection.
Avoid using vulnerable protocols like Telnet, and keep people off your local network!


#### NAT, PAT, and Stateful Firewalls
Keep an extended connection table
Modify TCP & IP packets "in flight"
The NATing device has a tab to hold all this information
This has extended the live of IPv4!