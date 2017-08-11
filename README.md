# Builds

**Master**: [![Build status](https://ci.appveyor.com/api/projects/status/bmjs9sdeth5f7fd5/branch/master?svg=true)](https://ci.appveyor.com/project/theonlyway/xwinrm/branch/master)

# xWinRM #
## Overview ##

This custom resource enables or disables WinRM. In addition it can configure values for the service or client etc as well as configure both not only the HTTP listener but the HTTPS listener. It can configure the HTTPS with a generated self signed certificate or use one you have provided.

### Parameters ###

**Note:** Currently only supports one zone per config block

**Protocol**

*Note: This is a required parameter*

- HTTP - This will target the HTTP listener
- HTTPS - This will target the HTTPS listener


**Ensure**

*Note: This is a required parameter*

- Present - Ensures the configuration exists
- Absent - Ensures the listener doesn't exist


**HTTPPort**

- 5985 - This is the default port for WinRM HTTP

**HTTPSPort**

- 5986 - This is the default port for WinRM HTTP

**HTTPSCertThumpprint**

- If you supply a thumbprint it will configure the HTTPS listener with the thumbprint. However, if you don't specify one it will create an self-signed certificate that is valid for 10 years and is non-exportable.

The default value is **self**

**Service_Basic**

- true - Enable basic authentication for the WinRM service
- false - Disable basic authenticaiton for the WinRM service

The default value is **true**

**Client_Basic**

- true - Enable basic authentication for the WinRM client
- false - Disable basic authenticaiton for the WinRM client

The default value is **true**

**Client_Digest**

- true - Enable digest authentication for the WinRM client
- false - Disable digest authenticaiton for the WinRM client

The default value is **true**

**Service_Kerberos**

- true - Enable kerberos authentication for the WinRM service
- false - Disable kerberos authenticaiton for the WinRM service

The default value is **true**

**Client_Kerberos**

- true - Enable kerberos authentication for the WinRM client
- false - Disable kerberos authenticaiton for the WinRM client

The default value is **true**

**Service_Negotiate**

- true - Enable negotiate authentication for the WinRM service
- false - Disable negotiate authenticaiton for the WinRM service

The default value is **true**

**Client_Negotiate**

- true - Enable negoiate authentication for the WinRM client
- false - Disable negotiate authenticaiton for the WinRM client

The default value is **true**

**Service_Certificate**

- true - Enable certificate authentication for the WinRM service
- false - Disable certificate authenticaiton for the WinRM service

The default value is **false**

**Client_Certificate**

- true - Enable certificate authentication for the WinRM client
- false - Disable certificate authenticaiton for the WinRM client

The default value is **true**

**Service_CredSSP**

- true - Enable credssp authentication for the WinRM service
- false - Disable credssp authenticaiton for the WinRM service

The default value is **false**

**Client_CredSSP**

- true - Enable credssp authentication for the WinRM client
- false - Disable credssp authenticaiton for the WinRM client

The default value is **false**

**Service_AllowUnencrypted**

- true - Enable unencrypted traffic for the WinRM service
- false - Disable unencrypted traffic for the WinRM service

The default value is **false**

**Client_AllowUnencrypted**

- true - Enable unencrypted traffic for the WinRM client
- false - Disable unencrypted traffic for the WinRM client

The default value is **false**

**MaxEnvelopeSizekb**

- 500 - Set the max envelope size for the WinRM service

**MaxTimeoutms**

- 60000 - Set the max timeout for the WinRM service

**MaxBatchItems**

- 32000 - Set the max batch for the WinRM service

**MaxProviderRequests**

- 4294967295 - Set the max provider requests for the WinRM service

**MaxMemoryPerShellMB**

- 1024 - Set the max memory per shell for the WinRM service

### Example ###

    xWinRM WinRMHTTPS
    {
      Protocol = "HTTPS"
      Ensure = "Present"
      Service_AllowUnencrypted = 'false'
	  HTTPSCertThumpprint = 'BDFCF01AF7996427D93A84D016527E534D4E95DA'
    }

# Versions

## 1.0.8
First buildable version

