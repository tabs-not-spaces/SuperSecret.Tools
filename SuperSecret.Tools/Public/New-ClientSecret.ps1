<#
.EXTERNALHELP SuperSecret.Tools-help.xml
#>
function New-ClientSecret {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $false)]
        [switch]$PlainText
    )
    $bytes = New-Object Byte[] 32
    $rand = [System.Security.Cryptography.RandomNumberGenerator]::Create()
    $rand.GetBytes($bytes)
    $clientSecret = [System.Convert]::ToBase64String($bytes) | ConvertTo-SecureString -AsPlainText -Force
    if ($PlainText) {
        ConvertFrom-SecureSecret -SecureString $clientSecret
    }
    else {
        return $clientSecret
    }
}