---
title: Wireshark Malware Analysis
date: 2025-02-7
author: Nicos
draft: false
tags:
  - Forensics
  - Malware
  - Wireshark
  - Packets

---
![[Pasted image 20250207184158.png]]

## Quiz Question

Review the pcap and answer the following questions for this month’s Unit 42 Wireshark quiz:

- When did the malicious traffic start in UTC?
![[Pasted image 20250207184736.png]]
based on the first DNS interaction we can see the ip `192.168.1.27`
- What is the victim’s IP address?
![[Pasted image 20250207185128.png]]
by visiting the statistics part of wireshark and going to the conversation section and selecting ipv4 you can see that ip addr `192.1688.1.27` is involved in all the communication
- What is the victim’s MAC address?
by visiting the statistics part of wireshark and going to the conversation section and selecting `Ethernet` you can see that mac addr `bc:ea:fa:22:74:fb` is involved in all the communication
- What is the victim’s Windows host name?
![[Pasted image 20250207185924.png]]
windows host name we run a search `frame matches "desktop"` and from the results we can check the smtp frame
we can see under the smtp protocol request parameter the host name as `DESKTOP-WIN11PC`
- What is the victim’s Windows user account name?
![[Pasted image 20250207190124.png]]
`windows11user`
- How much RAM does the victim’s host have?
![[Pasted image 20250207190209.png]]
`RAM: 32165.83 MB`
- What type of CPU is used by the victim’s host?
![[Pasted image 20250207190401.png]]
`intel(R) core(TM)`
- What is the public IP address of the victim’s host?
![[Pasted image 20250207190513.png]]
`173.66.46.112`
- What type of account login data was stolen by the malware? email and web accounts


