# Known Gaps — Verso Updated

This document records important gaps between the current tree and a modern, usable browser experience.

## Engine Gap

- **Pinned Servo revision:** `5e2d42e` (very old)
- **Modern Servo:** 0.5.x / 0.6.x era (September 2026)
- Impact:
  - Many modern websites will not render correctly
  - Missing web platform features
  - Security and performance fixes from newer Servo are absent

## Build / Distribution Gap

- Users still need a full Rust + C++ toolchain to try the browser
- No official pre-built Windows `.exe` in Releases yet
- Packaging path exists (`cargo-packager` metadata) but is not production-ready for this fork

## Feature / Stability Gap

From the current architecture:

- Deep dependency on old internal Servo crates (`constellation`, `embedder_traits`, `layout_thread_2020`, etc.)
- Multi-window and multiprocess support were already listed as future work upstream
- Navigation / chrome UX is still experimental

## What This Fork Is Doing About It

1. **Documentation first** — clear status, no false claims
2. **Controlled Servo upgrade** on branch `upgrade/servo-prep`
3. **Windows-first** focus for build and later packaging
4. Only publish binaries when they actually run

See also:
- [ROADMAP.md](../ROADMAP.md)
- [docs/UPGRADE_STRATEGY.md](UPGRADE_STRATEGY.md)
- [docs/SERVO_BUMP_PLAN.md](SERVO_BUMP_PLAN.md) (on `upgrade/servo-prep` branch)
