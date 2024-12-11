# Windows Persistence Techniques

**What is persistence?**: To maintain access to the machine without the need to re-exploit

**Persistence vs Privilege Escalation**: Persistence is performed mostly with a privilege account but not exclusive to High level account, while PE is to move up the ladder and get admin account. 

## Acounts Tampering Techniques

1. Creating new users and assign them to privilege groups
2. Cracking existing account hashes
3. RID Hijacking

### Creating new users and assign them to privilege groups
pros: full access 
Cons: Limited to the group and can be very obvious if there aren't as much members in admin group

```
net localgroup administrators <user> /add
net groups #to check if it is added
net localgroup "Backup Operators" <user> /add
net localgroup "Remote Management Users" <user> /add with this you will also need  reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /t REG_DWORD /v LocalAccountTokenFilterPolicy /d 1
```

### Cracking existing account hashes
pros: can have access to multiple accounts, hard to identify, 
cons: passwords can be changed, only can be executed by admin account in initial access (must do PE)

using evil-winrm to download SAM and System and get hash with impacket 

### RID Hijacking
