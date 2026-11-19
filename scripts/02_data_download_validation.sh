
#!/bin/bash

# Project: Rhodiola yunnanensis genome analysis
# Stage 2: Download and validate raw DNBSEQ-T7 reads
# Accession: SRR35889594

set -euo pipefail

PROJECT_DIR="$HOME/projects/rhodiola_yunnanensis"
SRA_DIR="$PROJECT_DIR/raw/dnbseq"
ACCESSION="SRR35889594"
SRA_FILE="$SRA_DIR/$ACCESSION/$ACCESSION.sra"

# 1. Prepare raw data directory
mkdir -p "$SRA_DIR"
cd "$SRA_DIR"

# 2. Check SRA Toolkit
prefetch --version
vdb-validate --version

# 3. Download SRA dataset
prefetch "$ACCESSION" --max-size 100G

# 4. Validate downloaded SRA file
if [[ ! -f "$SRA_FILE" ]]; then
    echo "ERROR: SRA file not found."
    exit 1
fi

vdb-validate "$SRA_FILE"

echo "SRA download and validation completed successfully."
