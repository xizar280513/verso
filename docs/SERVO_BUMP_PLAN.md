# Servo Bump Plan — First Attempt

**Branch:** `upgrade/servo-prep`  
**Date:** Day 2 (2026-09-03)

## Current Pin

All Servo crates in `Cargo.toml` are locked to:

```toml
rev = "5e2d42e"
```

This revision is very old compared to current Servo (0.5.x / 0.6.x as of September 2026).

## Strategy for First Bump

We will **not** jump to latest `main`.

### Recommended approach

1. **Identify an intermediate target**
   - Prefer a known Servo release tag (e.g. around 0.2 ~ 0.3 era) rather than bleeding-edge main.
   - Goal is to reduce the gap in controlled steps.

2. **Create a dedicated branch** (this branch)
   - Keep `main` buildable as long as possible.

3. **Change only the `rev` first**
   - Update every `git = "https://github.com/servo/servo.git", rev = "..."` line together.
   - Do not mix old and new revisions.

4. **Expect massive breakage**
   - Crate structure, trait names, embedder API, and feature flags have all changed.
   - Fix errors in layers:
     - First make it compile
     - Then fix runtime crashes
     - Then restore features

5. **Windows remains primary**
   - Any change must be validated with Windows target in mind.

## Immediate Next Actions on this Branch

- [ ] Research a concrete intermediate Servo commit/tag that is newer than `5e2d42e` but not latest
- [ ] Document the chosen target commit and why
- [ ] Prepare the Cargo.toml diff (all rev lines)
- [ ] List known high-risk areas (embedder_traits, constellation, script, layout)

## High-Risk Areas in Verso

From current structure:
- Heavy use of `embedder_traits`
- Direct dependency on many internal Servo crates
- Custom windowing / compositing integration
- Older `stylo` and `webrender` pins that must stay in sync

## Success Criteria for First Bump

- Tree compiles on at least one platform (preferably Windows)
- Basic window opens
- No immediate crash on startup
- Documented list of remaining broken features

Only after the above is true do we merge back toward `main`.
