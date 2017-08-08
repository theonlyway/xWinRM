#requires -Version 1.0
Import-Module -Name .\DSCResources\xWinRM\xWinRM.psm1

$WarningPreference = 'silentlycontinue'

$Global:DSCModuleName      = 'xWinRM'
$Global:DSCResourceName    = 'xWinRM'

InModuleScope -ModuleName xWinRM -ScriptBlock {
  $returnValue = @{
    Service_Basic              = 'false'
    Client_Basic               = 'false'
    Client_Digest              = 'false'
    Service_Kerberos           = 'false'
    Client_Kerberos            = 'false'
    Service_Negotiate          = 'false'
    Client_Negotiate           = 'false'
    Service_Certificate        = 'true'
    Client_Certificate         = 'false'
    Service_CredSSP            = 'true'
    Client_CredSSP             = 'true'
    Service_AllowUnencrypted   = 'true'
    Client_AllowUnencrypted    = 'true'
    HttpPort                   = 5985
    HttpsPort                  = 5986
    MaxEnvelopeSizekb          = 500
    MaxTimeoutms               = 60000
    MaxBatchItems              = 32000
    MaxProviderRequests        = 4294967295
    MaxMemoryPerShellMB        = 1024
    CurrentHTTPSCertThumpprint = $null
  }

  Describe -Name "Testing if $($Global:DSCResourceName)\Get-TargetResource and $($Global:DSCResourceName)\Test-TargetResource return correct objects" -Fixture {
    It -name 'Get-TargetResource returns a hashtable' -test {
      Get-TargetResource -Protocol HTTP -Ensure Present | Should Be 'System.Collections.Hashtable'
    }

    It -name 'Test-TargetResource returns true or false' -test {
      (Test-TargetResource -Protocol HTTP -Ensure Present).GetType() -as [string] | Should Be 'bool'
    }
  }
  Describe -Name "$($Global:DSCResourceName)\Set-TargetResource" -Fixture {
    Context -Name "Testing $($Global:DSCResourceName)\Set-TargetResource logic for ensure = present" -Fixture {   
      It -name 'Configuring WinRM HTTP listener' -test {
        Set-TargetResource -Protocol HTTP -Ensure Present -HttpPort 6000 -Service_AllowUnencrypted false
      }
      It -name 'Configuring WinRM HTTPS listener' -test {
        Set-TargetResource -Protocol HTTPS -Ensure Present -Service_AllowUnencrypted false -HttpsPort 6005
      }
    }
    Context -Name "Testing $($Global:DSCResourceName)\Set-TargetResource results" -Fixture {   
      It -name 'WinRM HTTP listener port should be 6000' -test {
        (Get-TargetResource -Protocol HTTP -Ensure Present).HttpPort| Should be 6000
      }
      It -name 'WinRM HTTPS listener port should be 6005' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).HttpsPort| Should be 6005
      }
      It -name 'WinRM service Basic auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Service_Basic | Should be 'true'
      }
      It -name 'WinRM client Basic auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Client_Basic| Should be 'true'
      }
      It -name 'WinRM service Kerberos auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Service_Basic | Should be 'true'
      }
      It -name 'WinRM client Kerberos auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Client_Kerberos | Should be 'true'
      }
      It -name 'WinRM service Kerberos auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Service_Kerberos | Should be 'true'
      }
      It -name 'WinRM client Negotiate auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Client_Negotiate | Should be 'true'
      }
      It -name 'WinRM service Negotiate auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Service_Negotiate  | Should be 'true'
      }
      It -name 'WinRM client basic auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Client_Basic| Should be 'true'
      }
      It -name 'WinRM service Certificate auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Service_Certificate | Should be 'false'
      }
      It -name 'WinRM client Certificate auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Client_Certificate | Should be 'true'
      }
      It -name 'WinRM service CredSSP auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Service_CredSSP | Should be 'false'
      }
      It -name 'WinRM client CredSSP auth should be true' -test {
        (Get-TargetResource -Protocol HTTPS -Ensure Present).Client_CredSSP | Should be 'false'
      }
    }
    Context -Name "Testing $($Global:DSCResourceName)\Test-TargetResource results" -Fixture {   
      It -name 'Test-TargetResource returns true' -test {
        Test-TargetResource -Protocol HTTP -Ensure Present -Service_AllowUnencrypted false -HttpPort 6000 | Should Be $true
      }
      It -name 'Test-TargetResource returns true' -test {
        Test-TargetResource -Protocol HTTPS -Ensure Present -Service_AllowUnencrypted false -HttpsPort 6005 | Should Be $true
      }
    }
    Context -Name "Testing $($Global:DSCResourceName)\Set-TargetResource logic for ensure = absent" -Fixture {   
      It -name 'Configuring WinRM HTTP listener' -test {
        Set-TargetResource -Protocol HTTP -Ensure Absent -HttpPort 6000 -Service_AllowUnencrypted false
      }
      It -name 'Configuring WinRM HTTPS listener' -test {
        Set-TargetResource -Protocol HTTPS -Ensure Absent -Service_AllowUnencrypted false -HttpsPort 6005
      }
    }
    Context -Name "Testing $($Global:DSCResourceName)\Test-TargetResource results" -Fixture {   
      It -name 'Test-TargetResource returns true' -test {
        Test-TargetResource -Protocol HTTP -Ensure Absent -Service_AllowUnencrypted false -HttpPort 6000 | Should Be $true
      }
      It -name 'Test-TargetResource returns true' -test {
        Test-TargetResource -Protocol HTTPS -Ensure Absent -Service_AllowUnencrypted false -HttpsPort 6005 | Should Be $true
      }
    }
  }
  Describe -Name "$($Global:DSCResourceName)\Test-TargetResource" -Fixture {
    Mock -CommandName Get-TargetResource -MockWith {
      $returnValue
    }
    It -name 'Test-TargetResource returns false' -test {
      Test-TargetResource -Protocol HTTP -Ensure Present -Service_AllowUnencrypted false -HttpPort 6000 | Should Be $false
    }
    It -name 'Test-TargetResource returns false' -test {
      Test-TargetResource -Protocol HTTPS -Ensure Present -Service_AllowUnencrypted false -HttpsPort 6005 | Should Be $false
    }
    It -name 'Test-TargetResource returns true' -test {
      Test-TargetResource -Protocol HTTP -Ensure Absent -Service_AllowUnencrypted false -HttpPort 6000 | Should Be $true
    }
    It -name 'Test-TargetResource returns true' -test {
      Test-TargetResource -Protocol HTTPS -Ensure Absent -Service_AllowUnencrypted false -HttpsPort 6005 | Should Be $true
    }
  }
}