# Servo Bump Plan — First Attempt

**Branch:** `upgrade/servo-prep`  
**Date:** Day 2 (2026-09-03)

## Current Pin

All Servo crates in root `Cargo.toml` are locked to:

```toml
rev = "5e2d42e"
```

This revision is very old compared to current Servo (0.5.x / 0.6.x as of September 2026).

## Integration Surface (High-Risk Files)

Verso is **deeply** embedded into Servo internals. These files will break first on any bump:

| File | Role | Risk |
|------|------|------|
| `src/verso.rs` | Main browser struct, constellation + embedder setup | **Critical** |
| `src/compositor.rs` | Webrender / compositor integration | **Critical** |
| `src/window.rs` | Window + tab + embedder message handling | **Critical** |
| `src/webview/webview.rs` | WebView logic, navigation, scripts | High |
| `src/rendering.rs` | GL / rendering context | High |
| `src/config.rs` | Prefs / opts from servo_config | Medium |

Key Servo crates used directly:
- `embedder_traits`
- `constellation` / `constellation_traits`
- `compositing_traits`
- `layout_thread_2020`
- `script`
- `fonts`, `net`, `profile`, `devtools`, `webgpu`, ...
- `stylo` + `webrender` (separate pins)

## Strategy for First Bump

We will **not** jump to latest `main`.

1. Keep work on this branch (`upgrade/servo-prep`)
2. Choose an **intermediate** Servo revision (newer than `5e2d42e`, older than current tip)
3. Change **all** `rev = "..."` lines together
4. Expect large compile breakage
5. Fix in layers: compile → startup → basic navigation
6. Windows remains the primary target

## Immediate Next Actions

- [x] Map integration surface (this document)
- [ ] Pick a concrete intermediate target commit/tag
- [ ] Prepare Cargo.toml rev bump (all Servo crates at once)
- [ ] Attempt first compile and record error categories
- [ ] Keep `main` clean until something actually builds

## Success Criteria for First Bump

- Tree compiles on at least one platform (preferably Windows)
- Basic window opens
- No immediate crash on startup
- Documented list of remaining broken features

Only after the above is true do we merge toward `main`.

## Notes

A full jump to Servo 0.5+ is a multi-week effort by itself.  
Day 2 work is about preparation and reducing risk, not claiming the upgrade is done.
