Reference Artifacts
===================

The public FABLE Calculator documentation PDF is tracked under
``reference/fable-calculator/``. The Excel workbooks are public benchmark inputs but are kept under
ignored ``tmp/private-workbooks/`` paths so the repository does not redistribute workbook binaries.

Downloaded local artifacts in this environment:

.. list-table::
   :header-rows: 1

   * - Artifact
     - Local path
     - Role
   * - FABLE Calculator documentation PDF
     - ``reference/fable-calculator/210108_FABLECalculator_Documentation_final_clean.pdf``
     - tracked reference document
   * - ``2019_Open_FABLECalculator.xlsx``
     - ``tmp/private-workbooks/2019_Open_FABLECalculator.xlsx``
     - older broken-reference regression and fragility check
   * - ``2020_Open_FABLECalculator.xlsx``
     - ``tmp/private-workbooks/2020_Open_FABLECalculator.xlsx``
     - primary wrapper benchmark
   * - ``2021_Open_FABLECalculator.xlsx``
     - ``tmp/private-workbooks/2021_Open_FABLECalculator.xlsx``
     - later generalizability check

Source URLs and checksums are recorded in ``reference/fable-calculator/README.md`` and
``benchmarks/fable-calculator/manifest.json``.

VSCode Environment Bootstrap
----------------------------

Test users should create a repo-local virtual environment from the ``fable-pyculator`` repository
root:

.. code-block:: bash

   scripts/bootstrap_dev_env.sh

This installs development, notebook, and documentation dependencies into ``.venv``. In VSCode,
select ``.venv/bin/python`` as the notebook kernel before running tracked notebooks under
``examples/notebooks/``.
