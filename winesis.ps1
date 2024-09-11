
Write-Output "
__          _ ______ _   _ ______  _____ _____  _____ 
\ \        / |_   _| \ | |  ____|/ ____|_   _|/ ____|
 \ \  /\  / /  | | |  \| | |__   |(___   | |  |(___  
  \ \/  \/ /   | | | .   |  __|  \___ \  | |  \___ \ 
   \  /\  /   _| |_| |\  | |____ ____)| _| |_ ____)|
    \/  \/   |_____|_| \_|______|_____/|_____|_____/"

Write-Output " "
Write-Output "Winesis Scorebot v1`n"
Write-Output "NOTE: Please allow up to 5 minutes for scorebot updates & injects.`n"
Write-Output "Injects: NO" # Modify this if you run an inject
$global:score = 0 #make sure your total points add up to 100


Function Solved {
    param(
        [String]$vuln_name,
        [Int]$points
    )
    $global:score += $points
    Write-Output "Vulnerability fixed: $vuln_name [$points points]"
}

#under-the-hood function to handle checking text in a file
Function TextExists {
    param(
        [String]$file,
        [String]$text
    )
    try {
        if (Get-Content $file -ErrorAction Stop | Select-String -Pattern ($text)) {
            return $true
        }
        else {
            return $false
        }
    }
    catch {
        return $null
    }
}

# Function to check if text exists in a file
Function CheckTextExists {
    param(
        [String]$file,
        [String]$text,
        [String]$vuln_name,
        [Int]$points
    )
    $Exists = TextExists -file $file -text $text
    if ($null -eq $Exists) {
        Write-Output "Unsolved Vuln"
        return
    }
    if ($Exists) {
        Solved -vuln_name $vuln_name -points $points
    }
    else {
        Write-Output "Unsolved Vuln"
    }
}

#Function to check if text does not exist in a file
Function CheckTextNotExists {
    param(
        [String]$file,
        [String]$text,
        [String]$vuln_name,
        [Int]$points
    )
    $Exists = TextExists -file $file -text $text
    if ($null -eq $Exists) {
        Write-Output "Unsolved Vuln"
        return
    }
    if (-not $Exists) {
        Solved -vuln_name $vuln_name -points $points
    }
    else {
        Write-Output "Unsolved Vuln"
    }

}

# Function to check if a file exists
Function CheckFileExists {
    param(
        [String]$file,
        [String]$vuln_name,
        [Int]$points
    )
    if (Test-Path -Path $file) {
        Solved -vuln_name $vuln_name -points $points
    }
    else {
        Write-Output "Unsolved Vuln"
    }
}

Function CheckFileDeleted {
    param(
        [String]$file,
        [String]$vuln_name,
        [Int]$points
    )
    
    if (-not (Test-Path -Path $file)) {
        Solved -vuln_name $vuln_name -points $points
    }
    else {
        Write-Output "Unsolved Vuln"
    }
}

Function CheckRegistryKey {
    param(
        [String]$path,
        [String]$key,
        [String]$expected_value,
        [String]$vuln_name,
        [Int]$points
    )
    try {
        $property = Get-ItemProperty -Path $path -Name $key -ErrorAction Stop
        $actual_value = $property.$key #not sure if this will work
        if ($expected_value -eq $actual_value) {
            Solved -vuln_name $vuln_name -points $points
        }
        else {
            Write-Output "Unsolved Vuln"
        }
    }
    catch {
        Write-Output "Unsolved Vuln"
    }
}

Function RegistryKeyDeleted {
    param(
        [String]$path,
        [String]$key,
        [String]$vuln_name,
        [Int]$points
    )
    try {
        ($value = Get-ItemProperty -Path $path -Name $key -ErrorAction Stop) | Out-Null
        Write-Output "Unsolved Vuln"
    }
    catch [System.Management.Automation.PSArgumentException] {
        Solved -vuln_name $vuln_name -points $points
    }
    catch {
        Write-Output "Unsolved Vuln"
    }
}




Write-Output " "
Write-Output ">> Insert image name here <<"
Write-Output " "

# spot to put your vulns begins here


#example vuln: (DELETE THIS BEFORE USE)
CheckTextExists -file '.\C:\Users\emarine\Desktop\Forensics Question 1.txt' -text "Lone Star" -vuln_name "Forensics 1" -points 5

# spot to put your vulns ends here


Write-Output "Total Score: $score/100"
