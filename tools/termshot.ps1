<#
.SYNOPSIS  Run a command in a NEW Windows Terminal window (default "Windows PowerShell" profile,
           so Dennis's own prompt/theme loads) and screenshot only that window. Closes only that window.
.EXAMPLE   pwsh -NoProfile -File tools/termshot.ps1 -Command "ms --version" -Out images/1829/term-1.png -Wait 6
#>
param(
  [Parameter(Mandatory)] [string] $Command,
  [Parameter(Mandatory)] [string] $Out,
  [string] $Display,            # text to echo as the typed command, when it should differ from -Command
  [int] $Wait = 6,
  [int] $Cols = 110,
  [int] $Rows = 18,
  [string] $Profile = "Windows PowerShell",
  [string] $WorkDir = (Get-Location).Path
)
Add-Type -AssemblyName System.Drawing
Add-Type @"
using System; using System.Collections.Generic; using System.Runtime.InteropServices; using System.Text;
public static class W {
  [StructLayout(LayoutKind.Sequential)] public struct RECT { public int L, T, R, B; }
  public delegate bool EnumProc(IntPtr h, IntPtr l);
  [DllImport("user32.dll")] public static extern bool EnumWindows(EnumProc cb, IntPtr l);
  [DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr h, out uint pid);
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
# Minimize everything so the desktop wallpaper shows through the (acrylic) terminal; restored at the end
$shell = New-Object -ComObject Shell.Application
$shell.MinimizeAll(); Start-Sleep -Milliseconds 800
# Give the new shell the module path Windows PowerShell 5.1 expects. Inheriting pwsh 7's PSModulePath makes
# 5.1 pick up PowerShell 7's Microsoft.PowerShell.Utility first, which lacks Import-PowerShellDataFile and
# breaks Terminal-Icons in Dennis's profile (seen 2026-10-23).
$env:PSModulePath = (@([Environment]::GetEnvironmentVariable('PSModulePath','User'),
                       [Environment]::GetEnvironmentVariable('PSModulePath','Machine')) | Where-Object { $_ }) -join ';'
$before = [W]::TerminalWindows()
# The command goes in a temp script: wt splits its own command line on ';' and quoting is fragile.
# Clear-Host hides profile start-up noise; the prompt is echoed so the picture shows what was typed.
$tmp = Join-Path $env:TEMP ("termshot-" + [guid]::NewGuid().ToString('N') + ".ps1")
$shown = if ($Display) { $Display } else { $Command }
$echoLine = "Write-Host '" + $shown.Replace("'", "''") + "'"
$doneLine = 'New-Item -ItemType File -Path "' + $tmp + '.done" -Force | Out-Null'
$lines = @(
  'Clear-Host',
  'Write-Host -NoNewline ((prompt) -replace "(\e\[[0-9;?]*[A-Za-z]|\s)+$", "")',   # real oh-my-posh prompt, then the command as if typed
  $echoLine,
  $Command,
  $doneLine
)
$lines | Set-Content -Path $tmp -Encoding UTF8
Start-Process wt.exe -ArgumentList @('-w','new','--size',"$Cols,$Rows",'-p',"`"$Profile`"",'-d',"`"$WorkDir`"",'powershell.exe','-NoExit','-ExecutionPolicy','Bypass','-File',"`"$tmp`"")
$hwnd = [IntPtr]::Zero
for ($i = 0; $i -lt 60 -and $hwnd -eq [IntPtr]::Zero; $i++) {
  Start-Sleep -Milliseconds 250
  $new = [W]::TerminalWindows() | Where-Object { $before -notcontains $_ }
  if ($new) { $hwnd = $new[0] }
}
if ($hwnd -eq [IntPtr]::Zero) { throw "Fant ikke det nye terminalvinduet" }
[void][W]::SetWindowPos($hwnd, [IntPtr]::Zero, 360, 60, 0, 0, 0x0001 -bor 0x0004)   # SWP_NOSIZE|SWP_NOZORDER: move only, keep --size
[void][W]::SetForegroundWindow($hwnd)
$deadline = (Get-Date).AddSeconds($Wait)
while (-not (Test-Path "$tmp.done") -and (Get-Date) -lt $deadline) { Start-Sleep -Milliseconds 500 }
Start-Sleep -Milliseconds 1200
[void][W]::SetForegroundWindow($hwnd)
Start-Sleep -Milliseconds 400
$r = New-Object W+RECT
[void][W]::DwmGetWindowAttribute($hwnd, 9, [ref]$r, [Runtime.InteropServices.Marshal]::SizeOf($r))
$bmp = New-Object Drawing.Bitmap(($r.R - $r.L), ($r.B - $r.T))
$g = [Drawing.Graphics]::FromImage($bmp)
$g.CopyFromScreen($r.L, $r.T, 0, 0, $bmp.Size)
$dir = Split-Path -Parent $Out; if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
$full = Join-Path (Resolve-Path -LiteralPath ($dir ? $dir : ".")).Path (Split-Path -Leaf $Out)
$bmp.Save($full, [Drawing.Imaging.ImageFormat]::Png)
$w = $bmp.Width; $h = $bmp.Height; $g.Dispose(); $bmp.Dispose()
[void][W]::PostMessage($hwnd, 0x0010, [IntPtr]::Zero, [IntPtr]::Zero)   # WM_CLOSE to this window only
Start-Sleep -Milliseconds 500
$shell.UndoMinimizeALL()
Remove-Item $tmp, "$tmp.done" -ErrorAction SilentlyContinue
"saved $full ${w}x${h}"
