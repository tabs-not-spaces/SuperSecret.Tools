﻿[cmdletbinding()]
param (
    [parameter(Mandatory = $true)]
    [System.IO.FileInfo]$modulePath,

    [parameter(Mandatory = $false)]
    [switch]$buildLocal
)

try {
    #region Generate a new version number
    $moduleName = Split-Path -Path $modulePath -Leaf
    [Version]$exVer = Find-Module -Name $moduleName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Version
    if ($buildLocal) {
        $rev = ((Get-ChildItem -Path "$PSScriptRoot\bin\release\" -ErrorAction SilentlyContinue).Name | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum) + 1
        $newVersion = New-Object -TypeName Version -ArgumentList 1, 0, 0, $rev
    }
    else {
        $newVersion = if ($exVer) {
            $rev = ($exVer.Revision + 1)
            New-Object version -ArgumentList $exVer.Major, $exVer.Minor, $exVer.Build, $rev
        }
        else {
            $rev = ((Get-ChildItem "$PSScriptRoot\bin\release\" -ErrorAction SilentlyContinue).Name | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum) + 1
            New-Object Version -ArgumentList 1, 0, 0, $rev
        }
    }
    $releaseNotes = (Get-Content ".\$moduleName\ReleaseNotes.txt" -Raw -ErrorAction SilentlyContinue).Replace("{{NewVersion}}", $newVersion)
    $releaseNotes = $exVer ? $releaseNotes.Replace("{{LastVersion}}", "$($exVer.ToString())") : $releaseNotes.Replace("{{LastVersion}}", "")
    #endregion

    #region Build out the release
    $relPath = "$PSScriptRoot\bin\release\$rev\$moduleName"
    "Version is $newVersion"
    "Module Path is $modulePath"
    "Module Name is $moduleName"
    "Release Path is $relPath"
    if (!(Test-Path -Path $relPath)) {
        New-Item -Path $relPath -ItemType Directory -Force | Out-Null
    }

    Copy-Item -Path "$modulePath\*" -Destination "$relPath" -Recurse -Exclude ".gitKeep", "releaseNotes.txt", "description.txt"

    $Manifest = @{
        Path              = "$relPath\$moduleName.psd1"
        ModuleVersion     = $newVersion
        Description       = (Get-Content "$modulePath\description.txt" -Raw).ToString()
        FunctionsToExport = (Get-ChildItem -Path "$relPath\Public\*.ps1" -Recurse).BaseName
        ReleaseNotes      = $releaseNotes
    }
    Update-ModuleManifest @Manifest
}
catch {
    $_
}