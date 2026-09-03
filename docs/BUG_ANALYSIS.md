# Bug & Risk Analysis — Verso Updated (Day 3)

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
- **Fix direction:** gate job on secret presence; prefer GitHub Release artifacts for this fork

### 3. Binary name duality (`verso` vs `versoview`)
- **Where:**
  - package name `versoview` (root)
  - workspace member `verso` (also produces a binary)
  - Flatpak installs **both** `verso` and `versoview`
  - Desktop `Exec=verso`
  - `package_libs.py` (macOS) only looks for `./target/release/verso`
  - Windows staging script checks both (good)
- **Impact:** packaging scripts can stage/package the wrong binary if only one was built
- **Fix direction:** always document both; scripts should accept either; CI should build the same set Flatpak expects

### 4. `Cargo.lock` is gitignored
- **Where:** `.gitignore` contains `Cargo.lock`
- **Impact:** Flatpak flow uses `flatpak-cargo-generator.py ./Cargo.lock` — non-reproducible / CI schedule path fragile if lockfile absent
- **Fix direction:** stop ignoring `Cargo.lock` for an application workspace (longer-term)

---

## Medium

### 5. Windows packaging script gap
- `etc/package_libs.py` is macOS-only (otool/GStreamer)
- Day 3 added `etc/package_windows_portable.ps1` as interim fix
- Full NSIS path still relies on `cargo packager` + CI

### 6. CI typo: “Install scroop”
- **Where:** `.github/workflows/build.yml` Windows job step name
- Cosmetic but signals copy-paste debt; fixed on Day 3

### 7. Tests disabled in CI
- `cargo test` steps commented out on Linux/Windows/macOS
- **Impact:** regressions only caught by `cargo check` / release build

### 8. Upstream ownership metadata still present
- `CODEOWNERS` → `@wusyong`
- `FUNDING.yml` → Open Collective `verso`
- Not a runtime bug, but misleading for a community fork

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
- Day 3 corrects project docs/roadmap toward multi-platform again

---

## Fixes applied in Day 3 analysis pass

See CHANGELOG / commits:
- Document this analysis
- Multi-platform build doc
- CI typo fix
- Gate CrabNebula release job when secret missing
- Clarify binary names in packaging scripts/docs
- Soften fork metadata that incorrectly implies upstream ownership

---

## Not fixed yet (requires real builds)

- Servo upgrade compile breakage
- Restoring `Cargo.lock` to version control (large intentional follow-up)
- Re-enabling CI tests
- Producing verified Release assets for all platforms
