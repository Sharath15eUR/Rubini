# Assignment - 3

## 1. Capture and Analyze ARP Packets Using Wireshark
### Filtering the ARP packets
![{CCBCAFDD-19E4-4791-97DC-24D05BF4366C}](https://github.com/user-attachments/assets/18287a04-bf31-4496-b32d-425947c193e6)

![{A70B2BEC-8B14-4B18-8F3C-2464AFEFA65F}](https://github.com/user-attachments/assets/11a43d47-a96f-466f-9c00-38a23372bd26)

### Address Resolution Protocol (ARP)
- Address Resolution Protocol (ARP) is used to map an IP address to a MAC address.  
- When a device wants to send a packet, it first sends an **ARP request** to find the MAC address of the destination.  
- The device with that IP responds with an **ARP reply**, allowing communication.  
- ARP helps devices in a network find each other and ensures successful packet delivery.

## 2.  Manually Configure Static Routes
### Small network with switches, Routers and 2 PCs
![Screenshot 2025-03-16 225046](https://github.com/user-attachments/assets/10645a3d-9425-4a90-b8b4-e2ea771f743f)

![{E7F5ADC0-5FEA-460F-9D20-AF509ADBEB9C}](https://github.com/user-attachments/assets/69b4312a-6226-44db-850c-95655e4509bb)

### Manualling assigning the IP address 
![{1CAD2132-195D-4DD9-857C-B745A22DD498}](https://github.com/user-attachments/assets/91ac30d5-69eb-4c61-8869-1e5b2a97ed10)

## 3. Subnetting Task for 192.168.1.0/24 divided into 4 subnets

- **Given Network:** `10.0.0.0/24`  
- **Original Subnet Mask:** `255.255.255.0` (supports **256 IPs**)  
- **Dividing into 4 subnets** → Need **2 additional bits** for subnetting:  
  - **New Subnet Mask:** `/26` (i.e., `255.255.255.192`)

---

Each subnet will have:  
- **Subnet Increment:** `256 - 192 = 64`  
- **Total Usable Hosts per Subnet:** `2^(32-26) - 2 = 62` (excluding network & broadcast)  

| **Subnet**  | **Network Address** | **First Usable IP** | **Last Usable IP** | **Broadcast Address** |
|------------|---------------------|---------------------|--------------------|----------------------|
| **Subnet 1** | `10.0.0.0/26`   | `10.0.0.1`   | `10.0.0.62`  | `10.0.0.63`  |
| **Subnet 2** | `10.0.0.64/26`  | `10.0.0.65`  | `10.0.0.126` | `10.0.0.127` |
| **Subnet 3** | `10.0.0.128/26` | `10.0.0.129` | `10.0.0.190` | `10.0.0.191` |
| **Subnet 4** | `10.0.0.192/26` | `10.0.0.193` | `10.0.0.254` | `10.0.0.255` |

## 4. Identifying IP Classes and Private/Public

Class A - 1.0.0.0 to 126.255.255.255
Class B - 128.0.0.0	to 191.255.255.255	
Class C - 192.0.0.0	to 223.255.255.255	

`192.168.10.5` - Class C - Private IP
`172.20.15.1` - Class B - Private IP
`8.8.8.8` - Class A - Public IP - Google DNS

### NAT handles IP when accessing the internet

NAT allows devices with **private IPs** to access the **Internet** by mapping them to a **public IP address**.

1. **When a private IP device sends a packet to the Internet:**
   - **Source IP (Private)** → Translated to **Router’s Public IP**
   - Packet is sent to the Internet.  
2. **Response received from the Internet:**
   - The packet is sent to the **Router’s Public IP**.
3. **NAT translates it back** to the **private IP** of the original sender.

## 5. Configuring NAT 
![{D31A88EA-45AA-4CD0-B902-3887D7CC722D}](https://github.com/user-attachments/assets/0b562118-6e52-4fe0-8060-e0a9d9a2d1d0)

![{B7EF2A73-DA53-4A72-949B-D7BECFDF2900}](https://github.com/user-attachments/assets/8487d698-33a0-4b59-afce-d2f73e78ab3d)

![{A85857BD-2F5F-4976-9742-CD5C6ED52B79}](https://github.com/user-attachments/assets/447280a3-fcab-4580-b69b-ab6ee54a9d11)

![{97C3EF6E-AB40-4A1B-95FE-5555D0317812}](https://github.com/user-attachments/assets/42e9a55b-e773-449d-9ce1-054ae959f553)

![{5ED69CC7-6C90-41AB-AB29-5614061AC530}](https://github.com/user-attachments/assets/e32457b5-6d9a-4469-aefb-ec87e423fb2a)



