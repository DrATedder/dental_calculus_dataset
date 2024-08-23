#!/bin/sh

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
#SBATCH --job-name=mapDamage2
#SBATCH --account= ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=20
#SBATCH --time=12:00:00

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
### Make sure your reference genome is appropriately indexed
REF=/path/to/reference_genome
MAPPED_OUTPUT=/path/to/mapped_output

### Assumes fastq files are named according to a standard convention used in other scripts in this workflow
for file in ${MAPPED_OUTPUT}/*_postCentrifuge_Human_pe_rmdup.sorted.bam 
  do
  ### Ensure you correct the reference genome file
  mapDamage -i ${MAPPED_OUTPUT}/${file} -r ${REF}/specific_reference_genome_file.fna
done
