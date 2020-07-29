---
external help file: SuperSecret.Tools-help.xml
Module Name: SuperSecret.Tools
online version:
schema: 2.0.0
---

# ConvertFrom-SecureSecret

## SYNOPSIS
Ruthlessly convert any [System.Security.SecureString] back to plaintext. Can be useful for many reasons.

## SYNTAX

```
ConvertFrom-SecureSecret [-SecureString] <SecureString> [<CommonParameters>]
```

## DESCRIPTION
Ruthlessly convert any [System.Security.SecureString] back to plaintext. Can be useful for many reasons.

## EXAMPLES

### Example 1
```powershell
PS C:\> $superSecretPassword = "SuperSecret" | ConvertTo-SecureString -AsPlainText -Force
PS C:\> $superSecretPassword

System.Security.SecureString

PS C:\> ConvertFrom-SecureSecret -SecureString $superSecretPassword
SuperSecret
```

As you can see, once a secure string is stored, you can't get it to return the original value (By design.)

However, there are scenarios where you might need it back for reference..

### Example 2
```powershell
PS C:\> $clientSecret = New-ClientSecret
PS C:\> $clientSecret | ConvertFrom-SecureSecret
<returned secret>
```

Pipeline support rules.

## PARAMETERS

### -SecureString
Put your secrets here. I wont tell anyone.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Security.SecureString

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
