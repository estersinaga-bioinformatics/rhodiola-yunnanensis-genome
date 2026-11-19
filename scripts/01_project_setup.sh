#!/bin/bash

# Project: Rhodiola yunnanensis genome analysis
# Workstation setup

# 1. Create project directories
mkdir -p ~/projects/rhodiola_yunnanensis/{metadata,reference,published_annotation,raw/dnbseq,raw/ont,raw/hic,raw/rnaseq,work/qc,work/kmer,work/assembly,work/annotation,results,logs,scripts,docs}

# 2. Create software environment
conda activate base

mamba create -n rhodiola_intro \
    fastqc \
    multiqc \
    seqkit \
    sra-tools \
    jellyfish \
    nanoplot \
    pigz \
    entrez-direct \
    -c conda-forge \
    -c bioconda \
    -y

# 3. Activate environment
conda activate rhodiola_intro

# 4. Verify installations
fastqc --version
multiqc --version
seqkit version
fasterq-dump --version
jellyfish --version
