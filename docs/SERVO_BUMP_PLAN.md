# Servo Bump Plan

**Active work branch:** `upgrade/servo-prep`  
**Updated:** Day 4 (2026-09-04)

## Pin status

| Stage | Servo rev | Result |
|-------|-----------|--------|
| Historical / `main` | `5e2d42e` era | Baseline |
| Attempt v0.4.0 | `e8dbc1d…` | Fail — no `compositing_traits` |
| Attempt v0.2.0 | `6a0f9e4…` | Fail — same; partial paint mapping only |
| **Current (prep)** | **v0.0.1 `721214f…`** | **Resolution OK**; compile blocked on MozJS bindings |

## Integration surface (high-risk)

| File | Role | Risk |
|------|------|------|
| `src/verso.rs` | Constellation + embedder setup | Critical |
| `src/compositor.rs` | Compositor / WebRender | Critical |
| `src/window.rs` | Window + embedder messages | Critical |
| `src/webview/webview.rs` | Navigation / scripts | High |
| `src/rendering.rs` | GL context | High |
| `src/config.rs` | Prefs | Medium |

On v0.0.1, compositor **symbols still exist** — no paint_api rewrite required yet.

## Strategy (updated)

1. Stay on `upgrade/servo-prep`; keep `main` for docs until build works
2. Intermediate pin = **Servo v0.0.1** (not tip)
3. Next: align **MozJS + script_bindings generator** to v0.0.1 pair
4. Then host `cargo check` → Windows check → only then consider merge
5. Primary product validation: Windows

## Status checklist

- [x] Map integration surface
- [x] Create upgrade branch
- [x] Intermediate strategy documented
- [x] Retarget to Servo v0.0.1
- [x] `compositing_traits` resolves
- [x] Stylo / WebRender / Rust 1.88 aligned for resolution
- [ ] MozJS / generated bindings aligned
- [ ] Host `cargo check` green
- [ ] Windows target check
- [ ] Record remaining compile categories

## Related

- [UPGRADE_STRATEGY.md](UPGRADE_STRATEGY.md)
- [ARCHITECTURE.md](ARCHITECTURE.md)
- [KNOWN_GAPS.md](KNOWN_GAPS.md)
- Full log: `docs/SERVO_BUMP_LOG.md` on `upgrade/servo-prep`
