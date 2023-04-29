$hostnames = Get-Content -Path C:\hostname.txt
$output = @()
foreach ($hostname in $hostnames) {
  if (Test-Connection -ComputerName $hostname -Count 1 -Quiet) {
    $ip = [System.Net.Dns]::GetHostAddresses($hostname) | Select-Object -ExpandProperty IPAddressToString
    $output += "$hostname : $ip"
  }
}
$output | Out-File -FilePath C:\output.txt
