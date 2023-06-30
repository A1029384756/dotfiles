$cwd = (Get-Location).Path
$dotsToInstall = "nvim", "wezterm"
$configDir = "$env:USERPROFILE\.config"

foreach ($dot in $dotsToInstall) {
  $linkName = Join-Path $configDir $dot
  $srcName = Join-Path $cwd "config" $dot

  Write-Output $linkName
  Write-Output $srcName

  New-Item -ItemType SymbolicLink -Path $linkName -Target $srcName
}