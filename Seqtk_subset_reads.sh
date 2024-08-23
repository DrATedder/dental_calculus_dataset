#!/bin/sh

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
#SBATCH --job-name=seqtk_subset
#SBATCH --account= ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=4
#SBATCH --time=08:00:00

### Change these directories to something appropriate
PAIRED_INPUT=/path/to/paired_reads
HUMAN_OUT=/path/to/human_subset_reads
CENT_OUTPUT=/path/to/centrifuge_output_files

### Assumes fastq files are named according to a standard convention used in other scripts in this workflow
for file in ${CENT_OUTPUT}/*_human_reads.txt  
   do
   name=$(basename ${file} _human_reads.txt)
   echo $name
   seqtk subseq ${DECONTAM}/${name}_1_paired.fastq.gz ${CENT_OUTPUT}/${name}_human_reads.txt|gzip -> ${HUMAN_OUT}/${name}_postCentrifuge_R1.fastq.gz
   seqtk subseq ${DECONTAM}/${name}_2_paired.fastq.gz ${CENT_OUTPUT}/${name}_human_reads.txt|gzip -> ${HUMAN_OUT}/${name}_postCentrifuge_R2.fastq.gz
done
