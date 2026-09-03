# Servo Bump Plan — First Attempt

**Active work branch:** `upgrade/servo-prep`  
**Updated:** Day 3 (2026-09-03)

## Current Pin

All Servo crates in root `Cargo.toml` are locked to:

```toml
rev = "5e2d42e"
```

Modern Servo is far ahead (0.5.x territory as of September 2026).

## Integration Surface (High-Risk Files)

| File | Role | Risk |
|------|------|------|
| `src/verso.rs` | Main browser struct, constellation + embedder setup | **Critical** |
| `src/compositor.rs` | Webrender / compositor integration | **Critical** |
| `src/window.rs` | Window + tab + embedder message handling | **Critical** |
| `src/webview/webview.rs` | WebView logic, navigation, scripts | High |
| `src/rendering.rs` | GL / rendering context | High |
| `src/config.rs` | Prefs / opts from servo_config | Medium |

## Strategy (concrete)

1. Work on `upgrade/servo-prep` first — keep `main` clean
2. Choose an **intermediate** Servo revision (newer than `5e2d42e`, not the absolute tip)
3. Change **all** Servo `rev` lines together in one commit
4. Expect large compile breakage; fix in layers (compile → window opens → navigation)
5. Primary validation target: Windows
6. Only merge to `main` when something actually builds

### Expected error categories

- `embedder_traits` / constellation message changes
- Compositor / Webrender API drift
- Pref / config key changes
- Script / WebView embedding surface changes
- Feature-flag mismatches

## Status

- [x] Map integration surface
- [x] Create upgrade branch
- [x] Document intermediate strategy + expected error categories
- [ ] On a real build machine: first `rev` bump + `cargo check`
- [ ] Record compile error categories

## Related docs

- [UPGRADE_STRATEGY.md](UPGRADE_STRATEGY.md)
- [ARCHITECTURE.md](ARCHITECTURE.md)
- [KNOWN_GAPS.md](KNOWN_GAPS.md)
