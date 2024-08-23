#!/bin/sh

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
#SBATCH --job-name=BWA_mapping
#SBATCH --account= ### add appropriate detail here
#SBATCH --partition=compute
#SBATCH --cpus-per-task=20
#SBATCH --time=12:00:00

### Change parameters to fit with your system. These will be unnecessary if you do not use a job submission system.
### Make sure your reference genome is appropriately indexed
REF=/path/to/reference_genome
HUMAN_OUT=/path/to/human_subset_reads
MAPPED_OUTPUT=/path/to/mapped_output

### Assumes fastq files are named according to a standard convention used in other scripts in this workflow
for file in ${HUMAN_OUTPUT}/*_postCentrifuge_R1.fastq.gz  
  do
  name=$(basename ${file} _postCentrifuge_R1.fastq.gz)
  echo $name
  ### Ensure you correct the reference genome file
  bwa mem -t ${SLURM_CPUS_PER_TASK} -M ${REF}/specific_reference_genome_file.fna ${HUMAN_OUT}/${name}_postCentrifuge_R1.fastq.gz ${HUMAN_OUT}/${name}_postCentrifuge_R2.fastq.gz > ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe.sam 
  samtools view -Sb ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe.sam > ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe.bam
  samtools rmdup ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe.bam ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe_rmdup.bam
  samtools flagstat ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe_rmdup.bam > ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe_rmdup.bam.flagstat
  samtools sort ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe_rmdup.bam -o ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe_rmdup.sorted.bam
  samtools index ${MAPPED_OUTPUT}/${name}_postCentrifuge_Human_pe_rmdup.sorted.bam
done

