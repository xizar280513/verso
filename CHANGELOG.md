# Changelog

All notable changes to **Verso Updated** (community fork) will be documented here.

## [Unreleased] - Day 4 (2026-09-04)

### Changed (`upgrade/servo-prep`)
- Retarget **all Servo git deps** to **v0.0.1** (`721214fbe44bf11b968e5e076e5b0af5b5663447`)
- `compositing_traits` resolves again; compositor symbols verified present
- Stylo → branch `2025-10-01`; WebRender → branch `0.68`
- Regenerate `Cargo.lock` for v0.0.1 graph
- Toolchain raised to **Rust 1.88.0** (required by resolved graph)
- Package alias fixes (e.g. `allocator` → `servo_allocator`)

### Known issues
- Host `cargo check` still **fails** on generated `script_bindings` vs MozJS API (`*mut RawJSContext` vs `&mut JSContext`, error/`to_jsval` signatures)
- Windows GNU check for v0.0.1 not run yet
- No Release binaries

### Docs (`main`)
- README + ROADMAP updated for Day 4 status

## [Unreleased] - Day 3 (2026-09-03)

### Added
- `docs/BUG_ANALYSIS.md` — deep bug/risk analysis
- `docs/BUILD_PLATFORMS.md` — Windows, macOS, Linux, NixOS
- `docs/WINDOWS_PACKAGING.md` + `etc/package_windows_portable.ps1`

### Fixed
- CI step typo `scroop` → Scoop
- CrabNebula `release-nightly` gated on `secrets.CN_API_KEY`
- macOS `package_libs.py` finds `verso` or `versoview` binary
- Misleading fork metadata: CODEOWNERS / FUNDING
- **Stop ignoring `Cargo.lock`**

### Changed
- Roadmap/docs multi-platform honesty
- README / WINDOWS packaging workflow updates

### Notes
- Servo on `main` still historical until upgrade branch merges
- Upgrade work on `upgrade/servo-prep`

## [Unreleased] - Day 2 (2026-09-03)

### Added
- Upgrade branch + architecture/gaps/packaging docs

## [0.0.4] - 2026-09-02

### Added
- Community fork foundation

## Upstream History

Previous history belongs to [versotile-org/verso](https://github.com/versotile-org/verso) (archived).
