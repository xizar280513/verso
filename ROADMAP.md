# Verso Updated — 1-Month Roadmap

**Goal:** Community continuation of archived Verso with modernization, **Windows-first** product focus, multi-platform builds where feasible, and eventual honest Release artifacts.

**Time box:** 1 month (Day 4 of ~30).

---

## Platforms (priority order)

1. **Windows** — build + portable/NSIS (product priority)
2. **Linux** — build + Flatpak
3. **macOS** — build + DMG via CI/Mac hardware
4. ChromeOS / BSD — **out of scope** for month 1

---

## Honest Scope

Full mature browser in 30 days is not realistic.  
No fake Release binaries. No claim of Chrome parity.

---

## Week 1 — Foundation (Done)

- [x] Fork + docs foundation

## Week 2 — Upgrade prep

- [x] Branch `upgrade/servo-prep`
- [x] Integration mapping / bump plan
- [x] Attempt Servo v0.4.0 → failed (`compositing_traits` missing)
- [x] Attempt Servo v0.2.0 → failed (same; Option A mapping incomplete)
- [x] **Retarget Servo v0.0.1 (`721214f`)** — dependency resolution **passes**; `compositing_traits` present
- [ ] Host `cargo check` green (blocked on MozJS / `script_bindings` API mismatch)
- [ ] Windows GNU / MSVC check after host is green

## Day 3 — Packaging + analysis (Done)

- [x] Windows packaging checklist + portable script
- [x] Bug/risk analysis, multi-platform build docs
- [x] CI / fork metadata cleanups; track `Cargo.lock`

## Day 4 — Servo intermediate (in progress)

- [x] Retarget all Servo pins to **v0.0.1**
- [x] Align Stylo (`2025-10-01`), WebRender (`0.68`), Rust **1.88.0**
- [x] Confirm compositor symbols still available (no paint rewrite)
- [ ] Fix MozJS / generated `script_bindings` incompatibility
- [ ] Re-run host `cargo check` to green
- [ ] Then Windows target check

## Week 3 — Core stability

- [ ] Green `cargo check` / `cargo build` on at least one platform
- [ ] GitHub Actions: ubuntu + windows check jobs
- [ ] Navigation / crash triage only after build works

## Week 4 — Artifacts

- [ ] Windows portable or setup artifact (experimental)
- [ ] Flatpak if Linux build allows
- [ ] macOS only via `macos-latest` if capacity remains
- [ ] GitHub Release only with honest limitations

---

## Current blocker (Day 4)

Generated `script_bindings` pass `*mut RawJSContext` / old signatures; resolved MozJS expects `&mut JSContext`, safe traits, and `&CStr` error APIs. **Do not hand-edit thousands of generated binding lines.** Align MozJS + binding generator to the pair used by Servo v0.0.1 (or its documented pins), then re-check.

Details: `docs/SERVO_BUMP_LOG.md` on branch `upgrade/servo-prep`.

---

**Maintainer note:** Day 4 is real progress — past the compositor package wall. Next work is dependency/version alignment for MozJS, not feature coding.
