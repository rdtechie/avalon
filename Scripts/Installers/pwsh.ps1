#
################################################################################
##  File:  pwsh.ps1
##  Desc:  Installs PowerShell Modules
################################################################################
# Source the helpers for use with the script

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue' # Hiding the Progress Bar when installing the modules

$modules = @(
    @{Name = 'Az'; Version = '3.8.0' }
    @{Name = 'Pester'; Version = '4.10.1' }
    @{Name = 'PSScriptAnalyzer'; Version = '1.19.0' }
)

foreach ( $module in $modules ) {
    if (-not( Get-Module -Name $module.Name -ListAvailable )) {
        Write-Output -InputObject "Installing Module $( $module.Name ) version $( $module.Version )."
        Install-Module -Name $module.Name -RequiredVersion $module.Version -Scope AllUsers -Force | Out-Null
    } else {
        Write-Output -InputObject "Module $( $module.Name ) version $( $module.Version ) is already installed!"
    }
}