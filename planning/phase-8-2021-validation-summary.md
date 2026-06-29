# Phase 8 2021 Validation Summary

Phase 8 validated the public 2021 FABLE-C generated Python model before publishing the compressed
artifact in `examples/fable_2021/`.

## Source Workbook

- Local path: `tmp/private-workbooks/2021_Open_FABLECalculator.xlsx`
- SHA-256: `aa5f2a768ae3670e93178a8f9f15fd10c4879101def52e987d374447098957e9`
- Tracked provenance: `benchmarks/fable-calculator/checksums.sha256`

## Generated Artifact

- Ignored generated source: `tmp/generated-models/fable-2021/generated_fable_2021_model.py`
- Tracked compressed archive: `examples/fable_2021/generated_fable_2021_model.py.xz`
- Archive SHA-256: `c9ab8dd1fba273cdd53386af1b65fae216086b4a05df78467681fdddbf5186d9`
- Uncompressed source size: 122,413,220 bytes
- Compressed archive size: about 2.1 MiB

## Validation Run

Ignored raw artifacts:

- `tmp/phase-8-2021-validation/output_refs.json`
- `tmp/phase-8-2021-validation/contract.json`
- `tmp/phase-8-2021-validation/expressions.json`
- `tmp/phase-8-2021-validation/constants.json`
- `tmp/phase-8-2021-validation/summary.json`
- `tmp/phase-8-2021-validation/mismatch_samples.json`
- `tmp/phase-8-2021-validation/progress.log`
- `tmp/phase-8-2021-validation/generated_model_stdout.log`

Summary:

- status: `pass`
- extracted sheets: 62
- extracted cells: 413,776
- formula cells: 297,002
- dependency graph edges: 3,545,838
- graph diagnostics: 0
- translated formula cells: 297,002
- translation diagnostics: 0
- comparable cached outputs: 281,922
- numeric comparable outputs: 240,124
- text comparable outputs: 41,798
- generated-output matches: 281,922
- mismatches: 0
- non-comparable cached blank formula outputs: 15,080

Timing summary from the clean run:

- extraction: 99.871 seconds
- dependency graph: 63.597 seconds
- formula translation: 58.435 seconds
- contract inference: 41.191 seconds
- Python generation: 9.880 seconds
- generated-model execution: 153.377 seconds
- comparison: 1.211 seconds
- total: 500.477 seconds

## Upstream Modelwright Fix

The first execution attempt exposed a generic generated-runtime semantic gap: bare `VLOOKUP` misses
were raised as Python `LookupError`s. The 2021 workbook needs those misses to propagate as Excel
`#N/A` values in ordinary ranges, while `IFNA` and `IFERROR` still convert error values to their
fallbacks.

Modelwright PR #204 merged that upstream fix to `main` at `c3734d3`. The validated 2021 generated
source was regenerated after applying that generator semantic.

## Claim Boundary

This evidence supports the tracked 2021 compressed generated model for the public 2021 FABLE-C
workbook. It does not establish arbitrary country-calculator support, production readiness, FABLE-P
Canada equivalence, or stable public API compatibility.
