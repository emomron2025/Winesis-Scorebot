# Winesis-Scorebot

![363435303-fce4a796-2f7f-412e-bb7c-ec896e4a7a28-removebg-preview](https://github.com/user-attachments/assets/eff8486d-ad2b-4185-87e6-edcdbb0851f6)


Winesis is a scorebot for Windows CyberPatriot training images. It is a Windows port of [Kinesis Scorebot](https://github.com/mattkoco/Kinesis-Scorebot).

Winesis was developed and tested on Windows 11. Use it on other operating systems at your own peril.


## Setup
 - Create a scoring directory anywhere on the image
 - Copy and paste [this code](https://github.com/emomron2025/Winesis-Scorebot/blob/main/getscore.ps1) into a file in the directory
 - Modify a copy of [this file](https://github.com/emomron2025/Winesis-Scorebot/blob/main/winesis.ps1) to suit your image, upload the modified version to your own Github, and paste the raw link into your image's getscore.ps1 file
 - **DO NOT DOWNLOAD THE SCOREBOT ITSELF TO THE IMAGE**
 - Add a shortcut to getscore.ps1 on the desktop; if you want to be fancy, create a HTML scoring report that hooks up to the output of the file

## Directions for Use
 - Winesis has several functions to check different aspects of your system:
  - `CheckTextExists -file` '.\path\to\file\filename.txt' `-text` "text" `-vuln_name` "vuln name" `-points` #
   - Checks if text exists within a file
   - Use cases includes forensics questions and config files
  - `CheckTextNotExists -file` '.\path\to\file\filename.txt' `-text` "text" `-vuln_name` "vuln name" `-points` #
   - Checks if text does NOT exist within a file
   - Use cases include config files
  - `CheckFileExists -file` '.\path\to\file\filename.txt' `-vuln_name` "vuln name" `-points` #
   - Checks if a file exists
   - Use cases include required programs
  - `CheckFileDeleted -file` '.\path\to\file\filename.txt' `vuln_name` "vuln name" `-points` #
   - Checks if a file does NOT exist
   - Use cases include disallowed programs, malware, etc.
  - `CheckRegistryKey -path` HIVE:\path\to\key `-key` NAMEOFKEY `-expected_value` "expectedvalue" `-vuln_name` "vuln name" `-points` #
   - Checks if a registry key has a specific value
   - Use cases include settings, startup/shutdown run scripts, and pretty much everything else
  - `RegistryKeyDeleted -path` HIVE:\path\to\key `-key` NAMEOFKEY `vuln_name` "vuln name" `-points` #

## Other Notes
 - If you update the scorebot online, it may take a few minutes for the changes to be reflected in the image
 - The scorebot relies on Internet access