<#
.SYNOPSIS
    Recreates a minimal demo DLP policy that blocks ONE connector, to prove DLP enforcement on Code Apps.

.DESCRIPTION
    Scope      : Tenant-wide, EXCLUDING the Preview developer environment
                 (so workshop experimentation stays unblocked).
    Strictness : Minimal/permissive. Default classification = General
                 (Non-business), so no connector-combination conflicts.
                 ONE connector (Dropbox) is moved to Blocked purely to
                 demonstrate DLP enforcement.

.NOTES
    Run under an INTERACTIVE Power Platform admin login (Add-PowerAppsAccount
    opens a browser). Cmdlets verified against Microsoft Learn:
      - New-DlpPolicy
      - Add-ConnectorsToPolicy        (-Classification Confidential|General|Blocked)
      - Set-AdminDlpPolicy            (-FilterType Include|Exclude)
      - Get-DlpPolicy
    Module: Microsoft.PowerApps.Administration.PowerShell
#>

# --- Config -------------------------------------------------------------
$PolicyDisplayName = '[Organisasjon] - Demo DLP (minimal)'

# The developer environment to EXCLUDE from the policy (environment id from PPAC) - EXCLUDED from the policy
$PreviewEnvId = '<environment-id-to-exclude>'

# The single connector to Block as the enforcement demo. Swap freely.
$BlockedConnector = [pscustomobject]@{
    id   = '/providers/Microsoft.PowerApps/apis/shared_dropbox'
    name = 'shared_dropbox'
    type = 'Microsoft.PowerApps/apis'
}
# ------------------------------------------------------------------------

# Step 1. Ensure the admin module is present, then import it.
if (-not (Get-Module -ListAvailable -Name Microsoft.PowerApps.Administration.PowerShell)) {
    Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Scope CurrentUser -Force -AllowClobber
}
Import-Module Microsoft.PowerApps.Administration.PowerShell

# Step 2. Sign in interactively (browser / device-code login).
Add-PowerAppsAccount

# Step 3. Create the policy tenant-wide. Default classification General =
#         everything Non-business, so nothing conflicts (permissive baseline).
$policy   = New-DlpPolicy -DisplayName $PolicyDisplayName -EnvironmentType 'AllEnvironments' -DefaultConnectorClassification 'General'
$policyId = $policy.PolicyName
if (-not $policyId) { $policyId = $policy.name }   # fallback for property naming
Write-Host "Created DLP policy: $policyId"

# Step 4. Block the single demo connector.
Add-ConnectorsToPolicy -PolicyName $policyId -Connectors @($BlockedConnector) -Classification 'Blocked'
Write-Host "Blocked connector: $($BlockedConnector.id)"

# Step 5. Apply to all environments EXCEPT Preview.
Set-AdminDlpPolicy -PolicyName $policyId -FilterType 'Exclude' -Environments $PreviewEnvId
Write-Host "Excluded environment: $PreviewEnvId"

# Step 6. Verify what was created.
Write-Host "`n--- Policy summary ---"
Get-DlpPolicy -PolicyName $policyId |
    Format-List displayName, environmentType, environments, lastModifiedTime
