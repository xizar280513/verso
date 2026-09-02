# Servo Upgrade Strategy — Verso Updated

## Current Situation (Day 1)

- Verso is pinned to Servo git revision `5e2d42e`.
- Modern Servo (as of September 2026) is at **0.5.x / 0.6.0** territory.
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

## Short-term Goals (next sessions)

- [ ] Update repository / homepage fields in `Cargo.toml` to point to this fork
- [ ] Refresh some safe third-party crate versions
- [ ] Document known breakage points
- [ ] Prepare a branch for the first Servo bump experiment
- [ ] Keep Windows as the primary target

## Long-term Goal

Bring Verso onto a much newer Servo so that:
- Real-world site compatibility improves
- We can eventually produce usable Windows binaries
- The project becomes maintainable again

## Risk Management

- Every Servo bump will be done on a branch first.
- Main branch should stay buildable as long as possible.
- Binary releases will only be created when the build actually produces a working executable.
