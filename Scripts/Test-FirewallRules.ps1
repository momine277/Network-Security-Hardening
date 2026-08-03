<#
.SYNOPSIS
    Verifie les regles de pare-feu Windows actives et produit un rapport de conformite basique.
.DESCRIPTION
    Ce script liste les regles de pare-feu actives, identifie les regles trop permissives
    (autorisant "Any" en source ou destination) et genere un rapport CSV.
.EXAMPLE
    .\Test-FirewallRules.ps1 -ReportPath ".\rapport-firewall.csv"
#>

param(
    [string]$ReportPath = ".\rapport-firewall.csv"
)

$rules = Get-NetFirewallRule -Enabled True

$report = foreach ($rule in $rules) {
    $filters = $rule | Get-NetFirewallAddressFilter
    $isPermissive = ($filters.RemoteAddress -eq "Any") -and ($rule.Direction -eq "Inbound")

    [PSCustomObject]@{
        Nom          = $rule.DisplayName
        Direction    = $rule.Direction
        Action       = $rule.Action
        Profil       = $rule.Profile
        AdresseDistante = $filters.RemoteAddress -join ","
        TropPermissive  = $isPermissive
    }
}

$report | Sort-Object TropPermissive -Descending | Export-Csv -Path $ReportPath -NoTypeInformation -Encoding UTF8

$nbPermissives = ($report | Where-Object { $_.TropPermissive }).Count
Write-Host "Rapport genere : $ReportPath"
Write-Host "$nbPermissives regle(s) potentiellement trop permissive(s) detectee(s)."
