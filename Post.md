### Things to enumerate after taking a machine

  - users, priv and system (whoami, getuid)
  - networking information (network mapping)
  - Services and defender
  - Firewall situation
  - file permissions (what can we execute and where can we execute)
  - registry permissions
  - scheduled and running tasks (crontab, chonjob)
  - insecure files


**Questions to be asked** (exercises and examples for each machine i am in)
- what machine is it?
- what system is it running?
- what prividge do we have?
- what device(s) are connected to the machine?
- How many users are there on the machine?
- Which local user does this SID(S-1-5-21-1394777289-3961777894-1791813945-501) belong to?
- How many users have their password required values set to False?
- How many local groups exist?
- What command did you use to get the IP address info?
- How many ports are listed as listening?
- What is the remote address of the local port listening on port 445?
- How many patches have been applied?
- When was the patch with ID KB4023834 installed?
- Find the contents of a backup file.
- Search for all files containing API_KEY
- What command do you do to list all the running processes?
- What is the path of the scheduled task called new-sched-task?
- Who is the owner of the C:\

## Windows
Below are commands that would address our questions

**Basic Enum**
- systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
- hostname
- echo %username%
- net users (see more details)
- net users `username`

**Network interface and routing Enum**
- ipconfig /all
- route print
- arp -A

**Active Network and Firewall Rules**
- netstat -ano 
- netsh firewall show state
- netsh firewall show config

**Scheduled tasks, running processes, started services and installed drivers**
- schtasks /query /fo LIST /v
- tasklist /SVC
- net start
- DRIVERQUERY

**Powershell**type

look for powershell scripts to extract the following information: processes, services, user accounts, user groups, network interfaces, Hard Drive information, Network Share information, installed Windows patches, programs that run at startup, list of installed software, information about the operating system and timezone.

**Password harvesting - Things to look for if the company install windows in a mass fashion**
- Powershell History
- Saved Windows Credentials
- IIS Config
- PuTTY if it is installed
- c:\sysprep.inf
- c:\sysprep\sysprep.xml
- %WINDIR%\Panther\Unattend\Unattended.xml
- %WINDIR%\Panther\Unattended.xml
- Groups.xml file which is stored in SYSVOL
- Services\Services.xml: Element-Specific Attributes
- ScheduledTasks\ScheduledTasks.xml: Task Inner Element, TaskV2 Inner Element, ImmediateTaskV2 Inner Element
- Printers\Printers.xml: SharedPrinter Element
- Drives\Drives.xml: Element-Specific Attributes
- DataSources\DataSources.xml: Element-Specific Attributes

**Learn how to use Microsoft sysinternal**

**Window Services**
- sc query (state= running)
- sc qc Spooler
- Accesschk.exe to check access level of almost anything
- 
## Powershell script exercise

```
Given 3 directories with numerous of txt files in them, which stands for the email transcripts. Write a script to find any lines with the word 'password' in them.  
```
First Attempt
```powershell
# Define the path to the parent folder containing subfolders (Mary, John, Mike)
$parentFolder = "C:\path\to\your\folder"

# Define the pattern you're looking for in the files
$pattern = "password"

# Get all subfolders (Mary, John, Mike)
$subfolders = Get-ChildItem -Path $parentFolder -Directory

# Loop through each subfolder 
foreach ($folder in $subfolders) {
    # Get all text files inside each subfolders and make a list/array of txt files to further process
    $files = Get-ChildItem -Path $folder.FullName -Recurse -File

    # Loop through each file and check if the each of them contains the pattern "password"
    foreach ($file in $files) {
        # Use Select-String to find the pattern in the file and return the matching lines
        if (Select-String -Path $file.FullName -Pattern $pattern) {

            # Tell us which file contains the pattern 'password'
            Write-Host "Found '$pattern' in file: $($file.FullName)
            }
        }
    }
}
```
Result
```
Found 'password' in: C:\Users\Administrator\Desktop\emails\john\Doc3.txt
Found 'password' in: C:\Users\Administrator\Desktop\emails\Mary\Doc3M.txt
```


What if we wants to show the line in terminate
```powershell
# Define the path to the parent folder containing subfolders (Mary, John, Mike)
$parentFolder = "C:\path\to\your\folder"

# Define the pattern you're looking for in the files
$pattern = "password"

# Get all subfolders (Mary, John, Mike)
$subfolders = Get-ChildItem -Path $parentFolder -Directory

# Loop through each subfolder
foreach ($folder in $subfolders) {
    # Get all text files inside each subfolder (You can adjust file types if needed)
    $files = Get-ChildItem -Path $folder.FullName -Recurse -File

    # Loop through each file and check if the content contains the pattern "password"
    foreach ($file in $files) {
        # Use Select-String to find the pattern in the file and return the matching lines
        $matches = Select-String -Path $file.FullName -Pattern $pattern 
        
        # Check if any matches were found
        if ($matches) {
            # Output the file name and the matching line(s)
            foreach ($match in $matches) {
                Write-Host "Found '$pattern' in file: $($file.FullName)"
                Write-Host "Line $($match.LineNumber): $($match.Line)"
            }
        }
    }
}
```


### Linux 

**Automation Tools**
- LinPeas: https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS
- LinEnum: https://github.com/rebootuser/LinEnum
- LES (Linux Exploit Suggester): https://github.com/mzet-/linux-exploit-suggester
- Linux Smart Enumeration: https://github.com/diego-treitos/linux-smart-enumeration
- Linux Priv Checker: https://github.com/linted/linuxprivchecker


## $PATH malicous use (with SUID and SGID Privilege Escalation)

### Short version
this vector depends on many things (as the lower privilege user):
1. check the permission to edit $PATH itself (if can then we can ask $PATH to point to a new directory to execute our malicious script)
2. if $PATH not editable, we can check the dir that is in existing $PATH, see if any of them is writable to current user? If so, we can place a our malicious script(bin) inside
3. if we do not have writable perm to any of the directories, next is to check if we have writable perm to any of the app in those directories. If so, we can change those app to be malicious.
   
(with above said, if the goal is to escalate privilege)
We need to find a script that satisfy 2 conditions:
1. root owned
2. SUID or SGID bit is set 
3. Is changeable/editable to us that is within any of the dir in $PATH


### FULL Detailed verion
1. Check if $PATH is editable
- Editable $PATH:The $PATH variable itself can be modified by a user, but this usually requires write permissions to modify the environment variable itself. For a lower privilege user, this could be done if they can modify files that set environment variables (like .bashrc or .profile).
  - If the user can edit $PATH, they can potentially add a malicious directory to the path, which might contain a malicious script or binary.
  - This would allow the user to execute a malicious file instead of the intended command (e.g., by hijacking the command they want to run, like ls, cat, etc.).


2. Check if directories in $PATH are writable
- Writable Directories: If $PATH already contains directories that are writable to the user (e.g., /tmp, /home/user, etc.), the user can place their malicious script inside these directories.
  - Example: A user could place a script named ls in a writable directory that's earlier in the $PATH list. When the malicious script is executed, it would run instead of the legitimate ls binary.
3. Check if writable applications in $PATH are available
- Writable Applications: If the user cannot modify the $PATH itself and cannot write to directories in $PATH, another approach would be to look for binaries (or applications) inside directories in $PATH that are writable.
  - Example: If a specific application like /usr/bin/ls is writable, the user could overwrite it with their malicious version. If that executable is called later, it would run the malicious code instead of the legitimate command.

**For Privilege Escalation (SUID/SGID)**

If the goal is to escalate privileges, then the user must look for a root-owned binary with the SUID (Set User ID) or SGID (Set Group ID) bit set.

Steps to find such a vulnerability:
1. Find SUID/SGID binaries: These are binaries that, when executed, run with the privileges of the file owner (root for SUID, group for SGID).

  - The user can find these files using:
  
`find / -type f \( -perm -4000 -o -perm -2000 \) 2>/dev/null`
  - This will search for files with the SUID (4000) or SGID (2000) permission bits.
2. Check for files with SUID/SGID set and owned by root: If a file with SUID/SGID is owned by root, it can be used to escalate privileges when executed by a regular user. The user can attempt to modify or exploit those files.
3. Check if the file is editable: If the user has write permissions to the file (or can gain write access by exploiting other vulnerabilities), they could potentially modify the binary or script to execute their malicious code, and when it's run, they would have escalated privileges (since it's running as root).
