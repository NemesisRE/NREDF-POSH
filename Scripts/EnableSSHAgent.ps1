#Requires -RunAsAdministrator

if ( $isWindows ) {
  Add-WindowsCapability -Online -Name ((Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.Client*').Name)
  Get-Service ssh-agent | Set-Service -StartupType Automatic
  Start-Service ssh-agent
  Get-Service ssh-agent
}
