# Build Platforms — Verso Updated

Upstream Verso was multi-platform. This fork follows the same surface:

| Platform | Primary path | Notes |
|----------|--------------|-------|
| **Windows** | `cargo build --release` + optional NSIS (`cargo packager`) | Portable helper: `etc/package_windows_portable.ps1` |
| **macOS** | `cargo build --release` + GStreamer + `cargo packager` (DMG) | `etc/package_libs.py` bundles dylibs |
| **Linux** | `cargo build --release` / Flatpak | Manifest: `org.versotile.verso.yml` |
| **NixOS / Nix** | `nix-shell` via `shell.nix` | NixOS is Linux; use the Nix env for deps |

## Binary names

The workspace can produce:

- `versoview` — root package
- `verso` — `verso/` package (desktop `Exec=verso`, Flatpak `command: verso`)

Flatpak installs **both**. Local scripts should accept either.

## Windows

See [WINDOWS.md](WINDOWS.md) and [WINDOWS_PACKAGING.md](WINDOWS_PACKAGING.md).

## macOS

1. Install Rust, CMake, Python + mako
2. Install GStreamer runtime + devel packages (see CI in `.github/workflows/build.yml`)
3. `cargo build --release`
4. Optional: `cargo packager --release` or `python etc/package_libs.py`

## Linux (Debian/Ubuntu-style)

Dependencies are listed in CI (`build-linux` / PR check). Roughly: build-essential, clang, cmake, gstreamer plugins, libssl, libegl, xorg/wayland related dev packages, python3-mako.

```bash
cargo build --release
# optional both bins like Flatpak:
cargo build --release --package verso
```

### Flatpak

```bash
# requires Cargo.lock + generated cargo-sources.json (see CI)
flatpak-builder build-dir org.versotile.verso.yml
```

### NixOS / Nix

```bash
nix-shell
# then cargo build / cargo run inside the shell
```

`shell.nix` pulls compilers, gstreamer, wayland/X11 libs, and nixGL helpers.

## CI matrix (upstream-style)

`.github/workflows/build.yml` builds:

- Linux (check / Flatpak on schedule)
- Windows (release + NSIS on schedule)
- macOS aarch64 + x64 (release + DMG on schedule)

CrabNebula nightly publish runs only if `CN_API_KEY` is set (community fork safe).

## Related

- [BUG_ANALYSIS.md](BUG_ANALYSIS.md)
- [PACKAGING.md](PACKAGING.md)
- [ROADMAP.md](../ROADMAP.md)
