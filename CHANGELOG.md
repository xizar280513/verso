# Changelog

All notable changes to **Verso Updated** (community fork) will be documented here.

## [Unreleased] - Day 3+ (2026-09-03)

### Added
- `docs/BUG_ANALYSIS.md` — deep bug/risk analysis
- `docs/BUILD_PLATFORMS.md` — Windows, macOS, Linux, NixOS
- `docs/WINDOWS_PACKAGING.md` + `etc/package_windows_portable.ps1`

### Fixed
- CI step typo `scroop` → Scoop
- CrabNebula `release-nightly` gated on `secrets.CN_API_KEY` (safe for community fork)
- macOS `package_libs.py` finds `verso` or `versoview` binary
- Misleading fork metadata: CODEOWNERS / FUNDING
- **Stop ignoring `Cargo.lock`** (application workspace needs a tracked lockfile for Flatpak/CI reproducibility)

### Changed
- Roadmap/docs re-aligned to **multi-platform** (not Windows-only)
- README / WINDOWS docs packaging workflow updates

### Notes
- Servo still `5e2d42e`
- No GitHub Release binary until launch is verified on a real machine
- Upgrade work continues on branch `upgrade/servo-prep`

## [Unreleased] - Day 2 (2026-09-03)

### Added
- Upgrade branch + architecture/gaps/packaging docs

## [0.0.4] - 2026-09-02

### Added
- Community fork foundation

## Upstream History

Previous history belongs to [versotile-org/verso](https://github.com/versotile-org/verso) (archived).
