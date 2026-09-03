# Servo Bump Log — Verso Updated

## Scope

Percobaan ini dibatasi pada **Linux Ubuntu 24.04** dan berhenti pada tahap `cargo check`. Tidak ada klaim dukungan Windows/macOS, tidak ada release, binary, atau merge ke `main`.

## Target revision

| Item | Nilai |
|---|---|
| Branch kerja | `upgrade/servo-prep` |
| Revision awal | `5e2d42e` |
| Target intermediate | `e8dbc1dfbf6f58621346a5f61ab7a17d01387873` |
| Referensi target | Servo tag `v0.4.0` |
| Tip terbaru Servo | Tidak digunakan |
| Stylo/WebRender | Dibiarkan pada pin existing (`2025-03-15` dan `0.66`) |

Revision target dipilih sebagai milestone release-ish yang lebih baru dari pin awal, tetapi bukan tip terbaru. Seluruh **26 dependency Servo di root `Cargo.toml`** diubah ke revision yang sama.

## Environment Linux

Environment yang disiapkan adalah Ubuntu 24.04 dengan Rust `1.85.0` sesuai `rust-toolchain.toml`, komponen `llvm-tools`, `rustc-dev`, `rust-docs`, dan `rustfmt`, serta `build-essential`, CMake, Clang/LLVM, `pkg-config`, Python development tools, Mako `1.4.1`, OpenSSL/DBus/Udev/X11/XCB/GL/EGL/font dependencies, ALSA, dan paket development GStreamer yang tersedia pada Ubuntu 24.04.

## Hasil `cargo check`

**Belum lolos.** `cargo check` belum mencapai kompilasi source Rust karena Cargo berhenti pada resolusi nama package di manifest Git Servo. Percobaan final berhenti dengan:

```text
error: no matching package named `compositing_traits` found
location searched: Git repository https://github.com/servo/servo.git?rev=e8dbc1dfbf6f58621346a5f61ab7a17d01387873
required by package `versoview v0.0.4 (/home/ubuntu/verso)`
CARGO_CHECK_EXIT=101
```

Karena dependency resolution belum selesai, **belum ada error compile Rust dari file source Verso** yang dapat diklasifikasikan. `cargo build --release` tidak dijalankan sesuai batasan tugas.

## Error yang ditemukan dan klasifikasinya

| Tahap | File/crate | Error | Kategori | Status |
|---|---|---|---|---|
| Resolusi dependency | Root `Cargo.toml`, `background_hang_monitor` | Package tidak ditemukan pada nama lama | package/manifest Servo | Diperbaiki dengan alias `package = "servo-background-hang-monitor"` |
| Resolusi dependency | Root `Cargo.toml`, `bluetooth` | Package `bluetooth` tidak ditemukan | package/manifest Servo | Diperbaiki dengan alias `package = "servo-bluetooth"` |
| Resolusi dependency | Root `Cargo.toml`, `bluetooth_traits` | Package trait dengan nama lama tidak ditemukan | package/manifest Servo | Diperbaiki dengan alias `package = "servo-bluetooth-traits"` |
| Resolusi dependency | Root `Cargo.toml`, `compositing_traits` | Percobaan alias `servo-compositing-traits` tidak ditemukan | compositor/webrender/package drift | Dikoreksi ke nama `compositing_traits`, tetapi package tersebut juga tidak tersedia pada target |
| Resolusi dependency final | Root `Cargo.toml`, `compositing_traits` | `no matching package named compositing_traits found` | compositor/constellation surface drift | Masih tersisa; memblokir kompilasi |

Error jaringan HTTP/2 sempat muncul sebagai `spurious network error` saat fetch Git, tetapi fetch revision berhasil dilanjutkan menggunakan Git CLI backend. Error tersebut bukan blocker final.

## Patch yang diterapkan

Patch yang aman dan terbatas pada manifest telah diterapkan. Semua pin Servo root kini menggunakan revision target yang sama. Alias `package` ditambahkan untuk nama package yang berubah pada workspace Servo v0.4.0, termasuk background hang monitor, base, canvas, constellation, devtools, embedder traits, fonts, media, net, profile, script, allocator, config, geometry, URL, WebDriver, WebGPU, dan Bluetooth. Tidak ada refactor source atau perubahan besar pada integrasi embedder.

Commit yang dibuat:

| Commit | Pesan |
|---|---|
| `01fd1f1` | `chore: bump Servo crates to v0.4.0 intermediate revision` |
| `8be3a81` | `fix: alias renamed Servo v0.4 packages` |
| `9bce639` | `fix: alias Servo Bluetooth packages` |
| `ff9001f` | `fix: use Servo v0.4 compositing package name` |

Dokumen `docs/ARCHITECTURE.md` dan `docs/KNOWN_GAPS.md` yang diminta tidak terdapat di checkout branch ini. Ketiadaan keduanya dicatat sebagai kondisi baseline; file tersebut tidak dibuat secara spekulatif.

## Saran langkah berikutnya

Langkah berikutnya sebaiknya dilakukan pada mesin build yang memiliki waktu dan bandwidth lebih longgar. Pertama, cocokkan dependency `compositing_traits` Verso dengan crate compositor yang menggantikannya pada Servo v0.4.0, termasuk seluruh perubahan import dan tipe di `src/compositor.rs`, `src/verso.rs`, dan `src/window.rs`. Setelah dependency resolution berhasil, ulangi `cargo check` dan klasifikasikan error source berdasarkan `embedder_traits`, constellation, compositor/webrender, config/prefs, script/webview, dan kategori lain. Jangan melanjutkan ke `cargo build --release` atau menyatakan upgrade selesai sebelum `cargo check` benar-benar hijau.

## Referensi

[1]: https://github.com/xizar280513/verso "Verso Updated fork"

[2]: https://github.com/servo/servo/tree/v0.4.0 "Servo v0.4.0"
