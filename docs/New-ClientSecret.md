---
external help file: SuperSecret.Tools-help.xml
Module Name: SuperSecret.Tools
online version:
schema: 2.0.0
---

# New-ClientSecret

## SYNOPSIS
Quickly generate a randomized string to be used however you want.

## SYNTAX

```
New-ClientSecret [-PlainText] [<CommonParameters>]
```

## DESCRIPTION
Quickly generate a randomized string to be used however you want.

## EXAMPLES

### Example 1
```powershell
PS C:\> $clientSecret = New-ClientSecret
```

This will generate a unique and random string and store it as a SecureString type. Can then be used with other cmdlets that require such a thing.

### Example 1
```powershell
PS C:\> $clientSecret = New-ClientSecret -PlainText
```

This will generate a unique and random string and store it as a String type.

## PARAMETERS

### -PlainText
Don't want security? No worries bud.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
