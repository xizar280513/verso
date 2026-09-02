# Verso Updated — 1-Month Roadmap

**Goal:** Community continuation of the archived Verso browser with a major upgrade focus, prioritizing **Windows** usability and eventually providing downloadable `.exe` binaries in GitHub Releases.

We respect the original Verso project and its authors. This is not the official project.

---

## Honest Scope

A full mature browser is not achievable in 30 days.  
What **is** achievable:

- Significantly better Windows build experience
- Modernized Servo dependency (as far as breakage allows)
- Clearer documentation so users do not need complex setup
- Foundation for future binary releases

Binary `.exe` will only be published when it actually runs. No fake releases.

---

## Week 1 — Foundation & Windows Focus

- [x] Fork from versotile-org/verso
- [x] Mark repository as community continuation
- [x] Create clear ROADMAP.md
- [x] Improve Windows build documentation (`docs/WINDOWS.md`)
- [x] Document current limitations clearly in README
- [x] Analyze gap: pinned Servo `5e2d42e` vs current Servo 0.5+/0.6 (very large gap)

## Week 2 — Servo Upgrade Attempt

- [ ] Choose a realistic newer Servo target (not jumping straight to latest)
- [ ] Bump dependencies in Cargo.toml carefully
- [ ] Fix compilation errors systematically
- [ ] Keep Windows as the primary test platform

## Week 3 — Core Stability

- [ ] Improve basic navigation and window handling
- [ ] Reduce obvious crashes
- [ ] Better error messages / logging

## Week 4 — Packaging Path

- [ ] Evaluate cargo-packager and Windows packaging options
- [ ] Attempt to produce a usable Windows artifact
- [ ] If successful → publish to GitHub Releases
- [ ] Update README with simple download instructions

---

## Success Criteria for the Month

1. Repository is clearly documented as a living community fork
2. Windows build path is clearer and less painful than upstream
3. At least partial progress on Servo modernization
4. Concrete path (or actual artifact) toward easy Windows binary distribution

---

**Maintainer note:** Work is being driven with the goal of reducing the need for users to run complex setup just to try the browser.
