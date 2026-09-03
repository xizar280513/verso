# Architecture Overview — Verso Updated

High-level map of the current codebase. Useful before attempting Servo upgrades.

## Main Components

| Area | Path | Role |
|------|------|------|
| Entry / browser core | `src/verso.rs` | Starts Servo constellation, embedder channels, windows |
| Compositor | `src/compositor.rs` | Webrender integration, frame readiness, shutdown |
| Window / chrome | `src/window.rs` | Winit window, tabs, panel, embedder message routing |
| WebView | `src/webview/` | Navigation, menus, prompts, script execution |
| Rendering context | `src/rendering.rs` | GL context for Webrender |
| Config | `src/config.rs` | CLI / controller config, prefs |
| Tabs / bookmarks / downloads | `src/tab.rs`, `bookmark.rs`, `download.rs` | Browser chrome features |
| IPC controller API | `verso/`, `versoview_messages/` | Embedding / control channel |

## Servo Integration Style

Verso is **not** a thin shell over a stable public embedding API only.

It directly depends on many Servo internal crates:

- `constellation` / `constellation_traits`
- `embedder_traits`
- `compositing_traits`
- `layout_thread_2020`
- `script`
- `net`, `fonts`, `profile`, `devtools`, `webgpu`, ...

Plus separately pinned:
- `stylo`
- `webrender`

This is why Servo upgrades are high-risk and must be incremental.

## Process Model (current tree)

- Primarily driven as an embedder around Servo’s constellation
- JS engine setup can be in-process (`script::init`) depending on opts
- Multiprocess-related paths exist but were still evolving upstream

## Upgrade Implication

Any Servo `rev` bump will likely require coordinated changes in:

1. `src/verso.rs` (startup + channel wiring)
2. `src/compositor.rs`
3. `src/window.rs` + `src/webview/*`
4. Possibly `stylo` / `webrender` pins to stay compatible

See `docs/SERVO_BUMP_PLAN.md` on branch `upgrade/servo-prep` for the active plan.
