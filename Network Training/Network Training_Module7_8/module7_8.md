# Assignment 5

## 1) Test-Connection and nslookup commands for websites
#### Using Test-Connection command in windows
```bash
PS C:\Users\HP> Test-Connection -ComputerName google.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
DESKTOP-DE... google.com      142.250.205.238                                           32       170
DESKTOP-DE... google.com      142.250.205.238                                           32       23
DESKTOP-DE... google.com      142.250.205.238                                           32       20
DESKTOP-DE... google.com      142.250.205.238                                           32       22


PS C:\Users\HP> Test-Connection -ComputerName facebook.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
DESKTOP-DE... facebook.com    57.144.158.1                                              32       12
DESKTOP-DE... facebook.com    57.144.158.1                                              32       12
DESKTOP-DE... facebook.com    57.144.158.1                                              32       15
DESKTOP-DE... facebook.com    57.144.158.1                                              32       14


PS C:\Users\HP> Test-Connection -ComputerName amazon.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
DESKTOP-DE... amazon.com      52.94.236.248                                             32       306
DESKTOP-DE... amazon.com      52.94.236.248                                             32       380
DESKTOP-DE... amazon.com      52.94.236.248                                             32       413
DESKTOP-DE... amazon.com      52.94.236.248                                             32       306


PS C:\Users\HP> Test-Connection -ComputerName github.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
DESKTOP-DE... github.com      20.207.73.82                                              32       32
DESKTOP-DE... github.com      20.207.73.82                                              32       33
DESKTOP-DE... github.com      20.207.73.82                                              32       31
DESKTOP-DE... github.com      20.207.73.82                                              32       44


PS C:\Users\HP> Test-Connection -ComputerName cisco.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
DESKTOP-DE... cisco.com       72.163.4.185                                              32       341
DESKTOP-DE... cisco.com       72.163.4.185                                              32       309
DESKTOP-DE... cisco.com       72.163.4.185                                              32       322
DESKTOP-DE... cisco.com       72.163.4.185                                              32       347
```

### Using nslookup command in linux
```bash
vboxuser@SampleUbuntu:~$ nslookup google.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	google.com
Address: 142.250.205.238
Name:	google.com
Address: 2404:6800:4007:82d::200e

vboxuser@SampleUbuntu:~$ nslookup facebook.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	facebook.com
Address: 57.144.158.1
Name:	facebook.com
Address: 2a03:2880:f184:186:face:b00c:0:25de

vboxuser@SampleUbuntu:~$ nslookup amazon.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	amazon.com
Address: 54.239.28.85
Name:	amazon.com
Address: 52.94.236.248
Name:	amazon.com
Address: 205.251.242.103
** server can't find amazon.com: NXDOMAIN

vboxuser@SampleUbuntu:~$ nslookup github.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	github.com
Address: 20.207.73.82
** server can't find github.com: NXDOMAIN
vboxuser@SampleUbuntu:~$ nslookup cisco.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	cisco.com
Address: 72.163.4.185
Name:	cisco.com
Address: 2001:420:1101:1::185
```
## 2) Using Wireshark to capture and analyze DNS, TCP, UDP traffic
### Capturing DNS packets
![Screenshot 2025-03-17 115520](https://github.com/user-attachments/assets/b0808096-33c1-4ebd-88e8-6f13bc806d76)

### Capturing TCP packets
![{43C35AC7-B70B-4FCF-A65F-AACA20F3738D}](https://github.com/user-attachments/assets/c1b4d65c-5efd-4991-95e0-5dcfebd38ed8)

### Capturing UDP traffic
![Screenshot 2025-03-17 135610](https://github.com/user-attachments/assets/d957e8c5-ba40-47ff-8bbd-91ab37611cbc)

## 3) Analysing the traceroute parameter
```bash
C:\Users\HP>tracert google.com

Tracing route to google.com [142.250.67.174]
over a maximum of 30 hops:

  1    <1 ms    <1 ms    <1 ms  192.168.0.1
  2     3 ms     1 ms     1 ms  reliance.reliance [192.168.29.1]
  3     4 ms     3 ms     3 ms  10.249.128.1
  4     9 ms     8 ms     5 ms  172.31.0.209
  5     5 ms     4 ms     5 ms  192.168.68.144
  6     5 ms     5 ms     4 ms  172.26.77.166
  7     4 ms     3 ms     4 ms  172.26.77.131
  8     6 ms     5 ms     5 ms  192.168.68.130
  9     *        *        *     Request timed out.
 10     *        *        *     Request timed out.
 11     8 ms     6 ms     6 ms  72.14.217.254
 12     9 ms     6 ms     6 ms  216.239.43.137
 13     8 ms     8 ms     6 ms  142.250.63.172
 14   179 ms   196 ms   154 ms  72.14.232.50
 15    30 ms    30 ms    30 ms  216.239.48.64
 16    37 ms    32 ms    31 ms  192.178.110.111
 17    32 ms    32 ms    32 ms  142.250.227.75
 18    29 ms    29 ms    29 ms  bom12s07-in-f14.1e100.net [142.250.67.174]

Trace complete.
```

## 4) Setup trunk port between switches and Try ping between different VLANs.
![Screenshot 2025-03-17 145649](https://github.com/user-attachments/assets/91b0ea18-0a96-4e8b-8124-8559e89e4eda)
![Screenshot 2025-03-17 145610](https://github.com/user-attachments/assets/425302c6-49a0-4464-8335-a7a71f2e3175)



