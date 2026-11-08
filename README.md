# Replica Starter

Starter project untuk meng-clone aplikasi apa pun dengan
[Replica skill pack](https://github.com/Jakeschincariol/replica-skill) di
Claude Code. Sebelas skill sudah terpasang project-local, folder kerja
`replica/` sudah disiapkan, dan enam tool Python-nya bisa dipanggil lewat
`make`.

Replica membangun ulang **apa yang dilakukan** sebuah aplikasi, bukan apa yang
dimilikinya. Fitur dan alur, clean-room. Bukan kode, logo, copy, atau
kontennya.

## Mulai

```bash
git clone <repo-ini> my-clone
cd my-clone
claude
```

Lalu di Claude Code:

```
/replica-recon https://app-yang-mau-di-clone.com
```

Skill terpasang di `.claude/skills/`, jadi muncul sebagai `/replica-recon`,
`/replica-architect`, dst. tanpa prefix plugin. Tidak perlu install apa pun
selain Python 3.8+.

## Urutan

```
recon -> architect -> design -> build -> backend -> test -> diff -> entrepreneur -> brand -> launch -> deploy
```

| perintah | hasil |
| --- | --- |
| `/replica-recon` | Peta aplikasi: daftar screen, flow, komponen, data model, `features.csv`. |
| `/replica-architect` | Stack, skema database, API, urutan build. |
| `/replica-design` | Design token: warna, tipografi, spacing, spec komponen. |
| `/replica-build` | Bangun screen per screen dari peta recon. |
| `/replica-backend` | Auth, database, payment, email, integrasi. |
| `/replica-test` | Test plan, Playwright e2e, laporan bug. |
| `/replica-diff` | Skor parity vs aplikasi asli, daftar yang kurang. |
| `/replica-entrepreneur` | Baca review asli user, ranking keluhan, fix plan, positioning. |
| `/replica-brand` | Nama, palet, logo brief, voice. Sweep sisa brand asli. |
| `/replica-launch` | Landing page, pricing, listing App Store / Play. |
| `/replica-deploy` | Preflight lalu ship ke domain sendiri. |

Setiap skill membaca output skill sebelumnya di `replica/`. Detail ada di
[CLAUDE.md](CLAUDE.md).

## Struktur

```
.claude/skills/replica-*/   sebelas skill (SKILL.md + tool Python + template)
replica/
  features.csv              feature matrix, diisi oleh replica-recon
  reviews.csv               review user, diisi oleh replica-entrepreneur
  design/tokens.json        design token awal, diisi oleh replica-design
  launch/listing.json       contoh listing store, ditimpa oleh replica-launch
  screens/                  screenshot referensi app asli (tidak di-commit)
  clone-screens/            screenshot clone kamu
  diffs/                    output imgdiff (tidak di-commit)
tests/                      unit test untuk enam tool Python
Makefile                    shortcut tool
CLAUDE.md                   instruksi project untuk Claude
```

## Tool

```bash
make test                          # unit test semua tool
make parity                        # skor parity dari replica/features.csv
make reviews                       # keluhan user, ranking + link
make contrast                      # kontras WCAG dari tokens.json
make sweep AVOID='Nama App Asli'   # sisa brand asli di codebase?
make listing AVOID='Nama App Asli' # limit store + cek copycat
make imgdiff A=replica/screens/S07.png B=replica/clone-screens/S07.png OUT=replica/diffs/S07.png
```

Semua tool standard-library Python, tidak menyentuh jaringan.

## Lisensi

Skill pack asli oleh [Jake Schincariol](https://github.com/Jakeschincariol/replica-skill),
MIT. Starter ini mengikuti lisensi yang sama, lihat [LICENSE](LICENSE).
