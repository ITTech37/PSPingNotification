# This script pings a target of your choice to ensure the good communication between your host and the remote host and displays the result in a native notification. #

# VARIABLES #

$Target = "www.google.com"
$Ping = Test-Connection -ComputerName $Target -Quiet

# MAIN #

If ($Ping -eq "True") {
    Add-Type -AssemblyName System.Windows.Forms
    $global:balloon = New-Object System.Windows.Forms.NotifyIcon
    $global:notification = New-Object System.Windows.Forms.NotifyIcon
    $path = (Get-Process -id $pid).Path
    $notification.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $notification.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
    $notification.BalloonTipText = "$Target is UP"
    $notification.BalloonTipTitle = $Test
    $notification.Visible = $true
    $notification.ShowBalloonTip(20000)
} Else {
    Add-Type -AssemblyName System.Windows.Forms
    $global:balloon = New-Object System.Windows.Forms.NotifyIcon
    $global:notification = New-Object System.Windows.Forms.NotifyIcon
    $path = (Get-Process -id $pid).Path
    $notification.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $notification.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Error
    $notification.BalloonTipText = "$Target is DOWN"
    $notification.BalloonTipTitle = $Test
    $notification.Visible = $true
    $notification.ShowBalloonTip(20000)
}