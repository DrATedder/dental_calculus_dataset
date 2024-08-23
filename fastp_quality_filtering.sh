#!/bin/sh

### Change parameters to fit with your system. These will be unnecessar if you do not use a job submission system.
#SBATCH --job-name=fastp
#SBATCH --account= ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00

### Change these directories to something appropriate
INPUT_DIRECTORY=/path/to/RAW_data
OUTPUT=/path/to/trimmed_output
REPORT=/path/to/report_output

### Assumes fastq files are named according to a standard convention. In this case, both R1 & R2 reads of each pair must be otherwise identically named.
for file in ${INPUT_DIRECTORY}/*_R1.fastq.gz
do
   name=$(basename ${file} _R1.fastq.gz)
   echo $name
   fastp -i ${INPUT_DIRECTORY}/${name}_R1.fastq.gz -I ${INPUT_DIRECTORY}/${name}_R2.fastq.gz -o ${OUTPUT}/${name}_fastp_trimmed_1.fastq.gz -O ${OUTPUT}/${name}_fastp_trimmed_2.fastq.gz -h ${REPORT}/${name}.html 
done 
