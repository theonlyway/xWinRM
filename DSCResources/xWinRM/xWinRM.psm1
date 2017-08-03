function Get-TargetResource
{
  [CmdletBinding()]
  [OutputType([System.Collections.Hashtable])]
  param
  (
    [parameter(Mandatory = $true)]
    [ValidateSet('HTTP','HTTPS')]
    [System.String]
    $Protocol,

    [parameter(Mandatory = $true)]
    [ValidateSet('Present','Absent')]
    [System.String]
    $Ensure,

    [System.Boolean]
    $Service_Basic = $false,

    [System.Boolean]
    $Client_Basic = $true,

    [System.Boolean]
    $Client_Digest = $true,

    [System.Boolean]
    $Service_Kerberos = $true,

    [System.Boolean]
    $Client_Kerberos = $true,

    [System.Boolean]
    $Service_Negotiate = $true,

    [System.Boolean]
    $Client_Negotiate = $true,

    [System.Boolean]
    $Service_Certificate = $false,

    [System.Boolean]
    $Client_Certificate = $true,

    [System.Boolean]
    $Service_CredSSP = $false,

    [System.Boolean]
    $Client_CredSSP = $false,

    [System.Boolean]
    $Service_AllowUnencrypted = $false,

    [System.Boolean]
    $Client_AllowUnencrypted = $false,

    [System.UInt32]
    $HttpPort = 5985,

    [System.UInt32]
    $HttpsPort = 5986,

    [System.UInt32]
    $MaxEnvelopeSizekb = 500,

    [System.UInt32]
    $MaxTimeoutms = 60000,

    [System.UInt32]
    $MaxBatchItems = 32000,

    [System.UInt32]
    $MaxProviderRequests = 4294967295,

    [System.UInt32]
    $MaxMemoryPerShellMB = 1024,

    [System.String]
    $HTTPSCertThumpprint = $null
  )

  #Write-Verbose "Use this cmdlet to deliver information about command processing."

  #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


  
      $returnValue = @{
      Protocol = $Protocol
      Ensure = $Ensure
      Service_Basic = (Get-ChildItem -Path WSMan:\localhost\Service\Auth\Basic -ErrorAction SilentlyContinue).Value
      Client_Basic = (Get-ChildItem -Path WSMan:\localhost\Client\Auth\Basic -ErrorAction SilentlyContinue).Value
      Client_Digest = (Get-ChildItem -Path WSMan:\localhost\Client\Auth\Digest -ErrorAction SilentlyContinue).Value
      Service_Kerberos = (Get-ChildItem -Path WSMan:\localhost\Service\Auth\Kerberos -ErrorAction SilentlyContinue).Value
      Client_Kerberos = (Get-ChildItem -Path WSMan:\localhost\Client\Auth\Kerberos -ErrorAction SilentlyContinue).Value
      Service_Negotiate = (Get-ChildItem -Path WSMan:\localhost\Service\Auth\Negotiate -ErrorAction SilentlyContinue).Value
      Client_Negotiate = (Get-ChildItem -Path WSMan:\localhost\Client\Auth\Negotiate -ErrorAction SilentlyContinue).Value
      Service_Certificate = (Get-ChildItem -Path WSMan:\localhost\Service\Auth\Certificate -ErrorAction SilentlyContinue).Value
      Client_Certificate = (Get-ChildItem -Path WSMan:\localhost\Client\Auth\Certificate -ErrorAction SilentlyContinue).Value
      Service_CredSSP = (Get-ChildItem -Path WSMan:\localhost\Service\Auth\CredSSP -ErrorAction SilentlyContinue).Value
      Client_CredSSP = (Get-ChildItem -Path WSMan:\localhost\Client\Auth\CredSSP -ErrorAction SilentlyContinue).Value
      Service_AllowUnencrypted = (Get-ChildItem -Path WSMan:\localhost\Service\AllowUnencrypted -ErrorAction SilentlyContinue).Value
      Client_AllowUnencrypted = (Get-ChildItem -Path WSMan:\localhost\Client\AllowUnencrypted -ErrorAction SilentlyContinue).Value
      HttpPort = (Get-ChildItem -Path WSMan:\localhost\Service\DefaultPorts\HTTP -ErrorAction SilentlyContinue).Value
      HttpsPort = (Get-ChildItem -Path WSMan:\localhost\Service\DefaultPorts\HTTPS -ErrorAction SilentlyContinue).Value
      MaxEnvelopeSizekb = (Get-ChildItem -Path WSMan:\localhost\MaxEnvelopeSizekb -ErrorAction SilentlyContinue).Value
      MaxTimeoutms = (Get-ChildItem -Path WSMan:\localhost\MaxTimeoutms -ErrorAction SilentlyContinue).Value
      MaxBatchItems = (Get-ChildItem -Path WSMan:\localhost\MaxBatchItems -ErrorAction SilentlyContinue).Value
      MaxProviderRequests = (Get-ChildItem -Path WSMan:\localhost\MaxProviderRequests -ErrorAction SilentlyContinue).Value
      MaxMemoryPerShellMB = (Get-ChildItem -Path WSMan:\localhost\Shell\MaxMemoryPerShellMB -ErrorAction SilentlyContinue).Value
      HTTPSCertThumpprint = (Get-ChildItem -Path cert:\LocalMachine\My -DnsName *WinRM*).Thumbprint
      }

      $returnValue

}


function Set-TargetResource
{
  [CmdletBinding()]
  param
  (
    [parameter(Mandatory = $true)]
    [ValidateSet('HTTP','HTTPS')]
    [System.String]
    $Protocol,

    [parameter(Mandatory = $true)]
    [ValidateSet('Present','Absent')]
    [System.String]
    $Ensure,

    [System.Boolean]
    $Service_Basic = $false,

    [System.Boolean]
    $Client_Basic = $true,

    [System.Boolean]
    $Client_Digest = $true,

    [System.Boolean]
    $Service_Kerberos = $true,

    [System.Boolean]
    $Client_Kerberos = $true,

    [System.Boolean]
    $Service_Negotiate = $true,

    [System.Boolean]
    $Client_Negotiate = $true,

    [System.Boolean]
    $Service_Certificate = $false,

    [System.Boolean]
    $Client_Certificate = $true,

    [System.Boolean]
    $Service_CredSSP = $false,

    [System.Boolean]
    $Client_CredSSP = $false,

    [System.Boolean]
    $Service_AllowUnencrypted = $false,

    [System.Boolean]
    $Client_AllowUnencrypted = $false,

    [System.UInt32]
    $HttpPort = 5985,

    [System.UInt32]
    $HttpsPort = 5986,

    [System.UInt32]
    $MaxEnvelopeSizekb = 500,

    [System.UInt32]
    $MaxTimeoutms = 60000,

    [System.UInt32]
    $MaxBatchItems = 32000,

    [System.UInt32]
    $MaxProviderRequests = 4294967295,

    [System.UInt32]
    $MaxMemoryPerShellMB = 1024,

    [System.String]
    $HTTPSCertThumpprint = $null
  )

  #Write-Verbose "Use this cmdlet to deliver information about command processing."

  #Write-Debug "Use this cmdlet to write debug information while troubleshooting."

  #Include this line if the resource requires a system reboot.
  #$global:DSCMachineStatus = 1
}


function Test-TargetResource
{
  [CmdletBinding()]
  [OutputType([System.Boolean])]
  param
  (
    [parameter(Mandatory = $true)]
    [ValidateSet('HTTP','HTTPS')]
    [System.String]
    $Protocol,

    [parameter(Mandatory = $true)]
    [ValidateSet('Present','Absent')]
    [System.String]
    $Ensure,

    [System.Boolean]
    $Service_Basic = $false,

    [System.Boolean]
    $Client_Basic = $true,

    [System.Boolean]
    $Client_Digest = $true,

    [System.Boolean]
    $Service_Kerberos = $true,

    [System.Boolean]
    $Client_Kerberos = $true,

    [System.Boolean]
    $Service_Negotiate = $true,

    [System.Boolean]
    $Client_Negotiate = $true,

    [System.Boolean]
    $Service_Certificate = $false,

    [System.Boolean]
    $Client_Certificate = $true,

    [System.Boolean]
    $Service_CredSSP = $false,

    [System.Boolean]
    $Client_CredSSP = $false,

    [System.Boolean]
    $Service_AllowUnencrypted = $false,

    [System.Boolean]
    $Client_AllowUnencrypted = $false,

    [System.UInt32]
    $HttpPort = 5985,

    [System.UInt32]
    $HttpsPort = 5986,

    [System.UInt32]
    $MaxEnvelopeSizekb = 500,

    [System.UInt32]
    $MaxTimeoutms = 60000,

    [System.UInt32]
    $MaxBatchItems = 32000,

    [System.UInt32]
    $MaxProviderRequests = 4294967295,

    [System.UInt32]
    $MaxMemoryPerShellMB = 1024,

    [System.String]
    $HTTPSCertThumpprint = $null
  )

  #Write-Verbose "Use this cmdlet to deliver information about command processing."

  #Write-Debug "Use this cmdlet to write debug information while troubleshooting."

  if ($Ensure -eq 'Present') 
  {
    if ($Protocol -eq 'HTTP') 
    {
      Write-Verbose -Message "Attempting to find $Protocol listener"      
      $listener = Get-ChildItem -Path WSMan:\localhost\listener -ErrorAction SilentlyContinue | Where-Object -FilterScript {
        $_.Keys -like "*$Protocol*"
      }
      if ($listener -ne $null) 
      {
       Write-Verbose -Message "Found $Protocol listener"
        return $true     
      }
      else 
      {
       Write-Verbose -Message "Could not find $Protocol listener"      
        return $false
      }
    }
    else 
    {
      Write-Verbose -Message "Attempting to find $Protocol listener"
      $listener = Get-ChildItem -Path WSMan:\localhost\listener -ErrorAction SilentlyContinue | Where-Object -FilterScript {
        $_.Keys -like '*HTTPS*'
      }
      if ($listener -ne $null) 
      {
       Write-Verbose -Message "Found $Protocol listener"              
        return $true
      }
      else 
      {
       Write-Verbose -Message "Could not find $Protocol listener"      
        return $false
      }    
    }
  }
  if ($Ensure -eq 'Absent') 
  {
    if ($Protocol -eq 'HTTP') 
    {
      Write-Verbose -Message "Attempting to find $Protocol listener"      
      $listener = Get-ChildItem -Path WSMan:\localhost\listener -ErrorAction SilentlyContinue | Where-Object -FilterScript {
        $_.Keys -like "*$Protocol*"
      }
      if ($listener -ne $null) 
      {
       Write-Verbose -Message "Found $Protocol listener"      
        return $false
      }
      else 
      {
       Write-Verbose -Message "Could not find $Protocol listener"      
        return $true
      }
    }
    else 
    {
      Write-Verbose -Message "Attempting to find $Protocol listener"
      $listener = Get-ChildItem -Path WSMan:\localhost\listener -ErrorAction SilentlyContinue | Where-Object -FilterScript {
        $_.Keys -like '*HTTPS*'
      }
      if ($listener -ne $null) 
      {
       Write-Verbose -Message "Found $Protocol listener"      
        return $false
      }
      else 
      {
       Write-Verbose -Message "Could not find $Protocol listener"      
        return $true
      }    
    }
  }
}


Export-ModuleMember -Function *-TargetResource