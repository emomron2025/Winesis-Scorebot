# Winesis Scorebot

Winesis is a scorebot for Windows CyberPatriot training images. It is a Windows port of [Kinesis Scorebot](https://github.com/mattkoco/Kinesis-Scorebot).

Winesis was developed and tested on Windows 11. Use it on other operating systems at your own peril.


## Setup
 - Create a scoring directory anywhere on the image
 - Copy and paste [this code](https://github.com/emomron2025/Winesis-Scorebot/blob/main/getscore.ps1) into a file in the directory
 - Modify a copy of [this file](https://github.com/emomron2025/Winesis-Scorebot/blob/main/winesis.ps1) to suit your image, upload the modified version to your own Github, and paste the raw link into your image's getscore.ps1 file
 - **DO NOT DOWNLOAD THE SCOREBOT ITSELF TO THE IMAGE**
 - Add a shortcut to getscore.ps1 on the desktop; if you want to be fancy, create a HTML scoring report that hooks up to the output of the file

## Directions for Use
Winesis has several functions to check different aspects of your system.
  - `CheckTextExists -file` '.\path\to\file\filename.txt' `-text` "text" `-vuln_name` "vuln name" `-points` #
    - Checks if text exists within a file
    - `-file`: The absolute file path to the file to check within. Format as a PowerShell file path, i.e. ".\C:\Windows\file.txt".
    - `-text`: The text to search for within a file. Supports regex. 
    - `-vuln_name`: The name to print out for the vuln. Format as a string.
    - `-points`: The number of points to award for solving the vuln. Format as an int.
    - Use cases includes forensics questions and config files
  - `CheckTextNotExists -file` '.\path\to\file\filename.txt' `-text` "text" `-vuln_name` "vuln name" `-points` #
    - Checks if text does NOT exist within a file
    - `-file`: The absolute file path to the file to check within. Format as a PowerShell file path, i.e. ".\C:\Windows\file.txt".
    - `-text`: The text to search for within a file. Supports regex  
    - `-vuln_name`: The name to print out for the vuln. Format as a string.
    - `-points`: The number of points to award for solving the vuln. Format as an int.
    - Use cases include config files
  - `CheckFileExists -file` '.\path\to\file\filename.txt' `-vuln_name` "vuln name" `-points` #
    - Checks if a file exists
    - `-file`: The absolute file path of the file to check. Format as a PowerShell file path, i.e. ".\C:\Windows\file.txt".
    - `-vuln_name`: The name to print out for the vuln. Format as a string.
    - `-points`: The number of points to award for solving the vuln. Format as an int.
    - Use cases include required programs
  - `CheckFileDeleted -file` '.\path\to\file\filename.txt' `vuln_name` "vuln name" `-points` #
    - Checks if a file does NOT exist
    - `-file`: The absolute file path of the file to check. Format as a PowerShell file path, i.e. ".\C:\Windows\file.txt".
    - `-vuln_name`: The name to print out for the vuln. Format as a string.
    - `-points`: The number of points to award for solving the vuln. Format as an int.
    - Use cases include disallowed programs, malware, etc.
  - `CheckRegistryKey -path` HIVE:\path\to\key `-key` NAMEOFKEY `-expected_value` "expectedvalue" `-vuln_name` "vuln name" `-points` #
    - Checks if a registry key has a specific value
    - `-path`: The path to the registry key. Format the hive in its abbreviated form (i.e. HKLM: for HKEY_LOCAL_MACHINE) and format the rest of the path like a normal file. Do not include the name of the key.
     - `-key`: The name of the key whose value is to be checked.
     - `-expected_value`: The expected value of the key specified with `-key`.
     - `-vuln_name`: The name to print out for the vuln. Format as a string.
     - `-points`: The number of points to award for solving the vuln. Format as an int.
    - Use cases include settings, startup/shutdown run scripts, and pretty much everything else
  - `RegistryKeyDeleted -path` HIVE:\path\to\key `-key` NAMEOFKEY `vuln_name` "vuln name" `-points` #
      - Checks that a registry key does NOT exist
      - `-path`: The path to the registry key. Format the hive in its abbreviated form (i.e. HKLM: for HKEY_LOCAL_MACHINE) and format the rest of the path like a normal file. Do not include the name of the key.
     - `-key`: The name of the key whose value is to be checked.
     - `-vuln_name`: The name to print out for the vuln. Format as a string.
     - `-points`: The number of points to award for solving the vuln. Format as an int.
     - Use cases include bad Run keys, unwanted configuration keys, etc.
  - `CheckService -name` "name" `-is_running` $True/$False `-vuln_name` "vuln name" `-points` #
     - Checks if a service is or is not running
     - `-name`: The name of the service. Format as a string.
     - `-is_running`: Whether the service should or should not be running. Format as a PowerShell boolean, which is to say $True or $False.
     - `-vuln_name`: The name to print out for the vuln. Format as a string.
     - `-points`: The number of points to award for solving the vuln. Format as an int.
     - Use cases include insecure services, persistent malware, The Goose, etc.

## Other Notes
 - If you update the scorebot online, it may take a few minutes for the changes to be reflected in the image
 - A reasonable understanding of PowerShell is strongly recommended to use this scorebot
