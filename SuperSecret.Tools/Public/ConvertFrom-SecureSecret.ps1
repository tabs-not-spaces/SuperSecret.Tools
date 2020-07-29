<#
.EXTERNALHELP SuperSecret.Tools-help.xml
#>
function ConvertFrom-SecureSecret {
    [cmdletBinding()]
    param (
        [parameter(Mandatory = $true, ValueFromPipeline)]
        [SecureString]$SecureString
    )
    [Runtime.InteropServices.Marshal]::PtrToStringBSTR([Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString))
}