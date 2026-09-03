# Bug & Risk Analysis — Verso Updated (Day 3+)

Deep review of repository issues affecting correctness, packaging, and multi-platform support.

Platforms intended by upstream Verso:
- **Windows** (NSIS via cargo-packager)
- **macOS** (DMG via cargo-packager + GStreamer dylib packaging)
- **Linux** (Flatpak; generic desktop)
- **NixOS / Nix** via `shell.nix` (this is Linux)

---

## Critical / High

### 1. Extremely old Servo pin
- **Where:** root `Cargo.toml` — all Servo crates at `rev = "5e2d42e"`
- **Impact:** weak site compatibility, missing fixes, hard upgrade path
- **Status:** known; handled on branch `upgrade/servo-prep`, not silently “fixed”

### 2. Nightly release pipeline depends on CrabNebula secrets
- **Where:** `.github/workflows/build.yml` job `release-nightly`
- **Impact:** `CN_API_KEY` / app slug `verso/verso-nightly` belong to upstream infrastructure
- **Bug for this fork:** scheduled/manual release publish will fail or target wrong product without secrets
- **Fix applied:** job is gated on `secrets.CN_API_KEY != ''`. Platform artifacts still upload via `actions/upload-artifact`.

### 3. Binary name duality (`verso` vs `versoview`)
- **Where:**
  - package name `versoview` (root)
  - workspace member `verso` (also produces a binary)
  - Flatpak installs **both** `verso` and `versoview`
  - Desktop `Exec=verso`
  - Packaging scripts now accept either name
- **Impact:** packaging scripts can stage/package the wrong binary if only one was built
- **Status:** documented + scripts tolerate both

### 4. `Cargo.lock` tracking — **FIXED**
- Previously listed in `.gitignore` while also present in the tree (inconsistent).
- **Fixed:** `.gitignore` no longer ignores `Cargo.lock`.
- Application workspaces should track the lockfile for reproducible Flatpak/CI builds.

---

## Medium

### 5. Windows packaging script gap
- `etc/package_libs.py` is macOS-only (otool/GStreamer)
- Day 3 added `etc/package_windows_portable.ps1` as interim portable staging
- Full NSIS path still relies on `cargo packager` + CI

### 6. CI typo: “Install scroop”
- Fixed on Day 3 (Scoop)

### 7. Tests disabled in CI
- `cargo test` steps commented out on Linux/Windows/macOS
- **Impact:** regressions only caught by `cargo check` / release build

### 8. Upstream ownership metadata
- CODEOWNERS / FUNDING cleaned for community fork on Day 3

### 9. Resource packaging vs `.gitignore`
- `.gitignore` ignores most of `resources/*` with exceptions
- Risk: contributors may not have full resource tree locally depending on how upstream shipped assets

---

## Lower / Design

### 10. `main` creates Verso only in `resumed`
- If `resumed` is delayed/missing on some platforms, `verso` stays `None`
- Worth monitoring on Wayland/macOS; not changed without platform repro

### 11. Clipboard None on some Linux setups
- Comment in code: None on Wayland in Flatpak possible
- Expected limitation, not a new regression

### 12. Documentation previously Windows-heavy
- Upstream clearly multi-platform (Linux Flatpak, macOS DMG, Windows NSIS, Nix shell)
- Day 3+ docs re-aligned to multi-platform

---

## Fixes applied

- Document this analysis
- Multi-platform build doc
- CI typo fix + CrabNebula gate
- Binary-name tolerance in packaging scripts
- Fork metadata cleanup
- **Stop ignoring `Cargo.lock`**

---

## Still requires real build machines

- Servo upgrade compile breakage (work on `upgrade/servo-prep`)
- Re-enabling CI tests after baseline is green
- Producing **verified** Release assets (only after a binary is confirmed to launch)
