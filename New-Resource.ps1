#Install-Module -Name xDSCResourceDesigner
$protocol = New-xDscResourceProperty -Name Protocol -Type String -Attribute key -Description 'Listener protocol' -ValidateSet ('HTTP','HTTPS')
$ensure = New-xDscResourceProperty -Name Ensure -Type String -Attribute Write -ValidateSet @('Present', 'Absent') -Description 'Ensure'

$basicservice = New-xDscResourceProperty -Name Service_Basic -Type String -Attribute Write -Description 'Enable or disable basic auth for the WinRM service' -ValidateSet ('true','false')
$basicclient = New-xDscResourceProperty -Name Client_Basic -Type String -Attribute Write -Description 'Enable or disable basic auth for the WinRM client' -ValidateSet ('true','false')

$digestclient = New-xDscResourceProperty -Name Client_Digest -Type String -Attribute Write -Description 'Enable or disable digest auth for the WinRM client' -ValidateSet ('true','false')

$kerberossevice = New-xDscResourceProperty -Name Service_Kerberos -Type String -Attribute Write -Description 'Enable or disable kerberos auth for the WinRM service' -ValidateSet ('true','false')
$kerberosclient = New-xDscResourceProperty -Name Client_Kerberos -Type String -Attribute Write -Description 'Enable or disable kerberos auth for the WinRM client' -ValidateSet ('true','false')

$negotiateservice = New-xDscResourceProperty -Name Service_Negotiate -Type String -Attribute Write -Description 'Enable or disable negotiate auth for the WinRM service' -ValidateSet ('true','false')
$negotiateclient = New-xDscResourceProperty -Name Client_Negotiate -Type String -Attribute Write -Description 'Enable or disable negotiate auth for the WinRM client' -ValidateSet ('true','false')

$certificateservice = New-xDscResourceProperty -Name Service_Certificate -Type String -Attribute Write -Description 'Enable or disable certificate auth for the WinRM service' -ValidateSet ('true','false')
$certificateclient = New-xDscResourceProperty -Name Client_Certificate -Type String -Attribute Write -Description 'Enable or disable certificate auth for the WinRM client' -ValidateSet ('true','false')

$credsspservice = New-xDscResourceProperty -Name Service_CredSSP -Type String -Attribute Write -Description 'Enable or disable credssp auth for the WinRM service' -ValidateSet ('true','false')
$credsspclient = New-xDscResourceProperty -Name Client_CredSSP -Type String -Attribute Write -Description 'Enable or disable credssp auth for the WinRM client' -ValidateSet ('true','false')

$allowunencryptedservice = New-xDscResourceProperty -Name Service_AllowUnencryptedService -Type String -Attribute Write -Description 'Enable or disable unencrypted WinRM service' -ValidateSet ('true','false')
$allowunencryptedclient = New-xDscResourceProperty -Name Client_AllowUnencryptedClient -Type String -Attribute Write -Description 'Enable or disable unencrypted WinRM client' -ValidateSet ('true','false')

$httpport = New-xDscResourceProperty -Name HttpPort -Type String -Attribute Write -Description 'Set the HTTP WinRM port'
$httpsport = New-xDscResourceProperty -Name HttpsPort -Type String -Attribute Write -Description 'Set the HTTPS WinRM port'

$MaxEnvelopeSizekb = New-xDscResourceProperty -Name MaxEnvelopeSizekb -Type String -Attribute Write -Description 'Set the MaxEnvelopeSizekb value'
$MaxTimeoutms = New-xDscResourceProperty -Name MaxTimeoutms -Type String -Attribute Write -Description 'Set the MaxTimeoutms value'
$MaxBatchItems = New-xDscResourceProperty -Name MaxBatchItems -Type String -Attribute Write -Description 'Set the MaxBatchItems value'
$MaxProviderRequests = New-xDscResourceProperty -Name MaxProviderRequests -Type String -Attribute Write -Description 'Set the MaxProviderRequests value'
$MaxMemoryPerShellMB = New-xDscResourceProperty -Name MaxMemoryPerShellMB -Type String -Attribute Write -Description 'Set the MaxMemoryPerShellMB value'

$HTTPSCert = New-xDscResourceProperty -Name HTTPSCertThumpprint -Type String -Attribute Write -Description 'Enter value of HTTPS certificate thumprint'



$module = New-xDscResource -Name xWinRM `
-Property $protocol, $ensure, $basicservice, $basicclient, $digestclient, $kerberossevice, $kerberosclient, $negotiateservice, $negotiateclient, $certificateservice, $certificateclient, $credsspservice, $credsspclient, $allowunencryptedservice, $allowunencryptedclient, $httpport, $httpsport, `
$MaxEnvelopeSizekb,$MaxTimeoutms, $MaxBatchItems, $MaxProviderRequests, $MaxMemoryPerShellMB, $HTTPSCert `
-FriendlyName 'xWinRM' `
-ModuleName 'xWinRM' `
-Path 'C:\Users\Anthony\Documents\BitBucket' `
-Verbose