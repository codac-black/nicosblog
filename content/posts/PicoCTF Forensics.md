---
title: Verify
date: 2025-01-14
author: Nicos
draft: false
tags:
  - Forensics
  - picoCTF
  - grep
  - checksum
  - encryption
---

## Description

People keep trying to trick my players with imitation flags. I want to make sure they get the real thing! I'm going to provide the SHA-256 hash and a decrypt script to help you know that my flags are legitimate.

Additional details will be available after launching your challenge instance.

### Additional details:
- ssh into the launched instance
```ssh
 ssh -p 53041 ctf-player@rhea.picoctf.net
```

-  Using the password `1ad5be0d`. Accept the fingerprint with `yes`, and `ls` once connected to begin. Remember, in a shell, passwords are hidden!
- - Checksum: 5848768e56185707f76c1d74f34f4e03fb0573ecc1ca7b11238007226654bcda
- To decrypt the file once you've verified the hash, run `./decrypt.sh files/<file>`.

## Solution

- Running to generate hashes for each file and grep with the checksum you were provided to get the file whose checksum matches the one given earlier.
```bash
sha256sum ./files/*
```

- Next is to run the decrypt script on the files that you've acquired on the earlier step in order to get the flag.
```bash
./decrypt.sh 8eee7195
picoCTF{trust_but_verify_8eee7195}
```

![Image Description](/images/Screenshot%202025-01-14%20210514.png)
