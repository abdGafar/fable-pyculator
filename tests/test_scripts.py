from __future__ import annotations

import os
import subprocess
from pathlib import Path


def test_bootstrap_dev_env_script_documents_vscode_kernel() -> None:
    script = Path("scripts/bootstrap_dev_env.sh")

    result = subprocess.run(
        [str(script), "--help"],
        check=True,
        capture_output=True,
        text=True,
    )

    assert os.access(script, os.X_OK)
    assert ".venv" in result.stdout
    assert "VSCode notebook kernel" in result.stdout
    assert "[dev,notebook,docs]" not in result.stdout
