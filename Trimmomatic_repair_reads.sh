#!/bin/sh 

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
#SBATCH --job-name=Repair_reads
#SBATCH --account= ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=4
#SBATCH --time=8:00:00

### Change these directories to something appropriate
DECONTAM_FILES=/path/to/decontaminated_reads
PAIRED_OUTPUT=/path/to/paired_output_directory

### Assumes fastq files are named according to a standard convention used in previous scripts
for file in *_1_decontam.fastq.gz
   do
   name=$(basename ${file} _1_decontam.fastq.gz)
   echo $name
   anvio trimmomatic PE -threads ${SLURM_CPUS_PER_TASK} ${DECONTAM_FILES}/${name}_1_decontam.fastq.gz ${DECONTAM_FILES}/${name}_2_decontam.fastq.gz ${PAIRED_OUTPUT}/${name}_1_paired.fastq.gz ${PAIRED_OUTPUT}/${name}_1_unpaired.fastq.gz ${PAIRED_OUTPUT}/${name}_2_paired.fastq.gz ${PAIRED_OUTPUT}/${name}_2_unpaired.fastq.gz MINLEN:20
done
