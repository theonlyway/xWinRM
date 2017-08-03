function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $returnValue = @{
    Name = [System.String]
    Ensure = [System.String]
    Service_Basic = [System.Boolean]
    Client_Basic = [System.Boolean]
    Service_Digest = [System.Boolean]
    Client_Digest = [System.Boolean]
    Service_Kerberos = [System.Boolean]
    Client_Kerberos = [System.Boolean]
    Service_Negotiate = [System.Boolean]
    Client_Negotiate = [System.Boolean]
    Service_Certificate = [System.Boolean]
    Client_Certificate = [System.Boolean]
    Service_CredSSP = [System.Boolean]
    Client_CredSSP = [System.Boolean]
    Service_AllowUnencryptedService = [System.Boolean]
    Client_AllowUnencryptedClient = [System.Boolean]
    HttpPort = [System.UInt32]
    HttpsPort = [System.UInt32]
    MaxEnvelopeSizekb = [System.UInt32]
    MaxTimeoutms = [System.UInt32]
    MaxBatchItems = [System.UInt32]
    MaxProviderRequests = [System.UInt32]
    MaxMemoryPerShellMB = [System.UInt32]
    HTTPSCertThumpprint = [System.String]
    }

    $returnValue
    #>
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [System.Boolean]
        $Service_Basic,

        [System.Boolean]
        $Client_Basic,

        [System.Boolean]
        $Service_Digest,

        [System.Boolean]
        $Client_Digest,

        [System.Boolean]
        $Service_Kerberos,

        [System.Boolean]
        $Client_Kerberos,

        [System.Boolean]
        $Service_Negotiate,

        [System.Boolean]
        $Client_Negotiate,

        [System.Boolean]
        $Service_Certificate,

        [System.Boolean]
        $Client_Certificate,

        [System.Boolean]
        $Service_CredSSP,

        [System.Boolean]
        $Client_CredSSP,

        [System.Boolean]
        $Service_AllowUnencryptedService,

        [System.Boolean]
        $Client_AllowUnencryptedClient,

        [System.UInt32]
        $HttpPort,

        [System.UInt32]
        $HttpsPort,

        [System.UInt32]
        $MaxEnvelopeSizekb,

        [System.UInt32]
        $MaxTimeoutms,

        [System.UInt32]
        $MaxBatchItems,

        [System.UInt32]
        $MaxProviderRequests,

        [System.UInt32]
        $MaxMemoryPerShellMB,

        [System.String]
        $HTTPSCertThumpprint
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
        [System.String]
        $Name,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [System.Boolean]
        $Service_Basic,

        [System.Boolean]
        $Client_Basic,

        [System.Boolean]
        $Service_Digest,

        [System.Boolean]
        $Client_Digest,

        [System.Boolean]
        $Service_Kerberos,

        [System.Boolean]
        $Client_Kerberos,

        [System.Boolean]
        $Service_Negotiate,

        [System.Boolean]
        $Client_Negotiate,

        [System.Boolean]
        $Service_Certificate,

        [System.Boolean]
        $Client_Certificate,

        [System.Boolean]
        $Service_CredSSP,

        [System.Boolean]
        $Client_CredSSP,

        [System.Boolean]
        $Service_AllowUnencryptedService,

        [System.Boolean]
        $Client_AllowUnencryptedClient,

        [System.UInt32]
        $HttpPort,

        [System.UInt32]
        $HttpsPort,

        [System.UInt32]
        $MaxEnvelopeSizekb,

        [System.UInt32]
        $MaxTimeoutms,

        [System.UInt32]
        $MaxBatchItems,

        [System.UInt32]
        $MaxProviderRequests,

        [System.UInt32]
        $MaxMemoryPerShellMB,

        [System.String]
        $HTTPSCertThumpprint
    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $result = [System.Boolean]
    
    $result
    #>
}


Export-ModuleMember -Function *-TargetResource

