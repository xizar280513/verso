# Servo Bump Plan — Option B (closer intermediate)

**Branch:** `upgrade/servo-prep`  
**Updated:** Day 3 (2026-09-03) — after Manus v0.4.0 attempt

## Decision

Manus mencoba **Servo v0.4.0** (`e8dbc1d…`). Hasil:
- Banyak rename package bisa di-alias
- **Gagal** di resolusi dependency: `compositing_traits` tidak ditemukan
- Belum sampai error compile source Verso

Kesimpulan: v0.4.0 terlalu jauh dalam satu langkah.

**Opsi B dipilih:** mundur ke intermediate yang lebih dekat.

| Item | Nilai |
|------|--------|
| Pin awal Verso | `5e2d42e` |
| Percobaan gagal | v0.4.0 / `e8dbc1dfbf6f58621346a5f61ab7a17d01387873` |
| **Target baru (Option B)** | **v0.2.0 / `6a0f9e4a7851175c442a1f1b7a988e075c67c537`** |
| Alasan | Lebih baru dari pin awal, lebih tua dari v0.4.0; mengurangi jarak API/package |

## Integration surface (masih high-risk)

| File | Role | Risk |
|------|------|------|
| `src/verso.rs` | constellation + embedder | Critical |
| `src/compositor.rs` | compositor / paint integration | Critical |
| `src/window.rs` | window + messages | Critical |
| `src/webview/webview.rs` | navigation / scripts | High |
| `src/rendering.rs` | GL context | High |
| `src/config.rs` | prefs | Medium |

Catatan sejarah Servo yang relevan:
- Package naming unification (`servo-` prefix) ~ Maret 2026 (PR #42916) → alias masih mungkin diperlukan di v0.2.0
- Rename konsep compositor (`IOCompositor` → `Paint`, crate `paint`) ~ akhir 2025
- Itulah kenapa `compositing_traits` di v0.4.0 tidak resolve

## Strategy

1. Kerja tetap di `upgrade/servo-prep`
2. Pin **semua** crate Servo root ke `6a0f9e4a7851175c442a1f1b7a988e075c67c537`
3. Pertahankan alias package yang sudah terbukti perlu (dari percobaan Manus)
4. Untuk compositor: investigasi nama package aktual di tree v0.2.0 (`compositing_traits` vs `paint` / shared compositing)
5. `cargo check` di Linux (Manus / lokal / CI)
6. Baru perbaiki error source bertahap
7. Jangan merge ke `main` sampai check hijau di minimal satu platform

## Success criteria (tidak berubah)

- Dependency resolution berhasil
- `cargo check` mencapai / melewati source Verso
- Window open = target belakangan, setelah compile bersih

## Related

- [SERVO_BUMP_LOG.md](SERVO_BUMP_LOG.md) — log percobaan Manus + Option B
- [UPGRADE_STRATEGY.md](UPGRADE_STRATEGY.md)
