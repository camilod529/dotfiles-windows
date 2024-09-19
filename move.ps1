# Get the path of the current directory (where the script is located)
$currentDirectory = (Get-Location).Path

# Define source paths for the files based on the current directory
$sourcePowerShellProfile = Join-Path -Path $currentDirectory -ChildPath "Microsoft.PowerShell_profile.ps1"
$sourceGitConfig = Join-Path -Path $currentDirectory -ChildPath ".gitconfig"

# Get the current user's profile directory
$userProfile = [Environment]::GetFolderPath("UserProfile")
$documentsFolder = [Environment]::GetFolderPath("MyDocuments")

# Define the destination paths
$destinationPowerShellProfile = Join-Path -Path $documentsFolder -ChildPath "PowerShell\Microsoft.PowerShell_profile.ps1"
$destinationGitConfig = Join-Path -Path $userProfile -ChildPath ".gitconfig"

# Create the PowerShell folder if it doesn't exist
$powerShellFolder = Join-Path -Path $documentsFolder -ChildPath "PowerShell"
if (-not (Test-Path -Path $powerShellFolder)) {
    New-Item -Path $powerShellFolder -ItemType Directory
}

# Move Microsoft.PowerShell_profile.ps1
if (Test-Path -Path $sourcePowerShellProfile) {
    Move-Item -Path $sourcePowerShellProfile -Destination $destinationPowerShellProfile -Force
    Write-Host "The Microsoft.PowerShell_profile.ps1 file has been moved to $destinationPowerShellProfile"
} else {
    Write-Host "The Microsoft.PowerShell_profile.ps1 file does not exist in the specified path."
}

# Move .gitconfig
if (Test-Path -Path $sourceGitConfig) {
    Move-Item -Path $sourceGitConfig -Destination $destinationGitConfig -Force
    Write-Host "The .gitconfig file has been moved to $destinationGitConfig"
} else {
    Write-Host "The .gitconfig file does not exist in the specified path."
}
