# Verso Updated

> **Community Continuation / Major Upgrade Fork**
>
> This is an independent community fork of the original [Verso](https://github.com/versotile-org/verso) project (archived October 2025).
> Original project by versotile-org / Wu Yu Wei and contributors.
> We deeply respect the original work and the contributions it made to Servo.
>
> **Goal:** Large-scale modernization of Verso, with strong initial focus on **Windows**, clearer documentation, and eventually easy-to-download binaries.

---

## Current Status (September 2026 — Day 4)

| Item | Status |
|------|--------|
| Fork + community identity | Done |
| Core docs / ROADMAP | Done |
| Servo upgrade branch | Active (`upgrade/servo-prep`) |
| Servo pin (upgrade branch) | **v0.0.1** (`721214f`) — `compositing_traits` resolves |
| Host `cargo check` | Past dependency resolution; **blocked** on MozJS / `script_bindings` API mismatch |
| Windows GNU check (v0.0.1) | Not run yet (host blocker first) |
| Windows packaging checklist | Done (`docs/WINDOWS_PACKAGING.md`) |
| Windows portable staging script | Done (`etc/package_windows_portable.ps1`) |
| GitHub Release `.exe` / `.dmg` / Flatpak | **Not yet** |

**Day 4 focus:** Servo intermediate retarget landed; next is aligning MozJS / generated bindings so `cargo check` can go green.

### Key Documents
- [ROADMAP.md](ROADMAP.md)
- [docs/SERVO_BUMP_LOG.md](docs/SERVO_BUMP_LOG.md) (on `upgrade/servo-prep`)
- [docs/WINDOWS.md](docs/WINDOWS.md)
- [docs/WINDOWS_PACKAGING.md](docs/WINDOWS_PACKAGING.md)
- [docs/PACKAGING.md](docs/PACKAGING.md)
- [docs/UPGRADE_STRATEGY.md](docs/UPGRADE_STRATEGY.md)
- [CHANGELOG.md](CHANGELOG.md)

---

## Building on Windows

See **[docs/WINDOWS.md](docs/WINDOWS.md)**.

```powershell
scoop install git python llvm cmake curl
pip install mako
# + Rust (rustup) + Visual Studio C++ Build Tools

git clone https://github.com/xizar280513/verso.git
cd verso
cargo build --release

# optional portable staging folder
powershell -ExecutionPolicy Bypass -File etc/package_windows_portable.ps1
```

Staged output (if build exists): `dist/windows-portable/`

A proper pre-built `.exe` in GitHub Releases is a stated goal, but it does **not** exist yet.

---

## Platform packaging (planned — not ready)

| Target | Path (later) | Notes |
|--------|----------------|-------|
| Windows `.exe` / portable | Native MSVC or CI `windows-latest` + packaging script | Product priority |
| Linux Flatpak | Existing `org.versotile.verso.yml` + CI | After host build works |
| macOS `.dmg` | CI `macos-latest` or Mac hardware | Needs Apple toolchain |
| ChromeOS / BSD | Not in near-term scope | Too much for month 1 |

---

## License

Apache-2.0 OR MIT (same as upstream)

---

## Respect for Upstream

All original copyright notices and authors are preserved.

**Repository:** https://github.com/xizar280513/verso  
**Upstream (archived):** https://github.com/versotile-org/verso
