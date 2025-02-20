# Install AD DS Role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Promote to Domain Controller
Install-ADDSForest `
    -DomainName "tcs.canary.com" `
    -DomainNetbiosName "tcs.canary" `
    -ForestMode "WinThreshold" `
    -DomainMode "WinThreshold" `
    -InstallDns:$true `
    -NoRebootOnCompletion:$false `
    -Force:$true

# Verify Installation
Get-ADDomainController
Get-ADDomain
