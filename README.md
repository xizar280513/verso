# Verso Updated

> **Community Continuation / Major Upgrade Fork**
>
> This is an independent community fork of the original [Verso](https://github.com/versotile-org/verso) project (archived October 2025).
> Original project by versotile-org / Wu Yu Wei and contributors.
> We deeply respect the original work and the contributions it made to Servo.
>
> **Goal:** Large-scale modernization of Verso, with strong initial focus on **Windows**, clearer documentation, and eventually easy-to-download binaries.

---

## Current Status (September 2026 — Day 2)

| Item | Status |
|------|--------|
| Fork from archived upstream | Done |
| Marked as community continuation | Done |
| ROADMAP for 1-month effort | Done |
| Clearer Windows build guide | Done |
| Upgrade strategy documented | Done |
| Integration surface mapped | Done |
| Upgrade branch created | Done (`upgrade/servo-prep`) |
| Known gaps documented | Done |
| Servo dependency | Still pinned to very old revision `5e2d42e` |
| Pre-built Windows `.exe` | Not yet available |

**Important:** Modern Servo is at 0.5+ (as of late 2026). This fork is still far behind. Upgrading the engine is the biggest and hardest task. Work is being done carefully on a separate branch.

### Key Documents
- [ROADMAP.md](ROADMAP.md) — 1-month plan
- [docs/WINDOWS.md](docs/WINDOWS.md) — Windows build instructions
- [docs/UPGRADE_STRATEGY.md](docs/UPGRADE_STRATEGY.md) — How we plan to modernize Servo
- [docs/KNOWN_GAPS.md](docs/KNOWN_GAPS.md) — Honest list of current gaps
- [CHANGELOG.md](CHANGELOG.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)

---

## Building on Windows

See **[docs/WINDOWS.md](docs/WINDOWS.md)** for details.

Short version:

```powershell
scoop install git python llvm cmake curl
pip install mako
# + Rust via rustup + Visual Studio C++ Build Tools

git clone https://github.com/xizar280513/verso.git
cd verso
cargo run
```

A proper pre-built `.exe` in GitHub Releases is a stated goal, but it does **not** exist yet.

---

## License

Apache-2.0 OR MIT (same as upstream)

---

## Respect for Upstream

All original copyright notices and authors are preserved.  
This fork exists because the original project was archived due to limited resources. We are attempting to continue the work.

**Repository:** https://github.com/xizar280513/verso  
**Upstream (archived):** https://github.com/versotile-org/verso
