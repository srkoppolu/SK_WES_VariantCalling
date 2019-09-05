# SK_WES_VariantCalling
A Whole Exome Sequencing (WES) pipeline for Variant Calling analysis.

The basic steps involved in this pipeline can be divided into three blocks [[source](https://bio-protocol.org/bio101/e2805)]:


1. **NGS Data Pre-Processing**
    * Obtain raw reads
    * [Quality Check using FastQC](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-1:-Pre-Processing-the-raw-NGS-data#quality-check-using-fastqc)
    * [Alignment of mapped reads with a reference genome using Bowtie2](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-1:-Pre-Processing-the-raw-NGS-data#alignment-of-mapped-reads)
2. **Variant Discovery**
    * [Convert SAM files to BAM files (using samtools)](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-2:-Variant-Discovery#convert-sam-files-to-bam-files)
    * [Sort BAM files for faster processing](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-2:-Variant-Discovery#sort-bam-files-for-faster-processing)
    * [Index BAM files to remove unwanted alignment](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-2:-Variant-Discovery#index-bam-files-to-remove-unwanted-alignment)
    * [Pileup BAM files for multiple samples](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-2:-Variant-Discovery#pileup-bam-files-for-multiple-samples)
3. **Variant Prioritization**
    * [Variant calling for germline variants and indels](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-3:-Variant-Prioritization#variant-calling-for-germline-variants-and-indels)
    * [Filter variants to remove false positive indels and SNPs](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-3:-Variant-Prioritization#filter-variants-to-remove-false-positive-indels-and-snps)
    * [Quality check for variants](https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-3:-Variant-Prioritization#quality-check-for-variants)
    * [Annotation] (https://github.com/srkoppolu/SK_WES_VariantCalling/wiki/Step-3:-Variant-Prioritization#annotation)
    * [Filter candidates]()
