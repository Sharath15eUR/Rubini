# Assignment - 1

## Question 1 : Copying a Folder with Multiple Files to a Destination (SCP, cp)

### Copy folder within the local machine:
```bash
oxuser@SampleUbuntu:~/Documents/network_training$ touch file.txt
vboxuser@SampleUbuntu:~/Documents/network_training$ cp file.txt copy_file.txt
vboxuser@SampleUbuntu:~/Documents/network_training$ ls
copy_file.txt  file.txt
```

### Copy directory within the local machine:
```bash
vboxuser@SampleUbuntu:~/Documents$ cp -r linux_training/module_1/ copy_of_module1/
vboxuser@SampleUbuntu:~/Documents$ ls
Command_for_output_and_error_redirection.txt  find3
copy_of_module1                               learning
error_output_redirection                      lg.txt
error_redirection                             linux_training
error.txt                                     ls_l_redirection.txt
find1                                         network_training
find1.txt                                     outputredirection
find2                                         qn1.txt
vboxuser@SampleUbuntu:~/Documents$ cd copy_of_module1/
vboxuser@SampleUbuntu:~/Documents/copy_of_module1$ ls
qn1.txt  qn2.txt  qn3  qn5
```

### Copy files from local machine to remote server
```bash
vboxuser@SampleUbuntu:~/Documents$ scp -r learning/ 21bcs149@172.16.16.200:/run/media/root/Data/student/cse/ug/be2021/c/21bcs149/

*************************************

     Welcome to MEPCOLINUX

*************************************
      Keep Your Password Secure
*************************************


21bcs149@172.16.16.200's password: 
ex2.txt                                     100%   14     4.2KB/s   00:00    
file1.txt                                   100%   25    12.5KB/s   00:00    
file2.txt                                   100%   20     9.8KB/s   00:00    
sample.txt                                  100%   16     2.2KB/s   00:00    
ss_ex1.txt                                  100%   13     4.2KB/s   00:00    
softlink                                    100%   11     2.0KB/s   00:00    
vi                                          100%   17     5.3KB/s   00:00    
sample.txt                                  100%   11     2.9KB/s   00:00    
file                                        100%   11     0.9KB/s   00:00    
touch                                       100%   11     2.6KB/s   00:00    
qn1.txt                                     100%   11     1.1KB/s   00:00    
learning/soft-link.txt: No such file or directory
ex1.txt                                     100%   13     0.6KB/s   00:00 
vboxuser@SampleUbuntu:~/Documents$
```

## Question 2 : Host a FTP and SFTP server using PUT and GET commands.

### FTP 
```bash
vboxuser@SampleUbuntu:~$ ftp 127.0.0.1
Connected to 127.0.0.1.
220 (vsFTPd 3.0.5)
Name (127.0.0.1:vboxuser): vboxuser
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> put /home/vboxuser/Documents/ftp_transfer.txt
local: /home/vboxuser/Documents/ftp_transfer.txt remote: /home/vboxuser/Documents/ftp_transfer.txt
229 Entering Extended Passive Mode (|||42762|)
150 Ok to send data.
     0        0.00 KiB/s 
226 Transfer complete.
ftp> get ftp_transfer.txt
local: ftp_transfer.txt remote: ftp_transfer.txt
229 Entering Extended Passive Mode (|||54717|)
150 Opening BINARY mode data connection for ftp_transfer.txt (0 bytes).
     0        0.00 KiB/s 
226 Transfer complete.
ftp> ls
229 Entering Extended Passive Mode (|||27671|)
150 Here comes the directory listing.
drwxr-xr-x    2 1000     1000         4096 Jan 20 14:27 Desktop
drwxrwxrwx    6 1000     1000         4096 Feb 26 13:00 Documents
drwxr-xr-x    2 1000     1000         4096 Jan 31 09:21 Downloads
drwxr-xr-x    2 1000     1000         4096 Jan 20 14:27 Music
drwxr-xr-x    2 1000     1000         4096 Jan 20 14:27 Pictures
drwxr-xr-x    2 1000     1000         4096 Jan 20 14:27 Public
drwxr-xr-x    2 1000     1000         4096 Jan 20 14:27 Templates
drwxr-xr-x    2 1000     1000         4096 Jan 20 14:27 Videos
drwxrwxr-x    2 1000     1000         4096 Jan 30 10:05 backup
-rwxrwxrwx    1 1000     1000         2606 Jan 30 10:10 backup_manager.sh
-rw-rw-r--    1 1000     1000          202 Feb 02 18:19 error_output_redirection
-rw-rw-r--    1 1000     1000           99 Feb 02 19:39 errors.log
-rwxrwxrwx    1 1000     1000          168 Feb 17 17:00 file.sh
-rwxrwxrwx    1 1000     1000         4066 Feb 02 19:34 file_analyzer.sh
-rw-r--r--    1 1000     1000            0 Feb 26  2025 ftp_transfer.txt
-rw-rw-r--    1 1000     1000          177 Feb 02 18:19 outputredirection
drwxrwxr-x    2 1000     1000         4096 Jan 30 10:03 s
drwx------    4 1000     1000         4096 Jan 20 14:33 snap
drwxrwxr-x    2 1000     1000         4096 Jan 30 07:42 source
226 Directory send OK.
ftp> exit
221 Goodbye.
```

### SFTP
```bash
vboxuser@SampleUbuntu:~$ sftp 21bcs149@172.16.16.200

*************************************

     Welcome to MEPCOLINUX

*************************************
      Keep Your Password Secure
*************************************


21bcs149@172.16.16.200's password: 
Connected to 172.16.16.200.
sftp> cd /run/media/root/Data/student/cse/ug/be2021/c/21bcs149/
sftp> put -r /user/vboxuser/Documents/ftp_transfer.txt
stat /user/vboxuser/Documents/ftp_transfer.txt: No such file or directory
sftp> put -r /home/vboxuser/Documents/ftp_transfer.txt
Uploading /home/vboxuser/Documents/ftp_transfer.txt to /run/media/root/Data/student/cse/ug/be2021/c/21bcs149/ftp_transfer.txt
ftp_transfer.txt                            100%    0     0.0KB/s   00:00    
sftp> ls
datascienceqn.txt  ftp_transfer.txt   java               learning           
lisp.txt           sample             sem1               sem2               
sem3               sem4               sem5               sem7               
vboxuser           
sftp> get ftp_transfer.txt
Fetching /run/media/root/Data/student/cse/ug/be2021/c/21bcs149/ftp_transfer.txt to ftp_transfer.txt
sftp> exit
```

## Question 3 : Explore with Wireshark/TCP-dump/cisco packet tracer tools and learn about packets filters

### Packet filters using Wireshark
#### Capturing icmp Packets
![Screenshot (600)](https://github.com/user-attachments/assets/ce7cf8be-baa1-4ec2-a6fa-a7f02d8c066b)
#### Capturing arp Packets
![Screenshot (601)](https://github.com/user-attachments/assets/315b0f18-647b-40b7-a23f-48d762034251)
#### Capturing tcp Packets
![Screenshot (602)](https://github.com/user-attachments/assets/2c7ef66e-24c4-4d21-8047-475ee0d3e2b7)

### Packet filters using tcpdump
```bash
vboxuser@SampleUbuntu:~$ sudo tcpdump -i enp0s3
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), snapshot length 262144 bytes
14:04:34.872386 IP lb-140-82-112-25-iad.github.com.https > SampleUbuntu.59456: Flags [P.], seq 470980721:470980747, ack 559535617, win 65535, length 26
14:04:34.872677 IP SampleUbuntu.59456 > lb-140-82-112-25-iad.github.com.https: Flags [P.], seq 1:31, ack 26, win 65535, length 30
14:04:34.873948 IP lb-140-82-112-25-iad.github.com.https > SampleUbuntu.59456: Flags [.], ack 31, win 65535, length 0
14:04:34.889411 IP6 SampleUbuntu.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)? _ipp._tcp.local. PTR (QM)? _ipps._tcp.local. (45)
14:04:34.890226 IP SampleUbuntu.mdns > mdns.mcast.net.mdns: 0 [2q] PTR (QM)? _ipp._tcp.local. PTR (QM)? _ipps._tcp.local. (45)
14:04:34.908631 IP SampleUbuntu.41065 > 172.16.16.1.domain: 13524+ PTR? 15.2.0.10.in-addr.arpa. (40)
14:04:34.919010 IP 172.16.16.1.domain > SampleUbuntu.41065: 13524 NXDomain* 0/0/0 (40)
14:04:34.919854 IP SampleUbuntu.39751 > 172.16.16.1.domain: 24825+ PTR? 25.112.82.140.in-addr.arpa. (44)
14:04:34.993390 IP 172.16.16.1.domain > SampleUbuntu.39751: 24825 1/0/0 PTR lb-140-82-112-25-iad.github.com. (89)
14:04:34.999290 IP SampleUbuntu.36945 > 172.16.16.1.domain: 6363+ PTR? b.f.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.2.0.f.f.ip6.arpa. (90)
14:04:35.011976 IP 172.16.16.1.domain > SampleUbuntu.36945: 6363 NXDomain* 0/0/0 (90)
14:04:35.042818 IP SampleUbuntu.36170 > 172.16.16.1.domain: 4790+ PTR? 251.0.0.224.in-addr.arpa. (42)
14:04:35.543815 IP 172.16.16.1.domain > SampleUbuntu.36170: 4790 1/0/0 PTR mdns.mcast.net. (70)
14:04:35.544732 IP SampleUbuntu.58587 > 172.16.16.1.domain: 23040+ PTR? 1.16.16.172.in-addr.arpa. (42)
14:04:35.545690 IP 172.16.16.1.domain > SampleUbuntu.58587: 23040 NXDomain* 0/0/0 (42)
14:04:42.053030 IP SampleUbuntu.48404 > 82.221.107.34.bc.googleusercontent.com.http: Flags [.], ack 606848276, win 63966, length 0
14:04:42.053728 IP SampleUbuntu.48402 > 82.221.107.34.bc.googleusercontent.com.http: Flags [.], ack 606784358, win 63884, length 0
14:04:42.053997 IP 82.221.107.34.bc.googleusercontent.com.http > SampleUbuntu.48404: Flags [.], ack 1, win 65535, length 0
14:04:42.054672 IP 82.221.107.34.bc.googleusercontent.com.http > SampleUbuntu.48402: Flags [.], ack 1, win 65535, length 0
14:04:42.099021 IP SampleUbuntu.48265 > 172.16.16.1.domain: 61772+ PTR? 82.221.107.34.in-addr.arpa. (44)
14:04:42.111505 IP 172.16.16.1.domain > SampleUbuntu.48265: 61772 1/0/0 PTR 82.221.107.34.bc.googleusercontent.com. (96)
14:04:51.748694 IP SampleUbuntu.47329 > alphyn.canonical.com.ntp: NTPv4, Client, length 48
14:04:51.818763 IP SampleUbuntu.46859 > 172.16.16.1.domain: 63893+ PTR? 157.91.189.91.in-addr.arpa. (44)
14:04:52.005847 IP alphyn.canonical.com.ntp > SampleUbuntu.47329: NTPv4, Server, length 48
14:04:52.282788 IP SampleUbuntu.48404 > 82.221.107.34.bc.googleusercontent.com.http: Flags [.], ack 1, win 63966, length 0
14:04:52.284490 IP SampleUbuntu.48402 > 82.221.107.34.bc.googleusercontent.com.http: Flags [.], ack 1, win 63884, length 0
14:04:52.285041 IP 82.221.107.34.bc.googleusercontent.com.http > SampleUbuntu.48404: Flags [.], ack 1, win 65535, length 0
14:04:52.290140 IP 82.221.107.34.bc.googleusercontent.com.http > SampleUbuntu.48402: Flags [.], ack 1, win 65535, length 0
14:04:52.296806 IP 172.16.16.1.domain > SampleUbuntu.46859: 63893 1/0/0 PTR alphyn.canonical.com. (78)
^C
29 packets captured
29 packets received by filter
0 packets dropped by kernel

vboxuser@SampleUbuntu:~$ sudo tcpdump -D
1.enp0s3 [Up, Running, Connected]
2.any (Pseudo-device that captures on all interfaces) [Up, Running]
3.lo [Up, Running, Loopback]
4.bluetooth-monitor (Bluetooth Linux Monitor) [Wireless]
5.nflog (Linux netfilter log (NFLOG) interface) [none]
6.nfqueue (Linux netfilter queue (NFQUEUE) interface) [none]
7.dbus-system (D-Bus system bus) [none]
8.dbus-session (D-Bus session bus) [none]
```
## Question 4 : Understand linux utility commands like - ping, arp (Understand each params from ifconfig output)

### ping command by limiting the packets
```bash
vboxuser@SampleUbuntu:~$ ping -c 4 google.com
PING google.com (142.250.193.174) 56(84) bytes of data.
64 bytes from maa05s26-in-f14.1e100.net (142.250.193.174): icmp_seq=1 ttl=58 time=10.7 ms
64 bytes from maa05s26-in-f14.1e100.net (142.250.193.174): icmp_seq=2 ttl=58 time=12.2 ms
64 bytes from maa05s26-in-f14.1e100.net (142.250.193.174): icmp_seq=3 ttl=58 time=12.4 ms
64 bytes from maa05s26-in-f14.1e100.net (142.250.193.174): icmp_seq=4 ttl=58 time=10.7 ms

--- google.com ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3005ms
rtt min/avg/max/mdev = 10.679/11.502/12.422/0.820 ms
```

### arp command
```bash
vboxuser@SampleUbuntu:~$ arp -a
_gateway (10.0.2.2) at 52:54:00:12:35:02 [ether] on enp0s3
```

### ifconfig command
```bash
vboxuser@SampleUbuntu:~$ ifconfig -a
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::c57:94f7:8c5a:b94d  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:66:5a:92  txqueuelen 1000  (Ethernet)
        RX packets 118630  bytes 154819232 (154.8 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 26063  bytes 15974690 (15.9 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 1891  bytes 195454 (195.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1891  bytes 195454 (195.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

## Question 5 : Understand what happens when duplicate IPs configured in a network.

When two devices are assigned the same IP address in a network, it causes an IP address address conflict by misdelivering the packets to the wrong device.
Issues are
1) ARP Table Confusion :  The ARP table will keep updating, creating network instability.
2) Security Vulnerability: Duplicate IPs can be exploited for Man-in-the-Middle (MITM) attacks.
3) Network Disconnection: One or both devices with duplicate IPs will lose network connectivity.
4) Data Misdelivery: Data packets may be delivered to the wrong device, causing communication errors.

Solution : By using DHCP which can automatically assign unique IPs.

## Question 6 : Understand how to access remote system using (VNC viewer, Anydesk, teamviewer and remote desktop connections)

### VNC Viewer :
1) Install VNC Server on the remote system and VNC Viewer on your system.
2) Start the VNC server and note down the IP Address and Port Number.
3) Open VNC Viewer, enter the IP Address:Port Number (192.168.1.10:5900).
4) Enter the password to access the remote system.

### AnyDesk :
1) Install AnyDesk on both systems.
2) Open AnyDesk and note the AnyDesk ID of the remote system.
3) Enter the remote system's AnyDesk ID on your system.
4) Accept the connection request from the remote system.

## Question 7 : How to check your default gateway is reachable or not and understand about default gateway.
```bash
vboxuser@SampleUbuntu:~$ ip route
default via 10.0.2.2 dev enp0s3 proto dhcp metric 100 
10.0.2.0/24 dev enp0s3 proto kernel scope link src 10.0.2.15 metric 100 
169.254.0.0/16 dev enp0s3 scope link metric 1000 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ ip route | grep default
default via 10.0.2.2 dev enp0s3 proto dhcp metric 100 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ ping -c 2 10.0.2.2
PING 10.0.2.2 (10.0.2.2) 56(84) bytes of data.
64 bytes from 10.0.2.2: icmp_seq=1 ttl=64 time=0.750 ms
64 bytes from 10.0.2.2: icmp_seq=2 ttl=64 time=0.394 ms

--- 10.0.2.2 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1046ms
rtt min/avg/max/mdev = 0.394/0.572/0.750/0.178 ms
```
## Question 8 : Check iwconfig/ifconfig to understand in detail about network interfaces (check about interface speed, MTIJ and other parameters)
```bash
vboxuser@SampleUbuntu:~$ ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::c57:94f7:8c5a:b94d  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:66:5a:92  txqueuelen 1000  (Ethernet)
        RX packets 119041  bytes 154951741 (154.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 26413  bytes 16073149 (16.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 1957  bytes 201636 (201.6 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1957  bytes 201636 (201.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ ifconfig lo:
lo:: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        loop  txqueuelen 1000  (Local Loopback)

vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ ifconfig enp0s3
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::c57:94f7:8c5a:b94d  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:66:5a:92  txqueuelen 1000  (Ethernet)
        RX packets 119041  bytes 154951741 (154.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 26413  bytes 16073149 (16.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ ifconfig lo
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 1957  bytes 201636 (201.6 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1957  bytes 201636 (201.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
## Question 9 : Log in to your home router's web interface (usually at 192.168.1.1 or 192.168.0.1) and check the connected devices list.

1) Open our browser and type the Gateway IP (192.168.1.1) to access the router's web interface.
2) Enter the Username and Password (admin/password).
3) Go to Status, Wireless, or Device List section (depending on our router model).
4) It will show the list of connected devices with IP Address, MAC Address, and Device Name.

## Question 10 : Explain how a DHCP server assigns IP addresses to devices in your network.

The DORA process is used by DHCP (Dynamic Host Configuration Protocol) to assign IP addresses automatically to devices in a network.

1) D – Discovery: The client device sends a DHCP Discover message to find available DHCP servers in the network.
2) O – Offer: The DHCP server replies with a DHCP Offer message containing an available IP address and network configuration details.
3) R – Request: The client sends a DHCP Request message to the server, asking to assign the offered IP address.
4) A – Acknowledgement: The DHCP server sends a DHCP Acknowledgement (ACK) confirming the IP address assignment along with other configurations like Subnet Mask, Gateway, and DNS.

### Show assigned ip address 
```bash
vboxuser@SampleUbuntu:~$ ip a | grep inet
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3
    inet6 fe80::c57:94f7:8c5a:b94d/64 scope link noprefixroute
```

### Shows DHCP and gateway information
```bash
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ nmcli device show
GENERAL.DEVICE:                         enp0s3
GENERAL.TYPE:                           ethernet
GENERAL.HWADDR:                         08:00:27:66:5A:92
GENERAL.MTU:                            1500
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     Wired connection 1
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/Activ>
WIRED-PROPERTIES.CARRIER:               on
IP4.ADDRESS[1]:                         10.0.2.15/24
IP4.GATEWAY:                            10.0.2.2
IP4.ROUTE[1]:                           dst = 10.0.2.0/24, nh = 0.0.0.0, mt =>
IP4.ROUTE[2]:                           dst = 169.254.0.0/16, nh = 0.0.0.0, m>
IP4.ROUTE[3]:                           dst = 0.0.0.0/0, nh = 10.0.2.2, mt = >
IP4.DNS[1]:                             172.16.16.1
IP4.DOMAIN[1]:                          upsvr.mepcoeng.ac.in
IP6.ADDRESS[1]:                         fe80::c57:94f7:8c5a:b94d/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 1024
```

## Question 11 : Using a terminal, connect to a remote machine via SSH and telnet.

### Connecting to the remate machine using SSH login
```bash
vboxuser@SampleUbuntu:~$ sudo systemctl start ssh
vboxuser@SampleUbuntu:~$ sudo systemctl enable ssh
Synchronizing state of ssh.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable ssh
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ sudo systemctl status ssh
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset:>
     Active: active (running) since Wed 2025-02-26 14:29:32 IST; 56s ago
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 23280 (sshd)
      Tasks: 1 (limit: 2271)
     Memory: 1.9M
        CPU: 36ms
     CGroup: /system.slice/ssh.service
             └─23280 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Feb 26 14:29:32 SampleUbuntu systemd[1]: Starting OpenBSD Secure Shell server>
Feb 26 14:29:32 SampleUbuntu sshd[23280]: Server listening on 0.0.0.0 port 22.
Feb 26 14:29:32 SampleUbuntu sshd[23280]: Server listening on :: port 22.
Feb 26 14:29:32 SampleUbuntu systemd[1]: Started OpenBSD Secure Shell server.
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ ip a | grep inet
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3
    inet6 fe80::c57:94f7:8c5a:b94d/64 scope link noprefixroute 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ 
vboxuser@SampleUbuntu:~$ ssh vboxuser@127.0.0.1
The authenticity of host '127.0.0.1 (127.0.0.1)' can't be established.
ED25519 key fingerprint is SHA256:mjTOSX9uMbARAdbxjiqT8fKPYgRD3gwrI6MNZBE96O8.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '127.0.0.1' (ED25519) to the list of known hosts.
vboxuser@127.0.0.1's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-51-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

Expanded Security Maintenance for Applications is not enabled.

81 updates can be applied immediately.
25 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

*** System restart required ***

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
```

### Connecting to the remote machine using telnet
```bash
vboxuser@SampleUbuntu:~$ telnet 127.0.0.1
Trying 127.0.0.1...
telnet: Unable to connect to remote host: Connection refused
```


