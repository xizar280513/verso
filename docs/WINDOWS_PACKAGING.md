# Windows Packaging Checklist — Verso Updated

Practical path toward a downloadable Windows artifact.

## Goal

Users can eventually download a Windows build from GitHub Releases without compiling.

## Non-negotiable policy

- Do **not** publish a fake `.exe`
- Publish only if the binary at least starts (window opens)
- Current engine is still old Servo (`5e2d42e`) — any early binary remains experimental

## What already exists

From `Cargo.toml`:

- `[package.metadata.packager]` (name, identifier, resources, icons)
- `[package.metadata.packager.nsis]`
- feature flag: `packager`
- `before-each-package-command = "python etc/package_libs.py"` (macOS-oriented)

Scripts:

- `etc/package_windows_portable.ps1` — stages a portable folder after `cargo build --release`

## Binary names

Either of these may appear depending on what was built:

- `target/release/versoview.exe` (root package)
- `target/release/verso.exe` (workspace member)

The portable script accepts **both**.

## Recommended first path: portable ZIP

### 1. Build

```powershell
# Prerequisites: see docs/WINDOWS.md / docs/BUILD_PLATFORMS.md
cargo build --release
```

### 2. Stage

```powershell
powershell -ExecutionPolicy Bypass -File etc/package_windows_portable.ps1
```

Output folder: `dist/windows-portable/`

### 3. Local verification (required before Release)

1. Run the staged `.exe`
2. Confirm a window opens
3. Note any missing-DLL errors and copy extra DLLs next to the exe if needed
4. Record known limitations (old Servo, limited site compat, etc.)

### 4. Create a GitHub Release (manual, honest)

Only after step 3 succeeds:

```powershell
# From dist/windows-portable
Compress-Archive -Path * -DestinationPath ..\VersoUpdated-0.0.4-windows-x64-portable.zip
```

Then on GitHub:

1. Create a new Release / tag (e.g. `v0.0.4-experimental`)
2. Upload the ZIP
3. In the Release notes state clearly:
   - Experimental / community fork
   - Servo revision still `5e2d42e`
   - What was verified (window opens) and what was not

CI already uploads NSIS/Flatpak/DMG **artifacts** on schedule / workflow_dispatch. Those are useful for testing but are not the same as a published GitHub Release with honest notes.

## NSIS / cargo-packager path (later)

Once portable is verified:

```powershell
cargo install cargo-packager
cargo build --release --features packager
cargo packager --release
```

Expect to still need Windows-specific dependency handling (the current `package_libs.py` is macOS-focused).

## Related docs

- [WINDOWS.md](WINDOWS.md)
- [PACKAGING.md](PACKAGING.md)
- [BUILD_PLATFORMS.md](BUILD_PLATFORMS.md)
- [ROADMAP.md](../ROADMAP.md)
- [BUG_ANALYSIS.md](BUG_ANALYSIS.md)
