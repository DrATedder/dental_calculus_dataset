#!/bin/sh

### Change parameters to fit with your system. These will be unnecessar if you do not use a job submission system.
#SBATCH --job-name=fastqc 
#SBATCH --account=  ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00

### Change these directories to something appropriate
INPUT_DIRECTORY=/path/to/RAW_data
OUTPUT_DIRECTORY=/path/to/output_directory

### Assumes fastq files are named according to a standard convention
for file in ${INPUT_DIRECTORY}/*fastq.gz
do
  anvio fastqc -o ${OUTPUT_DIRECTORY} -t ${SLURM_CPUS_PER_TASK} ${file}
done
