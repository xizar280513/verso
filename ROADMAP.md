# Verso Updated — 1-Month Roadmap

**Goal:** Community continuation of archived Verso with modernization, **multi-platform** support (Windows, macOS, Linux/NixOS), and eventual real Release artifacts.

**Time box:** 1 month.

---

## Platforms (follow upstream Verso)

- Windows — build + NSIS/portable
- macOS — build + DMG / dylib packaging
- Linux — build + Flatpak
- NixOS — Linux via `shell.nix`

---

## Honest Scope

Full mature browser in 30 days is not realistic.  
No fake Release binaries.

---

## Week 1 — Foundation (Done)

- [x] Fork + docs foundation

## Week 2 — Upgrade prep (Done / ongoing)

- [x] `upgrade/servo-prep`
- [x] Integration mapping
- [ ] Servo rev bump still pending (requires real compile)

## Day 3 — Packaging + bug analysis (mostly done)

- [x] Windows packaging checklist + portable script
- [x] Deep bug/risk analysis (`docs/BUG_ANALYSIS.md`)
- [x] Multi-platform build doc (`docs/BUILD_PLATFORMS.md`)
- [x] CI: fix Scoop step typo; gate CrabNebula on `CN_API_KEY`
- [x] macOS `package_libs.py` accepts `verso` **or** `versoview`
- [x] Fork metadata (CODEOWNERS / FUNDING) cleaned
- [x] **Stop ignoring `Cargo.lock`**
- [ ] Verify CI builds on all three OS jobs
- [ ] Real artifacts only after launch verification

## Week 3 — Core stability

- [ ] First Servo intermediate bump on `upgrade/servo-prep`
- [ ] Navigation / crashes / logging

## Week 4 — Artifacts

- [ ] Portable/NSIS/Flatpak/DMG as far as builds allow
- [ ] GitHub Release with honest limitations (after launch verified)

---

**Maintainer note:** Day 3 corrected over-focus on Windows-only, fixed several fork/CI packaging bugs, and made `Cargo.lock` tracked. Remaining hard work is compile + real machine verification.
