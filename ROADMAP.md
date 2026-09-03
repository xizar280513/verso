# Verso Updated — 1-Month Roadmap

**Goal:** Community continuation of the archived Verso browser with a major upgrade focus, prioritizing **Windows** usability and eventually providing downloadable `.exe` binaries in GitHub Releases.

We respect the original Verso project and its authors. This is not the official project.

**Time box:** 1 month total.  
**Day 3 focus:** Windows / packaging path.

---

## Honest Scope

A full mature browser is not achievable in 30 days.  
Binary `.exe` will only be published when it actually runs. No fake releases.

---

## Week 1 — Foundation (Done)

- [x] Fork + community identity + core docs

## Week 2 — Upgrade prep (Day 2 done / ongoing)

- [x] `upgrade/servo-prep` branch
- [x] Integration surface mapped
- [x] Packaging discovery (`package_libs.py` = macOS-oriented)
- [ ] Actual Servo rev bump still pending

## Day 3 — Windows / packaging (in progress)

- [x] `docs/WINDOWS_PACKAGING.md` checklist
- [x] `etc/package_windows_portable.ps1` staging script skeleton
- [x] `etc/package_libs.py` now points Windows users to the PowerShell script
- [ ] Verify binary name on real Windows build (`versoview.exe` vs `verso.exe`)
- [ ] Verify required DLLs by launching staged folder
- [ ] Produce portable ZIP only after launch succeeds
- [ ] GitHub Release only after launch succeeds

## Week 3 — Core Stability

- [ ] Navigation / crash reduction / logging

## Week 4 — Real artifact attempt

- [ ] Portable ZIP or installer if binary runs
- [ ] Release notes with limitations

---

**Maintainer note:** Day 3 started with practical Windows packaging scaffolding. No Release asset until a local launch works.
