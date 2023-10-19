<#
    .Description
    --------- Run this script as administrator ---------
    * Resources can be downloaded from: https://tagui.readthedocs.io/en/latest/setup.html
    * Be sure to have required files on the same folder where this script is located

    ------------------------
    Before running:
    ------------------------
    * Download TagUI_Windows and name it as TagUI_Windows.zip

    ------------------------
    Packages installed
    ------------------------
    * TagUI tool
    * Chocolatey
    * OpenJDK (By Chocolatey)
#>

$TagUI_Zip_FileName = "TagUI_Windows.zip";

Write-Host "`n**********Chocolatey software management automation installation`n"
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco --version

Write-Host "`n**********Extracting TagUI zip file`n"
Expand-Archive -Path $TagUI_Zip_FileName -DestinationPath 'C:\' -Force

Write-Host "`n**********Openjdk installation`n"
choco install -y openjdk

Write-Host "`n**********Setting TagUI path environment variable`n"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine") + [IO.Path]::PathSeparator + "C:\tagui\src"
[Environment]::SetEnvironmentVariable("Path", $Path, "Machine")
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
