
#!/bin/bash

# Project: Rhodiola yunnanensis genome analysis
# Stage 3: Convert SRA to paired-end FASTQ
# Accession: SRR35889594

set -euo pipefail

SRA_FILE="$HOME/projects/rhodiola_yunnanensis/raw/dnbseq/SRR35889594/SRR35889594.sra"

OUTPUT_DIR="/mnt/d/rhodiola_yunnanensis_full_conversion/fastq"
TEMP_DIR="/mnt/d/rhodiola_yunnanensis_full_conversion/tmp"

ACCESSION="SRR35889594"

# Prepare output and temporary directories
mkdir -p "$OUTPUT_DIR" "$TEMP_DIR"

# Check SRA Toolkit
fasterq-dump --version

# Convert SRA to paired-end FASTQ
fasterq-dump "$SRA_FILE" \
    --split-files \
    --outdir "$OUTPUT_DIR" \
    --temp "$TEMP_DIR" \
    -e 8 \
    -p

# Verify output files
R1="$OUTPUT_DIR/${ACCESSION}_1.fastq"
R2="$OUTPUT_DIR/${ACCESSION}_2.fastq"

if [[ ! -f "$R1" || ! -f "$R2" ]]; then
    echo "ERROR: FASTQ output files are missing."
    exit 1
fi

ls -lh "$OUTPUT_DIR"

# Verify read counts
for file in "$R1" "$R2"; do
    echo "Checking $(basename "$file")"

    awk 'END {
        print "Read count:", NR/4
    }' "$file"
done

# Check first and last read IDs
for file in "$R1" "$R2"; do
    echo "===== $(basename "$file") ====="

    echo "First read:"
    head -n 1 "$file"

    echo "Last read:"
    tail -n 4 "$file" | head -n 1
done

echo "FASTQ conversion and verification completed."
