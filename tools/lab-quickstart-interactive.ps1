<#
.SYNOPSIS  Run the Copilot CLI quickstart INTERACTIVELY in one new Windows Terminal window, type the skill
           and the app description with SendKeys, and take a picture at each stage (plan shown, build done).
           Fallback for when `copilot -p` (non-interactive) misbehaves. Run with the PC unlocked.
.EXAMPLE   pwsh -NoProfile -File tools/lab-quickstart-interactive.ps1 -EnvironmentId <guid>
.NOTES     Keeps the window open between captures (termshot.ps1 closes its window after one picture).
           Pictures: lab/quickstart/04-plan.png (plan awaiting approval) and 05-build.png (after the code is written).
#>
param(
  [Parameter(Mandatory)] [string] $EnvironmentId,
  [string] $AppDir = "C:/Users/gchi/source/code-app-lab/quickstart/my-app",
  [string] $OutDir = "lab/quickstart",
  [int] $PlanWait = 150,     # seconds to wait for the plan after the description is sent
  [int] $BuildWait = 420,    # seconds to wait for the build after approval
  [int] $Cols = 110,
  [int] $Rows = 40,
  [string] $Profile = "Windows PowerShell"
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
Add-Type @"
using System; using System.Collections.Generic; using System.Runtime.InteropServices; using System.Text;
public static class WI {
  [StructLayout(LayoutKind.Sequential)] public struct RECT { public int L, T, R, B; }
  public delegate bool EnumProc(IntPtr h, IntPtr l);
  [DllImport("user32.dll")] public static extern bool EnumWindows(EnumProc cb, IntPtr l);
  [DllImport("user32.dll")] public static extern bool IsWindowVisible(IntPtr h);
  [DllImport("user32.dll")] public static extern int GetClassName(IntPtr h, StringBuilder s, int n);
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr h);
  [DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr h, IntPtr a, int x, int y, int w, int hh, uint f);
  [DllImport("user32.dll")] public static extern bool PostMessage(IntPtr h, uint m, IntPtr w, IntPtr l);
  [DllImport("dwmapi.dll")] public static extern int DwmGetWindowAttribute(IntPtr h, int a, out RECT r, int s);
  public static List<IntPtr> TerminalWindows() {
    var list = new List<IntPtr>();
    EnumWindows((h, l) => {
      if (!IsWindowVisible(h)) return true;
      var sb = new StringBuilder(64); GetClassName(h, sb, 64);
      if (sb.ToString() == "CASCADIA_HOSTING_WINDOW_CLASS") list.Add(h);
      return true; }, IntPtr.Zero);
    return list;
  }
}
"@
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$out = Join-Path $root $OutDir; New-Item -ItemType Directory -Force $out | Out-Null
if (Test-Path $AppDir) { Remove-Item $AppDir -Recurse -Force }
New-Item -ItemType Directory -Force $AppDir | Out-Null

$shell = New-Object -ComObject Shell.Application
$shell.MinimizeAll(); Start-Sleep -Milliseconds 800
$env:PSModulePath = (@([Environment]::GetEnvironmentVariable('PSModulePath','User'),
                       [Environment]::GetEnvironmentVariable('PSModulePath','Machine')) | Where-Object { $_ }) -join ';'
$before = [WI]::TerminalWindows()
$tmp = Join-Path $env:TEMP ("labqs-" + [guid]::NewGuid().ToString('N') + ".ps1")
@('Clear-Host',
  'Write-Host -NoNewline ((prompt) -replace "(\e\[[0-9;?]*[A-Za-z]|\s)+$", "")',
  "Write-Host 'copilot'",
  'copilot') | Set-Content -Path $tmp -Encoding UTF8
Start-Process wt.exe -ArgumentList @('-w','new','--size',"$Cols,$Rows",'-p',"`"$Profile`"",'-d',"`"$AppDir`"",'powershell.exe','-NoExit','-ExecutionPolicy','Bypass','-File',"`"$tmp`"")
$hwnd = [IntPtr]::Zero
for ($i = 0; $i -lt 60 -and $hwnd -eq [IntPtr]::Zero; $i++) {
  Start-Sleep -Milliseconds 250
  $new = [WI]::TerminalWindows() | Where-Object { $before -notcontains $_ }
  if ($new) { $hwnd = $new[0] }
}
if ($hwnd -eq [IntPtr]::Zero) { throw "Fant ikke det nye terminalvinduet" }
[void][WI]::SetWindowPos($hwnd, [IntPtr]::Zero, 360, 40, 0, 0, 0x0001 -bor 0x0004)
[void][WI]::SetForegroundWindow($hwnd)
$ws = New-Object -ComObject WScript.Shell

function Snap([string]$file) {
  [void][WI]::SetForegroundWindow($hwnd)
  [void][WI]::SetWindowPos($hwnd, [IntPtr](-1), 0, 0, 0, 0, 0x0001 -bor 0x0002 -bor 0x0040)
  Start-Sleep -Milliseconds 600
  $r = New-Object WI+RECT
  [void][WI]::DwmGetWindowAttribute($hwnd, 9, [ref]$r, [Runtime.InteropServices.Marshal]::SizeOf($r))
  $bmp = New-Object Drawing.Bitmap(($r.R - $r.L), ($r.B - $r.T))
  $g = [Drawing.Graphics]::FromImage($bmp); $g.CopyFromScreen($r.L, $r.T, 0, 0, $bmp.Size)
  $full = Join-Path $out $file; $bmp.Save($full, [Drawing.Imaging.ImageFormat]::Png)
  $g.Dispose(); $bmp.Dispose()
  [void][WI]::SetWindowPos($hwnd, [IntPtr](-2), 0, 0, 0, 0, 0x0001 -bor 0x0002)
  "saved $full"
}
function SendLine([string]$text) {
  [void][WI]::SetForegroundWindow($hwnd); Start-Sleep -Milliseconds 300
  # SendKeys treats + ^ % ~ ( ) { } [ ] as special; wrap each in braces.
  $safe = [regex]::Replace($text, '[+^%~(){}\[\]]', { param($m) '{' + $m.Value + '}' })
  $ws.SendKeys($safe); Start-Sleep -Milliseconds 400
  $ws.SendKeys('{ENTER}')
}

Start-Sleep -Seconds 12                       # copilot start-up
SendLine '/code-apps-preview:create-app'
Start-Sleep -Seconds 25                       # prerequisite checks, then "what do you want to build"
SendLine "Create an app that shows my colleagues from Office 365 Users in a searchable list. Selecting a person shows their name, title, department, e-mail and phone. Deploy to environment: $EnvironmentId"
Start-Sleep -Seconds $PlanWait
Snap '04-plan.png'
SendLine 'Yes, go ahead with the plan.'
Start-Sleep -Seconds $BuildWait
Snap '05-build.png'
Remove-Item $tmp -ErrorAction SilentlyContinue
"window left open (hwnd $hwnd); close it yourself or run: close-lab-window"
$shell.UndoMinimizeALL()
