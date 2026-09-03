# Changelog

All notable changes to **Verso Updated** (community fork) will be documented here.

## [Unreleased] - Day 3 (2026-09-03)

### Added
- `docs/WINDOWS_PACKAGING.md` — practical Windows packaging checklist
- `etc/package_windows_portable.ps1` — portable folder staging skeleton

### Changed
- `etc/package_libs.py` now explains Windows path and points to the PowerShell script
- ROADMAP updated for Day 3 packaging focus

### Notes
- Still no GitHub Release `.exe`
- Staging script prepares `dist/windows-portable/` after a local release build
- Publish gate remains: binary must launch first

## [Unreleased] - Day 2 (2026-09-03)

### Added
- Branch `upgrade/servo-prep`
- `docs/SERVO_BUMP_PLAN.md`, `KNOWN_GAPS.md`, `ARCHITECTURE.md`, `PACKAGING.md`, docs index

### Discoveries
- `etc/package_libs.py` is macOS-oriented

### Notes
- Still on Servo revision `5e2d42e`

## [0.0.4] - 2026-09-02

### Added
- Community fork foundation, ROADMAP, WINDOWS guide, UPGRADE_STRATEGY, CONTRIBUTING

### Changed
- Repository metadata points to this fork
- Version 0.0.4

## Upstream History

Previous history belongs to the original [versotile-org/verso](https://github.com/versotile-org/verso) project (archived).
