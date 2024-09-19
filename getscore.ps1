# link to fetch the scorebot from where you're hosting it online
$ScorebotLink = "" #put the link to the raw scorebot code here 
$ScoringDir = "\." #put the absolute file path of your scoring directory between the period and quotation mark with NO "\" at the end

# if you intend to break internet access in your image, add a local copy of scorebot.ps1 in your scoring directory


try {
  $Response = Invoke-WebRequest -Uri $ScorebotLink -ErrorAction Stop
  $Response.Content | Out-File -FilePath "$ScoringDir\scorebot.ps1"  
} catch {
  Write-Output "Failed to download scorebot.ps1. Attempting to access local copy..."
}

try {
  & $ScoringDir\scorebot.ps1
} catch {
  Write-Error "Failed to execute scorebot.ps1"
} finally {
  if (Test-Path -Path "$ScoringDir\scorebot.ps1") {
    Remove-Item -Path "$ScoringDir\scorebot.ps1" -ErrorAction SilentlyContinue
  }
}
