SHELL := /bin/bash
PY := toolchain/venv/bin/python
PC := toolchain/prjcombine
DB := $(PC)/databases/coolrunner2.zstd

.NOTPARALLEL:

.PHONY: reproduce reproduce-previous bootstrap decode verify baseline recovered-build readback-2026 verify-2026 recovered-2026
reproduce: baseline readback-2026 verify-2026 recovered-2026
	python3 tools/finish_readback_2026.py
	tools/build_locked_ise

readback-2026:
	python3 tools/run_logged.py readback-2026-analysis tools/analyze_readback_2026

reproduce-previous: decode verify
	$(MAKE) baseline recovered-build
	python3 tools/check_identity.py

bootstrap:
	bash tools/bootstrap

decode:
	sha256sum -c original/SHA256SUMS
	sha256sum -c schematic/SHA256SUMS
	tools/jedtool original/amplcpld.jed > decoded/previous-input/jed_metadata.json
	tools/decode_xc2c128 original/amplcpld.jed > decoded/previous-input/original.json
	$(PC)/target/release/coolrunner2_dis $(DB) original/amplcpld.jed > decoded/previous-input/original.combine.txt
	$(PC)/target/release/coolrunner2_as $(DB) decoded/previous-input/original.combine.txt decoded/previous-input/combine-roundtrip.jed
	tools/compare_jed original/amplcpld.jed decoded/previous-input/combine-roundtrip.jed > decoded/previous-input/combine-roundtrip-diff.json
	python3 -c 'import json; assert json.load(open("decoded/previous-input/combine-roundtrip-diff.json"))["hamming_distance"] == 0'
	python3 tools/history.py
	python3 tools/pinout.py

verify:
	$(PY) tools/verify_transition.py > tests/transition-proof.json
	python3 tools/placement.py
	python3 tools/render_decode.py
	python3 tools/gen_vectors.py > tests/vector-generation.log
	mkdir -p experiments/ghdl
	cd experiments/ghdl && python3 ../../tools/run_logged.py ghdl-analyze ../../tools/ghdl -a --std=08 ../../recovered/previous-input/amplcpld_recovered.vhd ../../tests/recovered_tb.vhd
	cd experiments/ghdl && python3 ../../tools/run_logged.py ghdl-elaborate ../../tools/ghdl -e --std=08 recovered_tb
	cd experiments/ghdl && python3 ../../tools/run_logged.py ghdl-run ../../tools/ghdl -r --std=08 recovered_tb --assert-level=error
	cp experiments/logs/ghdl-run.log tests/ghdl-equivalence.log
	python3 tools/write_reports.py

baseline:
	tools/build_ise baseline
	python3 tools/write_reports.py

recovered-build:
	tools/build_ise recovered
	python3 tools/write_reports.py

verify-2026:
	$(PY) tools/verify_readback_2026.py > tests/readback-2026/transition-proof.log
	python3 tools/render_decode.py decoded/readback-2026
	python3 tools/gen_vectors.py --readback-2026 > tests/readback-2026/vector-generation.log
	mkdir -p experiments/ghdl-readback-2026
	cd experiments/ghdl-readback-2026 && python3 ../../tools/run_logged.py new-ghdl-analyze ../../tools/ghdl -a --std=08 ../../recovered/readback-2026/amplcpld_recovered.vhd ../../tests/recovered_tb.vhd
	cd experiments/ghdl-readback-2026 && python3 ../../tools/run_logged.py new-ghdl-elaborate ../../tools/ghdl -e --std=08 recovered_tb
	cd experiments/ghdl-readback-2026 && python3 ../../tools/run_logged.py new-ghdl-run ../../tools/ghdl -r --std=08 recovered_tb -gvector_path=../../tests/readback-2026/vectors.txt --assert-level=error
	cp experiments/logs/new-ghdl-run.log tests/readback-2026/ghdl-equivalence.log

recovered-2026:
	tools/build_ise readback-2026
	CPLD_PROOF_IR="$(CURDIR)/experiments/ise-readback-2026/configuration.json" CPLD_PROOF_JED="$(CURDIR)/experiments/ise-readback-2026/readback-2026.jed" CPLD_PROOF_BUILD="$(CURDIR)/experiments/ise-readback-2026" $(PY) tools/verify_readback_2026.py > tests/readback-2026/fit-transition-proof.log
	cp experiments/ise-readback-2026/transition-proof.json tests/readback-2026/fit-transition-proof.json

.PHONY: implementation-locked
implementation-locked: recovered-2026
	tools/build_locked_ise
