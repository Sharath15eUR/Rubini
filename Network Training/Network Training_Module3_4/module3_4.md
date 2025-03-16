
# Assignment - 2

## Simulating a Small Network with Switches and Multiple Devices
![{E0DD393B-472B-4EAF-9E14-A0AA83E68A3B}](https://github.com/user-attachments/assets/90f96bb5-7daa-4e36-807b-32bdcbe654e1)

## Assigning the Static IP address to the 2 PCs
![{CDF7F3CF-CDCB-42CA-8EF2-B7E9685370B1}](https://github.com/user-attachments/assets/95b98e47-86b6-4c09-bc23-860c31921661)
![{5567FB64-1789-4B50-96FF-52DDE6CAD5C4}](https://github.com/user-attachments/assets/4278e8d8-a1af-4573-80ae-e44a98b7be00)

## Troubleshooting with ping command
![{2258F46E-0D1D-4777-B626-A4A708C848C5}](https://github.com/user-attachments/assets/105cd64f-60cb-41f0-b425-db0830e67e75)

## Observing the mac address table on the switch
![{B5EC6227-C31B-4326-84EF-C3B5ECAEE26E}](https://github.com/user-attachments/assets/e2bd091b-94aa-4d7a-a6cf-5de16fc42c6f)

## Capturing packets using Wireshark and inspecting the structure of the frames
![{CCE5F18D-2B3B-4175-937A-EC1E0965445F}](https://github.com/user-attachments/assets/ceda5be3-7eb3-408d-a164-d22cc61406d8)

## Configuring custome MAC address and static IP address
![{D7B5B201-D898-4DEF-A284-17C17584DEA5}](https://github.com/user-attachments/assets/89fdd56a-d2fe-4fe0-b1ad-e282835a926a)

## Troubleshooting ethernet communication using ping and traceroute command
![{2EB0613E-0E20-4E04-B25A-C4A5D83BF67E}](https://github.com/user-attachments/assets/4c005299-bbfc-44c4-b397-d8b7944c0b71)

If ping fails, then ensure ip address by ipconfig  correctly.
Traceroute is used to identify whether the packets are being transmitted or dropped.

## Linux Kernel's Handling of Ethernet Devices and Network Interfaces
### Configuration using ip command
ip link show - To check available network interfaces
ip link set eth0 up - To bring an interface up
ip addr add 192.168.1.100/24 dev eth0 - To assign an IP address

The kernel maintains a MAC address table can be viewed by ip link show or bridge fdb show
Packet capturing and analysis using tcpdump -i eth0

## Inspecting the mac address table
![{1A977FDD-F994-4DB7-AAE5-837D32ED6834}](https://github.com/user-attachments/assets/9b727bc7-831c-4277-b586-8604bea10759)
