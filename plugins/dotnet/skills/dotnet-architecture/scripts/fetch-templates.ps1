<#
.SYNOPSIS
  Clones or updates the MrJB architecture templates into a local cache and prints the path.
#>
param(
    [string]$RepoUrl = 'https://github.com/mrjamiebowman/Templates-Application-Architecture.git',
    [string]$Destination = (Join-Path $HOME '.cache/mrjb-templates')
)

$ErrorActionPreference = 'Stop'

if (Test-Path (Join-Path $Destination '.git')) {
    git -C $Destination pull --ff-only --quiet
} else {
    New-Item -ItemType Directory -Force -Path (Split-Path $Destination) | Out-Null
    git clone --depth 1 --quiet $RepoUrl $Destination
}

Write-Output (Resolve-Path $Destination).Path
