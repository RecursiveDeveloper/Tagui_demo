<#
    .Description
    --------- Run this script as administrator ---------

    ------------------------
    Packages installed
    ------------------------
    * Chrome web browser (By chrome.exe file installer)
#>

$ChromeInstaller = "ChromeInstaller.exe";
$LocalTempDir = $env:TEMP;

(new-object System.Net.WebClient).DownloadFile(
    'http://dl.google.com/chrome/install/375.126/chrome_installer.exe',
    "$LocalTempDir\$ChromeInstaller"
);

Write-Host "`n**********Google Chrome installation`n"
Start-Process -FilePath "$LocalTempDir\$ChromeInstaller" -Args "/silent /install" -Verb RunAs -Wait
$Process2Monitor =  "ChromeInstaller";
Do {
    $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name;
    If ($ProcessesFound) {
        "Still running: $($ProcessesFound -join ', ')" | Write-Host;
        Start-Sleep -Seconds 2
    } else {
        rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose
    }
} Until (!$ProcessesFound)
$(Get-Package -Name "Google Chrome").Version
