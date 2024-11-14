# Bulk RNA-seq Analysis Pipeline

A step-by-step analysis pipeline for RNA-seq data from the [Talbot Lab](https://www.jhimmylab.org/).

We used the [nf-core RNA-seq pipeline](https://nf-co.re/rnaseq/3.17.0/) to process our reads and obtain our counts. Below, we outline the major steps in the analysis pipeline. To get a more detailed explanation of the pre-processing steps, please refer to the nf-core website provided.

## Table of Contents
- [Introduction](#introduction)
- [Inputs](#inputs)
- [Quality Control](#quality-control)
- [Removal of Ribosomal RNA](#removal-of-ribosomal-rna)
- [Alignment](#alignment)
- [Quantification](#quantification)
- [Outputs](#outputs)
- [Filtering Reads](#filtering-reads)
- [Normalization](#normalization)
- [Differential Expression Analysis](#differential-expression-analysis)

## Introduction
This pipeline uses a Nextflow pipeline to process RNA-seq data, align reads to a reference genome and perform quantification, quality control for downstream differential expression analysis. The pipeline is fully customizable, allowing users to adjust the parameters to suit their experimental design.
![nf-core-rnaseq_metro_map_grey_animated](https://github.com/user-attachments/assets/2dc01173-eecb-4c69-b6a4-ca1a24981191)

To run this Nextflow pipeline, both a configuration file and a shell script are required. 

The configuration file defines the parameters and environment settings for the pipeline, such as resource allocation (memory, CPUs, and queue settings for each process), execution profiles (defines different configurations for local, cluster, or cloud-based execution), and parameters (sets reference genome paths, file paths, and output directories). By separating these from the core pipeline logic, the configuration file allows for flexibility and reusability. You can change how the pipeline runs in different environments (e.g., HPC vs. local execution) without altering the main pipeline script. 

The shell script is the core pipeline code and contains process definitions (steps of pipeline, inputs, outputs), workflow logic (order in which processes run and how data flows between them, enabling management of job dependencies), and execution of commands (each process in this script specifies the shell commands such as fastqc, hisat2, and featureCounts that need to be executed). In summary, the shell script acts as the workflow controller—it contains the main logic and controls how the different components are executed in sequence or in parallel, whereas the config file tunes the pipeline for the particular resources and parameters you need.

## Inputs
1. Prepared samplesheet (csv file) that contains:
| sample | fastq_1 | fastq_2 | strandedness |
|--------|---------|---------|--------------|
| sample id | /path/to/R1.fastq | /path/to/R2.fastq/ | forward, reverse, or auto

2. Reference genome (fasta file)
3. Gene annotation (gtf file)

## Quality Control 
Quality control in a crucial step for ensuring the reliability and accuracy of the data before moving into downstream analyses. Performing quality control allows potential issues in the data to be caught early on. 

[FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) is a quality control tool that generates reports for each FastQ file. It provides an overview of the quality of reads in FastQ files and highlights potential issues. The reports contain basic statistics, per base quality socres, per sequence quality scores, per base sequence content, per sequence GC content, per base N content, sequence length distribution, sequence duplication levels, overrepresented sequences, and adapter content. 

[Trim Galore!](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/) is the default tool used to perform quality and adapter trimming on FastQ files. Upon trimming, FastQC is ran again to evaluate improvements in the quality of reads.

[SortMeRNA](https://github.com/sortmerna/sortmerna) is a tool designed to filter ribosomal RNA (rRNA) reads from RNA-seq data, allowing users to focus on the non-rRNA portion of the data, which typically contains the desired mRNA, lncRNA, and other non-coding RNAs. 

## Alignment

## Quantification

## Outputs

## Filtering Reads 

## Normalization

## Differential Expression Analysis
