# Known Gaps — Verso Updated

Important gaps between the current tree and a modern, usable browser. Updated **Day 4**.

## Engine Gap

| Branch | Servo pin | Notes |
|--------|-----------|--------|
| `main` | Historical (pre-upgrade) | Stable docs branch |
| `upgrade/servo-prep` | **v0.0.1** (`721214f`) | Intermediate retarget **done** |

- `compositing_traits` **resolves** on v0.0.1 (blocker of v0.2.0 / v0.4.0 cleared)
- Host `cargo check` still **fails** on MozJS / generated `script_bindings` API mismatch
- Modern Servo (0.5+ / tip) remains far ahead — not the current target

## Compile Gap (Day 4)

- Generated bindings use `*mut RawJSContext` / older signatures
- Resolved MozJS expects `&mut JSContext`, updated `to_jsval`/`from_jsval`, `&CStr` errors
- **Fix path:** align MozJS + binding generator pins to Servo v0.0.1 — do **not** hand-edit generated files

## Build / Distribution Gap

- Users still need a full Rust + native toolchain
- No official pre-built Windows `.exe` / macOS `.dmg` / Flatpak from this fork yet
- Packaging scripts exist; artifacts only after a real successful build

## Feature / Stability Gap (from upstream Future Work)

- Multi-window support — not done
- Multiprocess mode — not done
- Sandbox on all platforms — not done
- GStreamer feature — not done
- Navigation / chrome UX still experimental

## What This Fork Is Doing

1. Honest documentation — no false claims
2. Controlled Servo upgrade on `upgrade/servo-prep`
3. Windows-first product priority; Linux Flatpak next; macOS via CI later
4. Publish binaries only when they actually run

See also:
- [ROADMAP.md](../ROADMAP.md)
- [UPGRADE_STRATEGY.md](UPGRADE_STRATEGY.md)
- [SERVO_BUMP_PLAN.md](SERVO_BUMP_PLAN.md)
- `docs/SERVO_BUMP_LOG.md` on branch `upgrade/servo-prep`
