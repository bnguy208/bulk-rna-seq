#!/bin/bash

#SBATCH --job-name=nfcore_rnaseq
#SBATCH --output=nfcore_rnaseq_%j.out
#SBATCH --error=nfcore_rnaseq_%j.err
#SBATCH --time=10:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --partition=campus-new
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=bnguyen3@fredhutch.org

set -euo pipefail

# Nextflow Version
NXF_VER=23.04.0

# Nextflow Configuration File
NXF_CONFIG=/home/bnguyen3/Projects/nextflow.slurm.config

# Workflow to Run (e.g. GitHub repository)
WORKFLOW_REPO=nf-core/rnaseq

# Workflow-Specific Options
SAMPLESHEET=SN050_samplesheet.csv
OUTPUT_FOLDER=/home/bnguyen3/Projects/Project_jhtalbot/Results
GENOME_REF=/shared/biodata/reference/iGenomes/Mus_musculus/Ensembl/GRCm38/Sequence/WholeGenomeFasta/genome.fa
GTF_FILE=/shared/biodata/reference/iGenomes/Mus_musculus/Ensembl/GRCm38/Sequence/STARIndex/genes.gtf 

# Load the Nextflow module (if running on rhino/gizmo)
ml Nextflow

# Load the Apptainer module (if running on rhino/gizmo with Apptainer)
ml Apptainer

# Make sure that the apptainer executables are in the PATH
export PATH=$APPTAINERROOT/bin/:$PATH

# Run the workflow
NXF_VER=$NXF_VER \
nextflow \
    run \
    -c ${NXF_CONFIG} \
    ${WORKFLOW_REPO} -latest \
    --input $SAMPLESHEET \
    --outdir $OUTPUT_FOLDER \
    --email bnguyen3@fredhutch.org \
    --fasta $GENOME_REF \
    --gtf $GTF_FILE \
    --skip_umi_extract True \
    --remove_ribo_rna True \
    -with-report nextflow.report.html \
    -resume