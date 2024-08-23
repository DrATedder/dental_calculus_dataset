#!/bin/sh

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
#SBATCH --job-name=centrifuge_OTU_assign
#SBATCH --account= ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=20
#SBATCH --time=12:00:00

### Change these directories to something appropriate
PAIRED_INPUT=/path/to/paired_reads
CENT_OUTPUT=/path/to/centrifuge_output_files

### Assumes fastq files are named according to a standard convention used in other scripts in this workflow
for file in ${PAIRED_INPUT}/*_1_paired.fastq.gz
   do
   name=$(basename ${file} _1_paired.fastq.gz)
   echo $name
   centrifuge -p $SLURM_CPUS_PER_TASK -x /storage02/data/centrifuge-dbs/park-et-al-2020/hpvc -1 ${PAIRED_INPUT}/${name}_1_paired.fastq.gz -2 ${PAIRED_INPUT}/${name}_2_paired.fastq.gz -S ${CENT_OUTPUT}/${name}_centrifugeOutputs.txt --report-file ${CENT_OUTPUT}/${name}_centrifugeReport.txt
done
