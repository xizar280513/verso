# Verso Updated - Windows portable staging skeleton (Day 3)
# This does NOT claim a full release-ready package yet.
# It prepares a folder layout for manual testing after `cargo build --release`.

$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot
if (-not $Root) { $Root = Get-Location }

$ReleaseDir = Join-Path $Root "target\release"
$StageDir = Join-Path $Root "dist\windows-portable"
$BinaryCandidates = @(
    (Join-Path $ReleaseDir "versoview.exe"),
    (Join-Path $ReleaseDir "verso.exe")
)

Write-Host "Verso Updated - Windows portable staging"
Write-Host "Root: $Root"

$Binary = $null
foreach ($candidate in $BinaryCandidates) {
    if (Test-Path $candidate) {
        $Binary = $candidate
        break
    }
}

if (-not $Binary) {
    Write-Host "ERROR: release binary not found."
    Write-Host "Build first:"
    Write-Host "  cargo build --release"
    Write-Host "Looked for:"
    $BinaryCandidates | ForEach-Object { Write-Host "  $_" }
    exit 1
}

Write-Host "Found binary: $Binary"

if (Test-Path $StageDir) {
    Remove-Item -Recurse -Force $StageDir
}
New-Item -ItemType Directory -Path $StageDir | Out-Null

Copy-Item $Binary (Join-Path $StageDir (Split-Path $Binary -Leaf))

foreach ($dirName in @("resources", "icons")) {
    $src = Join-Path $Root $dirName
    if (Test-Path $src) {
        Copy-Item -Recurse $src (Join-Path $StageDir $dirName)
        Write-Host "Copied $dirName/"
    } else {
        Write-Host "WARN: missing $dirName/"
    }
}

# Best-effort copy of known EGL/GLES DLLs if present in build output
$BuildDir = Join-Path $ReleaseDir "build"
if (Test-Path $BuildDir) {
    Get-ChildItem -Path $BuildDir -Recurse -Include libEGL.dll,libGLESv2.dll -ErrorAction SilentlyContinue |
        ForEach-Object {
            Copy-Item $_.FullName $StageDir -Force
            Write-Host "Copied $($_.Name)"
        }
}

$Readme = @"
Verso Updated - Windows portable (experimental)

This folder was staged by etc/package_windows_portable.ps1.

Limitations:
- Engine is still based on old Servo revision 5e2d42e
- Not an official polished installer
- If the app fails to start, missing DLLs may still be required

Build source: https://github.com/xizar280513/verso
"@
Set-Content -Path (Join-Path $StageDir "README-WINDOWS.txt") -Value $Readme -Encoding UTF8

Write-Host ""
Write-Host "Staging complete: $StageDir"
Write-Host "Next: run the exe locally. Only if it launches, consider zipping for Release."
