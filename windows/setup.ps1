<#
Windows setup script - installs config files to their correct locations
#>

Write-Host "Setting up Windows configurations..."

# Common configurations
$scriptDir = Split-Path -Path $PSScriptRoot -Parent
$commonDir = Join-Path -Path $scriptDir -ChildPath "..\common"

# Zed editor configurations
$zedDir = Join-Path -Path $commonDir -ChildPath "zed"
$zedTargetDir = Join-Path -Path $env:APPDATA -ChildPath "Zed"

if (Test-Path -Path $zedDir -PathType Container) {
    Write-Host "Installing Zed configurations..."
    
    # Create target directory if it doesn't exist
    if (-not (Test-Path -Path $zedTargetDir -PathType Container)) {
        New-Item -ItemType Directory -Path $zedTargetDir | Out-Null
    }
    
    # Copy all Zed config files
    Get-ChildItem -Path $zedDir -File | ForEach-Object {
        Copy-Item -Path $_.FullName -Destination (Join-Path -Path $zedTargetDir -ChildPath $_.Name)
        Write-Host "Copied $($_.Name) to $zedTargetDir"
    }
    
    Write-Host "Zed configurations installed."
}

Write-Host "Windows configuration setup complete!"
