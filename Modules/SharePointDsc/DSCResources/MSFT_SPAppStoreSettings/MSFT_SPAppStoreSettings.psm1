function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]  
        [System.String] 
        $WebAppUrl,

        [parameter(Mandatory = $false)]  
        [System.Boolean] 
        $AllowAppPurchases,

        [parameter(Mandatory = $false)]  
        [System.Boolean] 
        $AllowAppsForOffice,

        [parameter(Mandatory = $false)] 
        [System.Management.Automation.PSCredential] 
        $InstallAccount
    )

    Write-Verbose -Message "Getting app store settings of $WebAppUrl"

    $result = Invoke-SPDSCCommand -Credential $InstallAccount `
                                  -Arguments $PSBoundParameters `
                                  -ScriptBlock {
        $params = $args[0]

        $nullreturn = @{
            WebAppUrl = $null
            InstallAccount = $params.InstallAccount
        }

        $wa = Get-SPWebApplication -Identity $params.WebAppUrl -ErrorAction SilentlyContinue
        if ($null -eq $wa) 
        {
            return $nullreturn
        }

        $AllowAppPurchases = [System.Convert]::ToBoolean((Get-SPAppAcquisitionConfiguration -WebApplication $params.WebAppUrl).Enabled)
        $AllowAppsForOffice = [System.Convert]::ToBoolean((Get-SPOfficeStoreAppsDefaultActivation -WebApplication $params.WebAppUrl).Enable)

        return @{
            WebAppUrl = $params.WebAppUrl
            AllowAppPurchases = $AllowAppPurchases
            AllowAppsForOffice = $AllowAppsForOffice
            InstallAccount = $params.InstallAccount
        }
    }
    return $result
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]  
        [System.String] 
        $WebAppUrl,

        [parameter(Mandatory = $false)]  
        [System.Boolean] 
        $AllowAppPurchases,

        [parameter(Mandatory = $false)]  
        [System.Boolean] 
        $AllowAppsForOffice,

        [parameter(Mandatory = $false)] 
        [System.Management.Automation.PSCredential] 
        $InstallAccount
    )

    Write-Verbose -Message "Setting app store settings of $WebAppUrl"

    Invoke-SPDSCCommand -Credential $InstallAccount `
                        -Arguments $PSBoundParameters `
                        -ScriptBlock {
        $params = $args[0]

        $wa = Get-SPWebApplication -Identity $params.WebAppUrl -ErrorAction SilentlyContinue
        if ($null -eq $wa) 
        {
            throw ("Specified web application does not exist.")
        }

        if ($params.ContainsKey("AllowAppPurchases"))
        {
            $AllowAppPurchases = [System.Convert]::ToBoolean((Get-SPAppAcquisitionConfiguration -WebApplication $params.WebAppUrl).Enabled)
            if ($AllowAppPurchases -ne $params.AllowAppPurchases)
            {
                Set-SPAppAcquisitionConfiguration -WebApplication $params.WebAppUrl -Enable $params.AllowAppPurchases
            }
        }

        if ($params.ContainsKey("AllowAppsForOffice"))
        {
            $AllowAppsForOffice = [System.Convert]::ToBoolean((Get-SPOfficeStoreAppsDefaultActivation -WebApplication $params.WebAppUrl).Enable)
            if ($AllowAppsForOffice -ne $params.AllowAppsForOffice)
            {
                Set-SPOfficeStoreAppsDefaultActivation -WebApplication $params.WebAppUrl -Enable $params.AllowAppsForOffice
            }
        }
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]  
        [System.String] 
        $WebAppUrl,

        [parameter(Mandatory = $false)]  
        [System.Boolean] 
        $AllowAppPurchases,

        [parameter(Mandatory = $false)]  
        [System.Boolean] 
        $AllowAppsForOffice,

        [parameter(Mandatory = $false)] 
        [System.Management.Automation.PSCredential] 
        $InstallAccount
    )

    Write-Verbose -Message "Testing app store settings of $WebAppUrl"

    $currentValues = Get-TargetResource @PSBoundParameters

    if ($null -eq $currentValues.WebAppUrl) {
        Write-Verbose -Message "Specified web application does not exist."
        return $false
    }

    if ($PSBoundParameters.ContainsKey("AllowAppPurchases"))
    {
        if ($AllowAppPurchases -ne $currentValues.AllowAppPurchases)
        {
            return $false
        }
    }

    if ($PSBoundParameters.ContainsKey("AllowAppsForOffice"))
    {
        if ($AllowAppsForOffice -ne $currentValues.AllowAppsForOffice)
        {
            return $false
        }
    }

    return $true
}

Export-ModuleMember -Function *-TargetResource
