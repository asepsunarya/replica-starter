# Replica Starter

Project ini adalah starter untuk meng-clone sebuah aplikasi dengan Replica skill
pack. Sebelas skill ada di `.claude/skills/replica-*` dan dipanggil sebagai
`/replica-recon`, `/replica-architect`, dan seterusnya.

## Urutan kerja

```
recon -> architect -> design -> build -> backend -> test -> diff -> entrepreneur -> brand -> launch -> deploy
```

Setiap skill membaca apa yang ditulis skill sebelumnya di folder `replica/`.
Jalankan berurutan untuk project baru. Skill bisa dijalankan sendiri-sendiri
kalau hanya butuh satu tahap.

## Di mana file-nya

| file | ditulis oleh |
| --- | --- |
| `replica/recon.md`, `replica/features.csv`, `replica/screens/` | replica-recon |
| `replica/architecture.md`, `replica/schema.sql` | replica-architect |
| `replica/design/tokens.json`, `replica/design/components.md` | replica-design |
| `replica/build-log.md` | replica-build |
| `replica/backend.md` | replica-backend |
| `replica/test-plan.md`, `replica/bugs.md` | replica-test |
| `replica/parity.md`, `replica/diffs/` | replica-diff |
| `replica/reviews.csv`, `replica/feedback.md`, `replica/fixes.md` | replica-entrepreneur |
| `replica/brand.md`, `replica/brand.json` | replica-brand |
| `replica/launch/listing.json`, landing page, pricing | replica-launch |
| `replica/deploy.md` | replica-deploy |

Kode aplikasi hasil clone diletakkan di root project ini (misalnya `app/` atau
`src/`), ditentukan saat `/replica-architect`.

## Aturan yang tidak boleh dilanggar

- Rebuild **fungsi dan alur**, bukan kode, logo, copy, atau konten milik
  aplikasi asli. Clean-room.
- Hanya sumber publik dan akun milik user sendiri. Tidak ada scraping, tidak
  ada membaca bundle JS atau private API.
- Screenshot di `replica/screens/` hanya referensi, tidak pernah ikut di-ship.
- `make sweep AVOID='Nama Asli'` harus bersih sebelum deploy.

## Tool

`make help` menampilkan semua shortcut. `make test` menjalankan unit test tool.
