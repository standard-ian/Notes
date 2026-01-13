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
