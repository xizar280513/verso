# Servo Bump Log — Verso Updated

## Scope

Percobaan dibatasi pada **Linux** dan tahap `cargo check` / analisis dependency. Tidak ada klaim Windows/macOS, tidak ada release/binary palsu, tidak merge ke `main`.

---

## Percobaan 1 — Servo v0.4.0 (Manus)

| Item | Nilai |
|---|---|
| Branch | `upgrade/servo-prep` |
| Revision awal | `5e2d42e` |
| Target | `e8dbc1dfbf6f58621346a5f61ab7a17d01387873` (tag v0.4.0) |
| Hasil | **Gagal** di resolusi dependency |

### Error final
```text
error: no matching package named `compositing_traits` found
location searched: Git repository https://github.com/servo/servo.git?rev=e8dbc1d…
```

### Yang berhasil diperbaiki di v0.4.0
- Alias package rename (`servo-background-hang-monitor`, `servo-bluetooth`, …)
- Pin 26 crate Servo ke revision yang sama

### Yang belum
- Resolusi `compositing_traits`
- Error compile source Verso (belum tercapai)

Commit terkait: `01fd1f1`, `8be3a81`, `9bce639`, `ff9001f`, …

---

## Percobaan 2 — Option B: Servo v0.2.0 (lebih dekat)

| Item | Nilai |
|---|---|
| Keputusan | Mundur dari v0.4.0 ke intermediate lebih dekat |
| Target baru | **v0.2.0 / `6a0f9e4a7851175c442a1f1b7a988e075c67c537`** |
| Alasan | v0.4.0 terlalu jauh (package + surface compositor/paint); v0.2.0 masih lebih baru dari `5e2d42e` tetapi mengurangi jarak |
| Alias package | Dipertahankan (era post package-rename ~ Maret 2026) |
| Stylo / WebRender | Masih pin existing (`2025-03-15` / `0.66`) |

### Status saat commit Option B
- Root `Cargo.toml` sudah di-retarget ke `6a0f9e4…`
- **Belum** dijalankan `cargo check` ulang di mesin ini
- Langkah wajib berikutnya: `cargo check` di Linux (Manus / lokal / CI) dan catat apakah `compositing_traits` resolve di v0.2.0

### Jika `compositing_traits` masih gagal di v0.2.0
Investigasi tree Servo v0.2.0:
- Apakah crate ada di `components/shared/compositing`?
- Apakah package name menjadi `servo-compositing-traits` / terkait `paint`?
- Sesuaikan satu baris dependency + import di `src/compositor.rs` / `verso.rs` / `window.rs`

### Jika dependency resolution lolos
Baru klasifikasi error source:
- embedder_traits
- constellation
- compositor / paint / webrender
- config / prefs
- script / webview

---

## Kebijakan tetap

- Tidak menyatakan upgrade selesai sebelum `cargo check` hijau
- Tidak merge ke `main` sebelum minimal satu platform compile
- Tidak mempublikasikan binary sebelum launch diverifikasi

## Referensi

- Fork: https://github.com/xizar280513/verso
- Servo v0.2.0: https://github.com/servo/servo/releases/tag/v0.2.0
- Servo v0.4.0: https://github.com/servo/servo/tree/v0.4.0
