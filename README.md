# SK_WES_VariantCalling
A Whole Exome Sequencing (WES) pipeline for Variant Calling analysis.

The basic steps involved in this pipeline can be divided into three blocks [[source](https://bio-protocol.org/bio101/e2805)]:

1. NGS Data Pre-Processing
    * Obtain raw reads
    * Quality Check using FastQC
    * Alignment of mapped reads with a reference genome using Bowtie2
2. Variant Discover
    * Convert SAM files to BAM files (using samtools)
    * Sort BAM files for faster processing
    * Index BAM files to remove unwanted alignment
    * Pileup BAM files for multiple samples
    * Filter raw variants and quality check (QC)
3. Variant Prioritization
    * Variant calling for germline variants and indels
    * Filter variants to remove false positive indels and SNPs
    * Quality check for variants
    * Annotation
    * Filter candidates
