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



## SchTask == Linux crontab & cronjobs
### Creating the backdoor
3 things to look at: 

first is ofcos the payload (can be ps, cmd, exe, py), and Date-the frequency that the task run (tip: less would be less sus), 
less is who runs the task (we would like the highest priv account to run it

### Post creation of the backdoor

Hiding the Task
SD = security descriptor: an identifier, or an access control list to this task. By changing it, other users will not be able to see it. So if we just delete the SD, 
meaning no one on this machine can see this task, including the system. So we will delete it to the registry


Pratice:
1. create `schtasks /create /sc <unit:min,hour> /mo <value:1,2,3> /TN <taskname> /RN <who runs the task>
2. use `schtasks /query /tn testbackdoor` to see if the task is running correctly
3. after successfully schedule the task, open window registry with psexec and delete the SD in the scheduled test (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree)


### Startup (C:\users\appdata\startup) folder
- to check startup tasklist, use msconfig

### Registry

**3 Folders of our interest**
- Run/run once (Under HKLM (older machines) or HKCU (modern machines))
- Winlogon (user init or shell, stuff inside cannot be deleted. By default, user init points to userinit.exe and shell points to
 explorer.exe, so what we can do is to add our payload behind like "userinit.exe, payload.exe")
- startup Script (place at startup folder or registry, registry is always preferable cause even sys admin are not always familia)






