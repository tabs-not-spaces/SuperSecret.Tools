# SuperSecret.Tools

[![Build Status](https://dev.azure.com/powers-hell/SuperSecret.Tools/_apis/build/status/tabs-not-spaces.SuperSecret.Tools?branchName=master)](https://dev.azure.com/powers-hell/SuperSecret.Tools/_build/latest?definitionId=42&branchName=master)
![PowerShell Gallery](https://img.shields.io/powershellgallery/v/SuperSecret.Tools.svg?style=flat&logo=powershell&label=PSGallery%20Version)
![PSGallery Downloads](https://img.shields.io/powershellgallery/dt/SuperSecret.Tools.svg?style=flat&logo=powershell&label=PSGallery%20Downloads)

## Summary

New-AzADAppCredential doesn't generate client secrets. So Let's just do it ourselves.

## Getting Started

Install module from gallery

``` PowerShell
Install-Module SuperSecret.Tools -Scope CurrentUser
Import-Module SuperSecret.Tools
```

## Using the commands

- To generate a new client secret and store as a secure string..

```PowerShell
$clientSecret = New-ClientSecret
```

- To generate a new client secret and store as plain text..

```PowerShell
$clientSecret = New-ClientSecret -PlainText
```

- Need to recover the secure string? No Worries..

```PowerShell
$clientSecret | ConvertFrom-SecureSecret
```

Note: <code>ConvertFrom-SecureSecret</code> works for *any* secure strings stored as variables - get creative.


## Build from source

``` PowerShell
.\Build.ps1 -ModulePath .\SuperSecret.Tools -BuildLocal
Import-Module ".\bin\release\*\SuperSecret.Tools" -Force #replace the * with release number generated from build.
```


