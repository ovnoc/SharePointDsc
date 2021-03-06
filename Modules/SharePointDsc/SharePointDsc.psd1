#
# Module manifest for module 'SharePointDsc'
#
# Generated by: Brian Farnhill
#
# Generated on: 17/03/2015
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '2.0.0.0'

# ID used to uniquely identify this module
GUID = '6c1176a0-4fac-4134-8ca2-3fa8a21a7b90'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2015-2017 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This DSC module is used to deploy and configure SharePoint Server 2013 and 2016, and covers a wide range of areas including web apps, service apps and farm configuration.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @("modules\SharePointDsc.Util\SharePointDsc.Util.psm1")

# Functions to export from this module
#FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = @("Invoke-SPDSCCommand",
                    "Get-SPDSCInstalledProductVersion",
                    "Get-SPDSCContentService",
                    "Rename-SPDSCParamValue",
                    "Add-SPDSCUserToLocalAdmin",
                    "Remove-SPDSCUserToLocalAdmin",
                    "Test-SPDSCObjectHasProperty",
                    "Test-SPDSCRunAsCredential",
                    "Test-SPDSCUserIsLocalAdmin",
                    "Test-SPDscParameterState",
                    "Test-SPDSCIsADUser",
                    "Test-SPDSCRunningAsFarmAccount",
                    "Set-SPDscObjectPropertyIfValuePresent",
                    "Get-SPDSCUserProfileSubTypeManager",
                    "Get-SPDscOSVersion",
                    "Get-SPDSCRegistryKey",
                    "Resolve-SPDscSecurityIdentifier",
                    "Get-SPDscFarmProductsInfo",
                    "Get-SPDscFarmVersionInfo",
                    "Convert-SPDscADGroupIDToName",
                    "Convert-SPDscADGroupNameToID")

# Variables to export from this module
#VariablesToExport = '*'

# Aliases to export from this module
#AliasesToExport = '*'

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -prefix.
# DefaultCommandPrefix = ''

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource', 'preview')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/SharePointDsc/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/SharePointDsc'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = "
        * General
        * Added VSCode workspace settings to meet coding guidelines
        * Corrected comment in CodeCov.yml
        * Fixed several PSScriptAnalyzer warnings
      * SPAppManagementServiceApp
        * Fixed an issue where the instance name wasn't detected correctly
      * SPBCSServiceApp
        * Added custom Proxy Name support
        * Fixed an issue where the instance name wasn't detected correctly
      * SPBlobCacheSettings
        * Update to set non-default or missing blob cache properties
      * SPContentDatabase
        * Fixed localized issue
      * SPDesignerSettings
        * Fixed issue where URL with capitals were not accepted correctly
      * SPDistributedCacheService
        * Fixed issue where reprovisioning the Distributed Cache
          did not work
      * SPFarm
        * Implemented ToDo to return Central Admin Auth mode
        * Fixed an issue where the instance name wasn't detected correctly
      * SPInstall
        * Updated to document the requirements for an English ISO
      * SPInstallPrereqs
        * Updated to document which parameter is required for which
          version of SharePoint
        * Added SharePoint 2016 example
      * SPLogLevel
        * New resource
      * SPMachineTranslationServiceApp
        * Added custom Proxy Name support
        * Fixed an issue where the instance name wasn't detected correctly
      * SPManagedMetadataAppDefault
        * New resource
      * SPManagedMetadataServiceApp
        * Update to allow the configuration of the default and
          working language
        * Fixed issue where the termstore could not be retrieved if the
          MMS service instance was stopped
        * Fixed an issue where the instance name wasn't detected correctly
      * SPMinRoleCompliance
        * New resource
      * SPPerformancePointServiceApp
        * Fixed an issue where the instance name wasn't detected correctly
      * SPProjectServer
        * New resources to add Project Server 2016 support:
        SPProjectServerLicense, SPProjectServerAdditionalSettings,
        SPProjectServerADResourcePoolSync, SPProjectServerGlobalPermissions,
        SPProjectServerGroup, SPProjectServerTimeSheetSettings,
        SPProjectServerUserSyncSettings, SPProjectServerWssSettings
      * SPSearchContentSource
        * Fixed examples
      * SPSearchIndexPartition
        * Fixed to return the RootFolder parameter
      * SPSearchServiceApp
        * Fixed an issue where the instance name wasn't detected correctly
      * SPSearchTopology
        * Updated to better document how the resource works
        * Fixed issue to only return first index partition to prevent
          conflicts with SPSearchIndexPartition
      * SPSecureStoreServiceApp
        * Fixed issue with not returning AuditEnabled parameter in Get method
        * Fixed an issue where the instance name wasn't detected correctly
      * SPServiceAppSecurity
        * Fixed issue with NullException when no accounts are configured
          in SharePoint
      * SPStateServiceApp
        * Added custom Proxy Name support
        * Fixed an issue where the instance name wasn't detected correctly
      * SPSubscriptionSettings
        * Fixed an issue where the instance name wasn't detected correctly
      * SPTrustedRootAuthority
        * Updated to enable using private key certificates.
      * SPUsageApplication
        * Fixed an issue where the instance name wasn't detected correctly
      * SPUserProfileProperty
        * Fixed two NullException issues
      * SPUserProfileServiceApp
        * Fixed an issue where the instance name wasn't detected correctly
      * SPUserProfileSynConnection
        * Fix an issue with ADImportConnection
      * SPWeb
        * Update to allow the management of the access requests settings
      * SPWebAppGeneralSettings
        * Added DefaultQuotaTemplate parameter
      * SPWebApplicationExtension
        * Update to fix how property AllowAnonymous is returned in the
          hashtable
      * SPWebAppPeoplePickerSettings
        * New resource
      * SPWebAppPolicy
        * Fixed issue where the SPWebPolicyPermissions couldn't be used
          twice with the exact same values
      * SPWebAppSuiteBar
        * New resource
      * SPWebApplication.Throttling
        * Fixed issue with where the RequestThrottling parameter was
          not applied
      * SPWordAutomationServiceApp
        * Fixed an issue where the instance name wasn't detected correctly
      * SPWorkflowService
        * New resource

      The following changes will break 1.x configurations that use these resources:

      * SPAlternateUrl
        * Added the Internal parameter, which implied a change to the key parameters
      * SPCreateFarm
        * Removed resource, please update your configurations to use SPFarm.
          See http://aka.ms/SPDsc-SPFarm for details.
      * SPJoinFarm
        * Removed resource, please update your configurations to use SPFarm.
          See http://aka.ms/SPDsc-SPFarm for details.
      * SPManagedMetadataServiceApp
        * Changed implementation of resource. This resource will not set any defaults
          for the keyword and site collection term store. The new resource
          SPManagedMetadataServiceAppDefault has to be used for this setting.
      * SPShellAdmin
        * Updated so it also works for non-content databases
      * SPTimerJobState
        * Updated to make the WebAppUrl parameter a key parameter.
          The resource can now be used to configure the same job for multiple
          web applications. Also changed the Name parameter to TypeName, due to
          a limitation with the SPTimerJob cmdlets
      * SPUserProfileProperty
        * Fixed an issue where string properties were not created properly
      * SPUSerProfileServiceApp
        * Updated to remove the requirement for CredSSP
      * SPUserProfileSyncService
        * Updated to remove the requirement for CredSSP
      * SPWebAppAuthentication
        * New resource
      * SPWebApplication
        * Changed implementation of the Web Application authentication configuration.
          A new resource has been added and existing properties have been removed
      * SPWebApplicationExtension
        * Updated so it infers the UseSSL value from the URL
        * Changed implementation of the Web Application authentication configuration.
          A new resource has been added and existing properties have been removed
"

    } # End of PSData hashtable

} # End of PrivateData hashtable
}

