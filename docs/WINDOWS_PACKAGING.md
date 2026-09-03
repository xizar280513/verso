# Windows Packaging Checklist — Verso Updated (Day 3)

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
- `before-each-package-command = "python etc/package_libs.py"`

## Blocker discovered on Day 2

`etc/package_libs.py` is **macOS-only**:

- `otool` / `install_name_tool`
- GStreamer `.dylib` packaging
- logic gated on `sys.platform == "darwin"`

Windows needs a different dependency/DLL strategy.

## Day 3 working checklist

### A. Build path (required first)

- [ ] Document minimum VS Build Tools components
- [ ] Confirm `cargo build --release` output path on Windows (`target/release/versoview.exe` or equivalent package name)
- [ ] Confirm whether binary name is `verso` / `versoview` in practice

### B. Runtime dependency list (Windows)

Collect and document likely needed files next to the exe:

- [ ] `libEGL.dll` / `libGLESv2.dll` (already referenced in packager resources globs)
- [ ] MSVC runtime status (static vs shared)
- [ ] Any Servo/ANGLE related DLLs produced under `target/release/build/**`
- [ ] `resources/` and `icons/` payload

### C. Packager path

- [ ] Decide: portable folder ZIP first vs NSIS installer first
- [ ] Portable ZIP is preferred for first experiment (simpler)
- [ ] NSIS later using existing metadata if stable

### D. Script gap

- [ ] Add Windows branch plan for dependency staging (new script or extend `package_libs.py`)
- [ ] Do not call macOS tools on Windows

### E. Release gate

Before any GitHub Release asset:

1. Binary launches
2. Window appears
3. Known limitations listed in Release notes
4. Version/tag matches repo state

## Suggested first artifact format

**Portable ZIP** (first target):

```
VersoUpdated-0.0.4-windows-x64-portable.zip
  /verso.exe (or actual binary name)
  /resources/...
  /icons/...
  /*.dll (required)
  /README-WINDOWS.txt
```

## Commands (starting point)

```powershell
# after prerequisites from docs/WINDOWS.md
cargo build --release
# optional:
cargo build --release --features packager
```

Packaging commands will be filled in once the binary name and DLL set are verified on a real Windows machine.

## Related docs

- [WINDOWS.md](WINDOWS.md)
- [PACKAGING.md](PACKAGING.md)
- [ROADMAP.md](../ROADMAP.md)
