#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PYTHON_BIN="${PYTHON:-python3}"
VENV_DIR="${VENV_DIR:-"$ROOT_DIR/.venv"}"

usage() {
  cat <<EOF
Usage: scripts/bootstrap_dev_env.sh

Creates or updates a repo-local .venv and installs FABLE Pyculator in editable
development mode with dev, notebook, and docs dependencies.

Environment variables:
  PYTHON    Python executable used to create .venv. Defaults to python3.
  VENV_DIR  Virtual environment path. Defaults to .venv under the repo root.

After this finishes, select this interpreter as the VSCode notebook kernel:
  $VENV_DIR/bin/python
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ ! -d "$VENV_DIR" ]]; then
  "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

"$VENV_DIR/bin/python" -m pip install --upgrade pip
"$VENV_DIR/bin/python" -m pip install -e "${ROOT_DIR}[dev,notebook,docs]"

cat <<EOF
FABLE Pyculator development environment is ready.

VSCode notebook kernel:
  $VENV_DIR/bin/python

Run checks with:
  $VENV_DIR/bin/python -m ruff check .
  $VENV_DIR/bin/python -m pytest
  $VENV_DIR/bin/sphinx-build -b html docs _build/html -W
  $VENV_DIR/bin/python scripts/verify_docs_theme.py _build/html
  scripts/check_release_artifacts.sh

Verify local workbook artifacts with:
  sha256sum -c benchmarks/fable-calculator/checksums.sha256

Activate manually with:
  source "$VENV_DIR/bin/activate"
EOF
