# Verso Updated

> **Community Continuation / Major Upgrade Fork**
>
> This is an independent community fork of the original [Verso](https://github.com/versotile-org/verso) project (archived October 2025).
> Original project by versotile-org / Wu Yu Wei and contributors.
> We deeply respect the original work and the contributions it made to Servo.
>
> Goal of this fork: **Large-scale modernization and upgrade** of Verso on top of the latest Servo, with strong initial focus on **Windows**, better stability, usability, and long-term maintainability.

**Original note from upstream (preserved for history):**

> Verso is currently no longer maintained. The Verso web browser project was an effort to build a functional web browser on top of the Servo web engine...

---

## Current Status of this Fork (September 2026)

- Fork created from the last archived state of versotile-org/verso.
- Primary focus right now: **Windows-first** usability and build reliability.
- Next major goals (in priority order):
  1. Update Servo dependency to a much more recent revision (Servo has advanced significantly since the pinned rev `5e2d42e`).
  2. Fix and modernize the Windows build & packaging path.
  3. Improve basic browser chrome / navigation stability.
  4. Multi-window and better process model where feasible.
  5. Keep the project buildable and documented.

This is **not** the official Verso project. It is a community effort to keep the idea alive and push it forward.

## License

Same as upstream: **Apache-2.0 OR MIT**

## Building (Windows focus)

(Instructions will be updated as the upgrade progresses. For now the original Windows instructions still apply as a starting point.)

```sh
# Example starting point (will change)
scoop install git python llvm cmake curl
pip install mako
cargo run
```

## Roadmap (High Level)

- [ ] Bump Servo crates to a recent stable-ish revision and resolve breakage
- [ ] Make Windows the primary supported & tested platform first
- [ ] Clean packaging for Windows (.exe / installer)
- [ ] Stabilize core browsing (tabs, navigation, basic chrome)
- [ ] Document architecture and contribution guide for this fork
- [ ] Longer term: multi-window, better embedding story, performance

## Respect for Upstream

All original copyright notices, authors, and the spirit of the project are preserved.  
This fork exists because the original authors archived the project due to limited resources — we are attempting to continue the work they started.

---

**Repository:** https://github.com/xizar280513/verso  
**Upstream (archived):** https://github.com/versotile-org/verso
