$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

  $adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

if ($myWindowsPrincipal.IsInRole($adminRole))
{
  $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    $Host.UI.RawUI.BackgroundColor = "DarkBlue"
    clear-host
}
else
{
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = $myInvocation.MyCommand.Definition;
  $newProcess.Verb = "runas";

  [System.Diagnostics.Process]::Start($newProcess);

  exit
}

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
