$cwd = (Get-Location).Path
$dotsToInstall = "nvim", "wezterm"
$configDir = "$env:USERPROFILE\.config"

foreach ($dot in $dotsToInstall) {
  $linkName = Join-Path $configDir $dot
  $targetName = [IO.Path]::Combine($cwd, "config", $dot)

  Write-Output $linkName
  Write-Output $targetName

  New-Item -ItemType SymbolicLink -Path $linkName -Target $targetName
}
