<#
.SYNOPSIS  Drive the Copilot CLI quickstart (docs/arbeidsflyt/hurtigstart.md) in lab/quickstart and take one
           terminal picture per step with tools/termshot.ps1. Run from the repo root with the PC unlocked.
.EXAMPLE   pwsh -NoProfile -File tools/lab-quickstart.ps1 -EnvironmentId <guid> -Steps "1,4,6,7"
.NOTES     Step 4 runs the create-app skill non-interactively (copilot -p ... --allow-all) in an empty
           lab folder; that is the one place --allow-all is acceptable (see docs/arbeidsflyt/grenser.md).
           Pictures land in lab/quickstart/NN-*.png (gitignored); blur the environment id, the Local Play
           URL and the push URL with tools/annotate.py before copying to docs/assets.
#>
param(
  [Parameter(Mandatory)] [string] $EnvironmentId,
  [string] $Steps = "1,4,6,7",
  [string] $AppDir = "lab/quickstart/my-app",
  [string] $OutDir = "lab/quickstart"
)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$termshot = Join-Path $root 'tools/termshot.ps1'
$app = Join-Path $root $AppDir
$out = Join-Path $root $OutDir
New-Item -ItemType Directory -Force $out | Out-Null
$want = $Steps -split ',' | ForEach-Object { [int]$_.Trim() }

function Shot([string]$cmd, [string]$file, [int]$wait, [int]$rows, [string]$workdir, [string]$display) {
  $args = @('-NoProfile', '-File', $termshot, '-Command', $cmd, '-Out', (Join-Path $out $file),
            '-Wait', $wait, '-Rows', $rows, '-WorkDir', $workdir)
  if ($display) { $args += @('-Display', $display) }
  & pwsh @args
}

if ($want -contains 1) {
  # Step 1: marketplace + plugin install (idempotent), then the check the page asks for.
  $cmd = 'copilot plugin marketplace add microsoft/power-platform-skills; copilot plugin install code-apps-preview@power-platform-skills; copilot plugin list'
  $disp = "copilot plugin marketplace add microsoft/power-platform-skills`ncopilot plugin install code-apps-preview@power-platform-skills`ncopilot plugin list"
  Shot $cmd '01-plugin-install.png' 25 22 $root $disp
}

if ($want -contains 4) {
  # Step 4 (and 5): create-app from an empty folder. Non-interactive, so the plan and the build show in one run.
  if (Test-Path $app) { Remove-Item $app -Recurse -Force }
  New-Item -ItemType Directory -Force $app | Out-Null
  $prompt = "/code-apps-preview:create-app Create an app that shows my colleagues from Office 365 Users in a searchable list. Selecting a person shows their name, title, department, e-mail and phone. Deploy to environment: $EnvironmentId. Do not run the app and do not push it; stop after the code is written."
  $cmd = 'copilot -p ' + "'" + $prompt.Replace("'", "''") + "'" + ' --allow-all'
  $disp = "copilot`n/code-apps-preview:create-app`nCreate an app that shows my colleagues from Office 365 Users in a searchable list.`nSelecting a person shows their name, title, department, e-mail and phone.`nDeploy to environment: $EnvironmentId"
  Shot $cmd '04-plan.png' 420 48 $app $disp
  # Step 5 check: what the folder looks like afterwards.
  Shot 'Get-ChildItem -Name; Get-ChildItem generated -Name' '05-build.png' 4 20 $app "ls`nls generated"
}

if ($want -contains 6) {
  Shot 'pa app run' '06-run.png' 14 20 $app
}

if ($want -contains 7) {
  Shot 'npm run build; pa app push' '07-push.png' 90 26 $app "npm run build`npa app push"
}
