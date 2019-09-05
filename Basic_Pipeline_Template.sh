#!/usr/bin/bash


# bash script for Whole Exome Sequencing - Variant Calling



# STEP 1: NGS data pre-processing and Variant Discovery

# FastQC for quality control of raw sequences
./fastqc ~/samples/sample1.fastq

# Index human genome using bowtie2
./bowtie2-build --u 10 indexes/references/reference.fq reference

# Align paired-end reads using bowtie2 (-2 option may be removed for single-end sequences)
/bowtie2 -x reference_filename -1 path/filename1 -2 path/filename2 > filename.sam

# Convert SAM files to BAM files
~/samtools view -bS sample1.sam > sample1.bam

# Sort the BAM file 
~/samtools sort sample1.bam sample1.sorted

# Index sorted BAM files to the reference genome
~/samtools index sample1.sorted.bam

# Pileup all samples
~/samtools mpileup -E -uf reference.fa sample1.bam > sample1.mpileup



# STEP 2: Variant Calling

# SNV calling using VarScan mpileup2snp protocol (for germline variants)
java –jar VarScan.jar mpileup2snp sample.mpileup > sample.varScan.snp

# Indel calling using VarScan mpileup2indels protocol (for detecting insertions/deletions)
java –jar VarScan.jar mpileup2indel sample.mpileup > sample.varScan.indel

# Variant Filtering to identify SNV and indels with higher confidence. 
java –jar VarScan.jar filter sample.varScan.snp –-indel-file sample.varScan.indel –-output-file sample.varScan.snp.filter
java –jar VarScan.jar filter sample.varScan.indel –-output-file sample.varScan.indel.filter
java –jar VarScan.jar readcounts sample.mpileup.sam > sample.mpileup.readcounts



# STEP 3: Downstream Analyses

# Generate VCF/BCF file which stores variant calling data (both SNPs and indels)
samtools mpileup -uf sample.sorted.bam | bcftools view - > sample.var.raw.bcf
bcftools view sametools.var.raw.bcf | vcfutils.pl varFilter -D100 > sample.var.flt.vcf
samtools calmd -Abr sample.sorted.bam ~/hg38/hg38.fa > sample.baq.bam
samtools mpileup -uf ~/hg38/hg38.fa sample.baq.bam | bcftools view - > sample.baq.var.raw.bcf
 

