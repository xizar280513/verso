# Packaging Notes — Verso Updated

This document prepares the **Windows / packaging** track (planned focus starting Day 3).

## Goal

Make it possible for users to download a Windows binary from GitHub Releases **without** installing Scoop, LLVM, CMake, or compiling from source.

## Current State

- Root `Cargo.toml` already contains `[package.metadata.packager]` for `cargo-packager`
- NSIS-related metadata exists
- There is **no** published Release asset yet
- Engine is still on old Servo (`5e2d42e`), so any early binary would still be experimental

## Packaging-related pieces already in tree

- `package.metadata.packager` in `Cargo.toml`
- `before-each-package-command = "python etc/package_libs.py"`
- Resources/icons references
- Desktop entry: `org.versotile.verso.desktop`

## Important finding (`etc/package_libs.py`)

The current `package_libs.py` is **macOS-oriented**:

- uses `otool` / `install_name_tool`
- copies GStreamer dylibs from `/Library/Frameworks/GStreamer.framework/...`
- only runs packaging logic when `sys.platform == "darwin"`

**Windows packaging is not implemented there yet.**  
Day 3+ work must add a Windows-specific path (DLL collection, NSIS/cargo-packager, etc.), not assume the existing script is enough.

## Day 3+ planned work (Windows-first)

1. Document exact Windows packaging command path
2. Design Windows equivalent of dependency collection (DLLs)
3. Use/repair `cargo-packager` + NSIS metadata already in `Cargo.toml`
4. Try producing an artifact on a real Windows environment
5. Only if it runs: attach to GitHub Releases

## Policy

- No fake `.exe` uploads
- No Release that cannot at least launch a window
- Prefer honesty over speed

## Related

- [WINDOWS.md](WINDOWS.md)
- [ROADMAP.md](../ROADMAP.md) Week 4
- [KNOWN_GAPS.md](KNOWN_GAPS.md)
