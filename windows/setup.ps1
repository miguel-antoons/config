<#
Windows setup script - installs config files to their correct locations
#>

Write-Host "Setting up Windows configurations..."

# Common configurations
$commonDir = Join-Path -Path $PSScriptRoot -ChildPath "..\common"

# Zed editor configurations
# On Windows, Zed stores its configuration in %APPDATA%\Zed
$zedDir = Join-Path -Path $commonDir -ChildPath "zed"
$zedTargetDir = Join-Path -Path $env:APPDATA -ChildPath "Zed"

if (Test-Path -Path $zedDir -PathType Container) {
    Write-Host "Installing Zed configurations..."

    $zedThemesDir = Join-Path -Path $zedTargetDir -ChildPath "themes"
    New-Item -ItemType Directory -Path $zedTargetDir -Force | Out-Null
    New-Item -ItemType Directory -Path $zedThemesDir -Force | Out-Null

    # Keymap and settings go directly into the Zed config directory
    foreach ($file in @("keymap.json", "settings.json")) {
        Copy-Item -Path (Join-Path -Path $zedDir -ChildPath $file) -Destination $zedTargetDir -Force
        Write-Host "Copied $file to $zedTargetDir"
    }

    # Custom themes go into the themes subdirectory
    Copy-Item -Path (Join-Path -Path $zedDir -ChildPath "miguel-blur-3.json") -Destination (Join-Path -Path $zedThemesDir -ChildPath "miguel-blur-3.json") -Force
    Write-Host "Copied miguel-blur-3.json to $zedThemesDir"

    Write-Host "Zed configurations installed."
}

Write-Host "Windows configuration setup complete!"
