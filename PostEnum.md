### Things to enumerate after taking a machine

  - users (whoami, getuid)
  - basic networking information (network mapping)
  - file permissions (what can we execute and where can we execute)
  - registry permissions
  - scheduled and running tasks (crontab, chonjob)
  - insecure files


**Questions to be asked** (exercises and examples for each machine i am in)
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


## Powershell script exercise

```
Given 3 directories with numerous of txt files in them, which stands for the email transcripts. Write a script to find any lines with the word 'password' in them.  
```
First Attempt
```
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
```
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

