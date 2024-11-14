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

## Quality Control 

## Removal of Ribosomal RNA

## Alignment

## Quantification

## Outputs

## Filtering Reads 

## Normalization

## Differential Expression Analysis
