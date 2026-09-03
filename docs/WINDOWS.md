# Building Verso Updated on Windows

This guide is part of the **Verso Updated** community fork effort.
The goal is to eventually make pre-built Windows binaries available so most users do not need to compile.

Until then, here is the current way to build from source.

## Current Reality (September 2026)

- This fork is still based on a very old Servo revision (`5e2d42e`).
- Modern Servo (0.5+) has advanced significantly. A full upgrade is a major multi-week task.
- Building currently requires a full development environment. Pre-built `.exe` is **not yet available**.
- Packaging notes: see [PACKAGING.md](PACKAGING.md) (Windows path still incomplete; existing `package_libs.py` is macOS-oriented).

## Prerequisites

### Option A — Scoop (recommended for simplicity)

1. Install [Scoop](https://scoop.sh/) if you don’t have it.
2. Open PowerShell and run:

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
- **Visual Studio Build Tools** with the “Desktop development with C++” workload (required by many native dependencies).

## Build & Run

```powershell
git clone https://github.com/xizar280513/verso.git
cd verso
cargo run
```

For a release build:

```powershell
cargo build --release
```

The binary will appear under `target/release/`.

### Optional packager feature

```powershell
cargo build --release --features packager
```

This enables packager-related code paths, but **does not yet produce a polished Windows installer by itself**. See [PACKAGING.md](PACKAGING.md).

## Known Limitations

- Build times are long.
- The browser is still experimental.
- Many modern websites will not render correctly because the Servo revision is outdated.
- Windows packaging / Releases distribution is planned (Day 3+ focus) but not ready yet.

## Goal of this Fork

Reduce the friction above. The long-term target is:

1. Users can download a Windows binary from the Releases page.
2. No need to install Scoop, LLVM, CMake, or compile anything for basic testing.

Progress is tracked in `ROADMAP.md`.
