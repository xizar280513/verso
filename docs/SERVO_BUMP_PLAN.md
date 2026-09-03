# Servo Bump Plan — First Attempt

**Active work branch:** `upgrade/servo-prep`  
**Date:** Day 2 (2026-09-03)

## Current Pin

All Servo crates in root `Cargo.toml` are locked to:

```toml
rev = "5e2d42e"
```

Modern Servo is far ahead (0.5.x / 0.6.x territory).

## Integration Surface (High-Risk Files)

| File | Role | Risk |
|------|------|------|
| `src/verso.rs` | Main browser struct, constellation + embedder setup | **Critical** |
| `src/compositor.rs` | Webrender / compositor integration | **Critical** |
| `src/window.rs` | Window + tab + embedder message handling | **Critical** |
| `src/webview/webview.rs` | WebView logic, navigation, scripts | High |
| `src/rendering.rs` | GL / rendering context | High |
| `src/config.rs` | Prefs / opts from servo_config | Medium |

## Strategy

1. Work on `upgrade/servo-prep` first
2. Choose an **intermediate** Servo revision (not latest `main`)
3. Change all Servo `rev` lines together
4. Fix compile errors in layers
5. Keep Windows as primary target
6. Only merge to `main` when something actually builds

## Status

- [x] Map integration surface
- [x] Create upgrade branch
- [ ] Choose concrete intermediate target
- [ ] Perform first `rev` bump on upgrade branch
- [ ] Record compile error categories

## Related docs

- [UPGRADE_STRATEGY.md](UPGRADE_STRATEGY.md)
- [ARCHITECTURE.md](ARCHITECTURE.md)
- [KNOWN_GAPS.md](KNOWN_GAPS.md)
