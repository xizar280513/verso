# Building Verso Updated on Windows

This guide is part of the **Verso Updated** community fork effort.
The goal is to eventually make pre-built Windows binaries available so most users do not need to compile.

Until then, here is the current way to build from source.

## Current Reality (September 2026 — Day 3)

- This fork is still based on a very old Servo revision (`5e2d42e`).
- Pre-built GitHub Release `.exe` is **not yet available**.
- Day 3 focus: Windows packaging path.
- Practical packaging checklist: [WINDOWS_PACKAGING.md](WINDOWS_PACKAGING.md)
- Overview: [PACKAGING.md](PACKAGING.md)

## Prerequisites

### Option A — Scoop (recommended for simplicity)

```powershell
scoop install git python llvm cmake curl
pip install mako
```

### Option B — Chocolatey

```powershell
choco install git python llvm cmake curl
pip install mako
```

### Additional requirements

- **Rust** (via rustup): https://rustup.rs/
- **Visual Studio Build Tools** with the “Desktop development with C++” workload

## Build & Run

```powershell
git clone https://github.com/xizar280513/verso.git
cd verso
cargo run
```

Release build:

```powershell
cargo build --release
```

Binary should appear under `target/release/` as `versoview.exe` or `verso.exe` (verify locally).

## Portable staging (Day 3 helper)

After a successful release build:

```powershell
powershell -ExecutionPolicy Bypass -File etc/package_windows_portable.ps1
```

This creates `dist/windows-portable/` with:

- the release exe (if found)
- `resources/` and `icons/` (if present)
- best-effort `libEGL.dll` / `libGLESv2.dll`
- `README-WINDOWS.txt`

**Next gate:** run the staged exe. Only if a window opens should we consider zipping for GitHub Releases.

## Optional packager feature

```powershell
cargo build --release --features packager
```

Note: `etc/package_libs.py` is macOS-oriented. On Windows it only prints guidance and points to the PowerShell script.

## Known Limitations

- Long build times
- Experimental browser quality
- Old Servo revision ⇒ weak modern site compatibility
- No polished installer yet

Progress: [ROADMAP.md](../ROADMAP.md)
