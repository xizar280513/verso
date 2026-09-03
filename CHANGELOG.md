# Changelog

All notable changes to **Verso Updated** (community fork) will be documented here.

## [Unreleased] - Day 2 (2026-09-03)

### Added
- Branch `upgrade/servo-prep` for controlled Servo upgrade work
- `docs/SERVO_BUMP_PLAN.md` — first bump plan + high-risk files
- `docs/KNOWN_GAPS.md` — engine, build, and feature gaps
- `docs/ARCHITECTURE.md` — component map
- `docs/README.md` — documentation index
- `docs/PACKAGING.md` — packaging / Releases path notes

### Changed
- ROADMAP updated (Day 3 focus = Windows/packaging)
- `src/lib.rs` crate docs point to this fork
- Desktop entry branded as Verso Updated
- WINDOWS.md links to packaging notes

### Discoveries
- `etc/package_libs.py` is **macOS-oriented** (`otool`, GStreamer dylibs); Windows packaging path is still incomplete

### Notes
- Still on Servo revision `5e2d42e`
- No binary release yet
- No fake `.exe` will be published

## [0.0.4] - 2026-09-02

### Added
- Established as community continuation of the archived Verso project
- `ROADMAP.md` with 1-month plan (Windows-first)
- `docs/WINDOWS.md` — clearer Windows build instructions
- `docs/UPGRADE_STRATEGY.md` — controlled Servo upgrade plan
- `CONTRIBUTING.md`

### Changed
- Repository metadata now points to this fork
- Version bumped to 0.0.4
- README rewritten to clearly state status and goals

## Upstream History

Previous history belongs to the original [versotile-org/verso](https://github.com/versotile-org/verso) project (archived).
