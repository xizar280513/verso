# Servo Upgrade Strategy — Verso Updated

## Current Situation (Day 2)

- Verso is pinned to Servo git revision `5e2d42e`.
- Modern Servo (as of September 2026) is at **0.5.x / 0.6.x** territory.
- The gap is very large (tens of thousands of commits, many API and crate structure changes).
- A direct jump to the latest Servo will almost certainly result in hundreds of compile errors.

## Upgrade Philosophy

We will **not** do a big-bang upgrade.

Instead we follow a controlled, incremental approach:

1. **Stabilize the current tree** (documentation, Windows build clarity, repository metadata).
2. **Update non-Servo dependencies** first (safer).
3. **Choose intermediate Servo targets** rather than jumping straight to `main`.
4. Fix compile errors in batches.
5. Only after the tree builds again do we move to the next Servo milestone.

## Progress

- [x] Update repository / homepage fields in `Cargo.toml` to point to this fork
- [x] Document known breakage / gaps (`docs/KNOWN_GAPS.md`)
- [x] Prepare a branch for the first Servo bump experiment (`upgrade/servo-prep`)
- [x] Map high-risk integration files
- [x] Keep Windows as the primary target (documented)
- [ ] Refresh some safe third-party crate versions
- [ ] Choose concrete intermediate Servo revision
- [ ] Perform first controlled `rev` bump on upgrade branch

## Long-term Goal

Bring Verso onto a much newer Servo so that:
- Real-world site compatibility improves
- We can eventually produce usable Windows binaries
- The project becomes maintainable again

## Risk Management

- Every Servo bump will be done on a branch first.
- Main branch should stay buildable as long as possible.
- Binary releases will only be created when the build actually produces a working executable.

See also:
- [SERVO_BUMP_PLAN.md](SERVO_BUMP_PLAN.md) (detailed plan on `upgrade/servo-prep`)
- [KNOWN_GAPS.md](KNOWN_GAPS.md)
