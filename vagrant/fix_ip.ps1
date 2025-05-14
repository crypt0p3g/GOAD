# vmware bug to set the ip
# see : https://github.com/hashicorp/vagrant/issues/5000#issuecomment-258209286

param ([String] $ip)

$iface = Get-NetIPAddress | Where-Object { $_.IPAddress -like '169.254.*' }

if ($iface) {
  New-NetIPAddress -InterfaceAlias $iface.InterfaceAlias -IPAddress $ip -PrefixLength 24
}