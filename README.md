# Verso Updated

> **Community Continuation / Major Upgrade Fork**
>
> This is an independent community fork of the original [Verso](https://github.com/versotile-org/verso) project (archived October 2025).
> Original project by versotile-org / Wu Yu Wei and contributors.
> We deeply respect the original work and the contributions it made to Servo.
>
> **Goal:** Large-scale modernization of Verso, with strong initial focus on **Windows**, clearer documentation, and eventually easy-to-download binaries.

---

## Current Status (September 2026)

| Item | Status |
|------|--------|
| Fork from archived upstream | Done |
| Marked as community continuation | Done |
| ROADMAP for 1-month effort | Done |
| Clearer Windows build guide | Done |
| Servo dependency | Still pinned to very old revision `5e2d42e` |
| Pre-built Windows `.exe` | Not yet available |

**Important:** Modern Servo is at 0.5+ (as of late 2026). This fork is still far behind. Upgrading the engine is the biggest and hardest task.

See **[ROADMAP.md](ROADMAP.md)** for the planned phases.

---

## Building on Windows

Detailed instructions: **[docs/WINDOWS.md](docs/WINDOWS.md)**

Short version:

```powershell
# Install tools (Scoop example)
scoop install git python llvm cmake curl
pip install mako

# Also need Rust (rustup) + Visual Studio C++ Build Tools

git clone https://github.com/xizar280513/verso.git
cd verso
cargo run
```

A proper pre-built `.exe` in GitHub Releases is a stated goal, but it does not exist yet. Do not expect a downloadable binary at this stage.

---

## License

Apache-2.0 OR MIT (same as upstream)

---

## Respect for Upstream

All original copyright notices and authors are preserved.  
This fork exists because the original project was archived due to limited resources. We are attempting to continue the work.

**Repository:** https://github.com/xizar280513/verso  
**Upstream (archived):** https://github.com/versotile-org/verso
