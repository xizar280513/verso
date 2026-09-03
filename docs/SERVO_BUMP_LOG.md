# Servo Bump Log — Verso Updated

## Scope

Percobaan ini menggunakan **Linux Ubuntu 24.04 sebagai host compile** dengan arah produk Windows-first. Tidak ada klaim dukungan Windows/macOS selesai, tidak ada release atau binary palsu, dan tidak ada merge ke `main`.

## Baseline dan target Option B

| Item | Nilai |
|---|---|
| Branch | `upgrade/servo-prep` |
| Target Option B | Servo `v0.2.0` |
| Revision target | `6a0f9e4a7851175c442a1f1b7a988e075c67c537` |
| Revision awal historis | `5e2d42e` |
| Target sebelumnya | Servo `v0.4.0`, `e8dbc1dfbf6f58621346a5f61ab7a17d01387873` |
| Stylo/WebRender | Dipertahankan pada pin existing `2025-03-15` / `0.66` |

Branch sudah diverifikasi dan seluruh pin Servo pada root `Cargo.toml` diarahkan ke revision v0.2.0 yang sama. Alias package dari percobaan v0.4.0 dipertahankan karena sebagian masih relevan.

## Environment

Host Ubuntu telah memiliki Rust `1.85.0` sesuai `rust-toolchain.toml`, komponen `llvm-tools`, `rustc-dev`, `rust-docs`, `rustfmt`, serta build tools Linux, CMake, Clang/LLVM, `pkg-config`, Python 3, Mako, dependency X11/XCB/GL/EGL/Font/ALSA/GStreamer, dan dependency native lain yang diperlukan untuk proses check.

Toolchain Windows GNU juga berhasil dipasang:

```text
rustup target add x86_64-pc-windows-gnu
rust-std-x86_64-pc-windows-gnu installed
mingw-w64 installed
```

Cross-compile Windows dari Ubuntu **bukan setara dengan MSVC/Visual Studio**. GUI, WebView, native DLL, runtime Windows, dan integrasi platform tetap perlu divalidasi pada Windows asli atau GitHub Actions `windows-latest`.

## Hasil cargo check host

**Gagal pada dependency resolution**, sebelum kompilasi source Rust Verso:

```text
error: no matching package named `compositing_traits` found
location searched: Git repository https://github.com/servo/servo.git?rev=6a0f9e4a7851175c442a1f1b7a988e075c67c537
required by package `versoview v0.0.4 (/home/ubuntu/verso)`
```

Error ini berada pada kategori **compositor / paint / compositing_traits / package rename**. Source Verso masih mengimpor crate tersebut pada `src/compositor.rs` dan `src/verso.rs`, sehingga dependency tidak dapat dihapus secara aman tanpa penggantian API yang diverifikasi. Tidak ada error `embedder_traits`, constellation, config/prefs, script/webview, atau kategori source lain yang tercapai pada tahap ini.

## Hasil cargo check Windows GNU

Target `x86_64-pc-windows-gnu` berhasil dipasang dan `cargo check --target x86_64-pc-windows-gnu` telah dijalankan. Hasilnya **gagal pada blocker resolusi yang sama**:

```text
error: no matching package named `compositing_traits` found
location searched: Git repository https://github.com/servo/servo.git?rev=6a0f9e4a7851175c442a1f1b7a988e075c67c537
required by package `versoview v0.0.4 (/home/ubuntu/verso)`
```

Dengan demikian belum ada perbedaan error khusus Windows yang dapat dinilai. Check berhenti sebelum compiler memasuki platform-specific code.

## Riwayat error dan patch

| Percobaan | File/crate | Kategori | Hasil |
|---|---|---|---|
| v0.4.0 | `background_hang_monitor` | Package rename | Dialiaskan ke `servo-background-hang-monitor` |
| v0.4.0 | `bluetooth`, `bluetooth_traits` | Package rename | Dialiaskan ke package Servo v0.4 yang sesuai |
| v0.4.0 | `compositing_traits` | Compositor/package drift | Tidak tersedia pada target v0.4.0 |
| v0.2.0 host | `compositing_traits` | Compositor/package drift | Tetap tidak tersedia; menjadi blocker utama |
| v0.2.0 Windows GNU | `compositing_traits` | Compositor/package drift | Gagal pada blocker yang sama |

Perubahan yang diterapkan terbatas pada `Cargo.toml`: retarget semua pin Servo ke v0.2.0 dan mempertahankan alias package yang relevan. Tidak ada rewrite arsitektur compositor/embedder dan tidak ada perubahan source speculative.

## Blocker tersisa, berdasarkan prioritas

Pertama, perlu dipetakan pengganti resmi `compositing_traits` pada tree Servo v0.2.0. Tree tersebut menyediakan crate `paint`/`servo-paint` dan `paint_api`/`servo-paint-api`, tetapi kesetaraan API dengan import yang digunakan Verso belum terbukti. Kedua, setelah dependency compositor dipetakan, kemungkinan akan muncul perubahan API pada `src/compositor.rs` dan `src/verso.rs`; perubahan tersebut harus ditangani berdasarkan error compiler nyata. Ketiga, setelah host check melewati resolusi dan compile, check Windows GNU perlu diulang untuk menemukan dependency atau linker issue yang khusus target Windows. Validasi akhir tetap harus dilakukan pada Windows native atau GitHub Actions Windows.

## Rekomendasi langkah berikutnya

Langkah terbaik berikutnya adalah melanjutkan di Manus atau mesin Linux yang memiliki cache Cargo lebih besar untuk membandingkan API crate `paint`/`paint_api` v0.2.0 dengan penggunaan `compositing_traits`. Jangan menghapus dependency sebelum seluruh import dan tipe penggantinya dapat dipastikan. Setelah host `cargo check` mulai mengompilasi source, lakukan perbaikan kecil yang terverifikasi, kemudian ulangi check Windows GNU.

Untuk validasi produk, gunakan GitHub Actions `windows-latest` dengan toolchain MSVC/native Windows setelah dependency resolution terselesaikan. Gunakan `macos-latest` atau mesin Mac nyata hanya pada tahap terpisah; sandbox Ubuntu ini tidak memiliki macOS SDK/Xcode dan tidak dapat membuktikan dukungan macOS penuh. Jika pemetaan compositor menunjukkan v0.2.0 masih terlalu jauh, mundur ke intermediate Servo yang lebih dekat adalah opsi yang lebih aman daripada melakukan refactor besar.

Belum ada klaim bahwa binary `.exe` siap pakai, belum ada klaim dukungan Windows selesai, belum ada klaim dukungan macOS penuh, dan belum ada GitHub Release.

## Referensi

[1]: https://github.com/xizar280513/verso "Verso Updated fork"

[2]: https://github.com/servo/servo/releases/tag/v0.2.0 "Servo v0.2.0"

[3]: https://github.com/servo/servo/tree/v0.4.0 "Servo v0.4.0"
