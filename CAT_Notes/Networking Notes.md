##### Cable Cabinet
Blue 3-4'
Grey 5-6
Green 7'
White 10'
Yellow 12-26A'

##### Wiring Closet Rules:
FInd correct jack, chose free switchport. Start on edge, work to middle. Use correct length
Don't litter
Keep secure
Let us know if you break stuff
No sleeping
Don't tamper with cameras
Don't bump into stuff
Use good judgement
Respect telecom wires

##### MCECS Network structure
2x Virtual Chassis (GLADOS) One feeds FAB, one feeds EB closets. These go to layer 3 servers w/ opnsense between
Network routing be from core1 or core3 without interruption. 
Firewalls separate these from "Sweety" and "Skaldi" which route to the entire internet (public facing IP 131.252)
Core 1 and Core 3 are shared between Wireless, MCECS, Data Center, Campus as a whole
Intranet is part of the user-facing part of network_db