function ConvertFrom-SecureSecret {
    [cmdletBinding()]
    param (
        [parameter(Mandatory = $true, ValueFromPipeline)]
        [SecureString]$SecureString
    )
    [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR(($SecureString)))
}