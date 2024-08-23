#!/bin/sh

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
#SBATCH --job-name=bbduk_decontamination
#SBATCH --account= ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=8
#SBATCH --time=4:00:00

### Change these directories to something appropriate
TRIMMED_DIRECTORY=/path/to/trimmed_data
DECONTAM_OUTPUT=/path/to/decontam_output_directory


for file in ${TRIMMED_DIRECTORY}/*_fastp_trimmed_*.fastq.gz
do
   name=$(basename ${file} _fastp_trimmed_*.fastq.gz)
   echo $name
   ### 'ref' can be one or multiple comma separated fastq.gz containing reads from lab/extraction blanks.
   bbduk.sh in=${file} out=${DECONTAM_OUTPUT}/${name}_decontam.fastq.gz outm=${DECONTAM_OUTPUT}/${name}_matched.fastq.gz ref=/path/to/modern_contaminates k=25 qhist=1 stats=stats.txt t=${SLURM_CPUS_PER_TASK} -Xmx180g
done
