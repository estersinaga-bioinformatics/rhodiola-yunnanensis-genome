#!/bin/bash

# Project: Rhodiola yunnanensis genome analysis
# Stage 4: Quality control using FastQC

set -euo pipefail

FASTQ_DIR="/mnt/d/rhodiola_yunnanensis_full_conversion/fastq"
QC_DIR="/mnt/d/rhodiola_yunnanensis_full_conversion/fastqc"

# Prepare QC output directory
mkdir -p "$QC_DIR"

# Check FastQC version
fastqc --version

# Run FastQC on paired-end FASTQ files
fastqc \
    "$FASTQ_DIR/SRR35889594_1.fastq" \
    "$FASTQ_DIR/SRR35889594_2.fastq" \
    --threads 8 \
    --outdir "$QC_DIR"

echo "FastQC analysis completed."
