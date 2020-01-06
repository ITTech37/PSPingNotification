# script qui lance un ping en background invisible si possible et affiche le résultat (touché ou pas) via notification W10
# Si l'installation du module échoue, veuillez lancer le script dans une console PS en mode Admin

# VARIABLES #

$Target = "www.google.com"
#$Test = "Je suis un test"

$Ping = Test-Connection -ComputerName $Target -Quiet
#echo $Ping


# MAIN #

If ($Ping -eq "True") {
    Write-Host -ForegroundColor Green "Ping OK"
} Else {
    Write-Host -ForegroundColor Red "Ping NOK"
}

# NOTIFICATION #
Add-Type -AssemblyName System.Windows.Forms
$global:balloon = New-Object System.Windows.Forms.NotifyIcon
$global:notification = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$notification.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$notification.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$notification.BalloonTipText = ‘This is the pop-up message text for the Windows 10 user'
$notification.BalloonTipTitle = $Test
$notification.Visible = $true
$notification.ShowBalloonTip(20000)