# Shortcut untuk enam tool Python dari Replica skill pack.
# Semua tool standard-library, tidak perlu pip install, tidak menyentuh jaringan.

SKILLS := .claude/skills
PY     := python3
AVOID  ?= Nama Aplikasi Asli

.PHONY: help test parity reviews contrast sweep listing imgdiff

help:
	@echo "make test                       jalankan unit test tool"
	@echo "make parity                     skor parity dari replica/features.csv"
	@echo "make reviews                    ranking keluhan user dari replica/reviews.csv"
	@echo "make contrast                   cek kontras WCAG replica/design/tokens.json"
	@echo "make sweep AVOID='Nama Asli'    cari sisa brand asli di codebase"
	@echo "make listing AVOID='Nama Asli'  lint replica/launch/listing.json"
	@echo "make imgdiff A=orig.png B=clone.png OUT=diff.png"

test:
	$(PY) -m unittest discover -s tests -v

parity:
	$(PY) $(SKILLS)/replica-diff/parity.py replica/features.csv

reviews:
	$(PY) $(SKILLS)/replica-entrepreneur/reviews.py replica/reviews.csv

contrast:
	$(PY) $(SKILLS)/replica-design/contrast.py replica/design/tokens.json

sweep:
	$(PY) $(SKILLS)/replica-brand/sweep.py . --avoid "$(AVOID)"

listing:
	$(PY) $(SKILLS)/replica-launch/listing.py replica/launch/listing.json --avoid "$(AVOID)"

imgdiff:
	$(PY) $(SKILLS)/replica-diff/imgdiff.py $(A) $(B) --out $(OUT)
