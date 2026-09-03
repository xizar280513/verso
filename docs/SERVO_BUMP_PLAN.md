# Servo Bump Plan — First Attempt

**Branch:** `upgrade/servo-prep`  
**Updated:** Day 3 (2026-09-03)

## Current Pin

All Servo crates in root `Cargo.toml` are locked to:

```toml
rev = "5e2d42e"
```

This revision is very old. Current Servo is in the 0.5.x range (nightlies as of early September 2026).

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

## Strategy for First Bump (concrete)

We will **not** jump to latest `main`.

### Recommended approach

1. Stay on this branch (`upgrade/servo-prep`).
2. First target: an **intermediate** revision that is newer than `5e2d42e` but not the absolute tip.
   - Prefer a known release-ish point or a commit that still has relatively stable embedder APIs.
   - Practical first experiment: pick a commit from the Servo history that is several months newer, run `cargo check`, and record breakage.
3. Change **all** Servo `rev = "..."` lines in root `Cargo.toml` to the **same** new revision in one commit.
4. Also review `stylo` / `webrender` pins — they may need coordinated updates.
5. Expect large compile breakage. Fix in layers:
   - Layer 1: make the tree compile
   - Layer 2: binary starts / window opens
   - Layer 3: basic navigation works
6. Primary validation target remains Windows (also keep Linux CI green if possible).

### Expected error categories (from experience with deep Servo embeds)

- Missing or renamed items in `embedder_traits` / constellation messages
- Compositor / Webrender API drift (`compositing_traits`, display lists, pipeline IDs)
- Pref / config key changes in `servo_config`
- Script / WebView embedding surface changes
- Feature-flag or Cargo feature mismatches after the bump

Record every category in this file or in a follow-up `docs/SERVO_BUMP_LOG.md` once the first compile is attempted.

## Immediate Next Actions

- [x] Map integration surface
- [x] Document concrete intermediate strategy + expected error categories
- [ ] On a real build machine: pick intermediate rev, bump all Servo `rev` lines, `cargo check` / `cargo build`
- [ ] Capture first wave of compile errors by file/crate
- [ ] Keep `main` clean until something actually builds

## Success Criteria for First Bump

- Tree compiles on at least one platform (preferably Windows)
- Basic window opens
- No immediate crash on startup
- Documented list of remaining broken features

Only after the above is true do we merge toward `main`.

## Notes

A full jump to current Servo tip is a multi-week effort.  
This branch exists to contain risk. Do not claim the upgrade is done until the success criteria above are met on a real machine.
