
# Quality control of raw sequencing reads

## 1. Objective

Quality control was performed to assess the quality of raw paired-end sequencing reads before proceeding with downstream genome analysis.

## 2. Input data

The sequencing data were obtained from NCBI SRA:

- **Accession:** SRR35889594
- **Sequencing platform:** DNBSEQ-T7
- **Read configuration:** Paired-end
- **Read length:** 150 bp

Input files:

- `SRR35889594_1.fastq`
- `SRR35889594_2.fastq`

## 3. Method

FastQC was used to evaluate the quality of the raw sequencing reads.

The analysis was performed using the following parameters:

- Threads: 8
- Input: Paired-end FASTQ files

The commands used for this analysis are documented in:

[`scripts/04_quality_control.sh`](../scripts/04_quality_control.sh)

## 4. Results

FastQC generated quality control reports for both R1 and R2.

The reports are available below:

- [FastQC report – R1](../results/SRR35889594_1_fastqc.html)
- [FastQC report – R2](../results/SRR35889594_2_fastqc.html)

### 4.1 Comparison of R1 and R2
Both paired-end FASTQ files contained 189,312,838 reads and approximately 28.2 Gbp of sequence data. The reported sequence length ranged from 31 to 150 bp, with a mean length of 149 bp and a median length of 150 bp. Both files also showed an overall GC content of 41%.

The two reports produced identical module-level assessment patterns, with eight PASS modules and two WARNING modules.

### 4.2 Modules passing FastQC
Both R1 and R2 passed the following modules:Basic Statistics, Per base sequence quality, Per sequence quality scores, Per base sequence content, Per sequence GC content, Per base N content, Overrepresented sequences, Adapter Content

These results indicate that both read files met FastQC's assessment criteria for the corresponding quality and sequence-composition parameters. No significant adapter contamination or overrepresented sequences were detected by the respective modules.
### 4.3 Modules requiring further investigation
Sequence length distribution: Both files received a warning due to variable read lengths ranging from 31 to 150 bp. Despite this variation, the median read length was 150 bp and the mean was 149 bp, suggesting that most reads retained the expected sequencing length.
Sequence duplication levels: Both files received a warning for sequence duplication levels. Duplicate sequences may originate from genomic repetitive regions, high sequencing depth, or PCR amplification during library preparation.

### 4.4O verall assessment

The paired-end dataset demonstrated an overall acceptable sequencing quality profile. Both R1 and R2 passed eight out of ten FastQC modules, with warnings limited to sequence length distribution and sequence duplication levels.

The matching read counts, sequence-length statistics, and GC content indicate consistency between the two FASTQ datasets. The earlier comparison of the first and last read identifiers also supports the consistency of the conversion process.

## 5. Conclusion

The FastQC results indicate that the raw sequencing reads have high base quality. Aggressive quality trimming, adapter trimming, and duplicate removal are not indicated.


## 6. Next step

Proceed with genome survey analysis using k-mer analysis to estimate genome characteristics.

