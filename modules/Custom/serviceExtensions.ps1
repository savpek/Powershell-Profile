Function Remove-Service {
  PROCESS {
    $serviceName = $_.Name;
    $service = Get-WmiObject -Class Win32_Service -Filter "Name='$serviceName'";
    $service.delete();
  }
}

