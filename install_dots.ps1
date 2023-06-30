$cwd = (Get-Location).Path
$dotsToInstall = "nvim", "wezterm"
$configDir = "$env:USERPROFILE\.config"

foreach ($dot in $dotsToInstall) {
  $linkName = Join-Path $configDir $dot
  New-Item -ItemType SymbolicLink -Path $linkName -Target (Join-Path $cwd "condif" $dot)
}
