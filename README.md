# dental_calculus_dataset
A collection of scripts pertaining to quality filtering, decontamination and aDNA authentication steps undertaken in Standeven et al. 2024

## Software pre-requisites

- `FastQC v0.11.9`: Quality control tool for assessing raw read quality (Babraham Bioinformatics, 2019). Can be accessed/downloaded [here](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/).

- `Fastp v0.23.2`: A sequence trimming tool to filter and trim poor quality reads, remove adaptor sequences and repair mismatched paired end reads [(Chen et al. 2018)](https://academic.oup.com/bioinformatics/article/34/17/i884/5093234). Can be accessed/downloaded [here](https://github.com/OpenGene/fastp).

- `BBduk`:  Decontamination using Kmers (Joint Genome Institute 2023). Can be accessed/downloaded [here](https://jgi.doe.gov/data-and-tools/software-tools/bbtools/bb-tools-user-guide/bbduk-guide/).

- `Trimmomatic v0.39`: Performs quality trimming protocols linked to paired end reads [(Bolger et al, 2014)](https://academic.oup.com/bioinformatics/article/30/15/2114/2390096). Can be accessed/downloaded [here](https://github.com/usadellab/Trimmomatic).

- `Seqtk v1.4`: A tool to proccess and manipulate FASTA & FATQ files. Can be accessed/downloaded [here](https://github.com/lh3/seqtk).

- `BWA v0.7.17`: A sequence mapping tool [(Li and Durbin 2009)](http://www.ncbi.nlm.nih.gov/pubmed/19451168). Can be accessed/downloaded [here](https://github.com/lh3/bwa).

- `SAMtools v1.12`: A suite of programmes for interacting with high-throuput sequencing data. Full details, including downloads can be found [here](http://www.htslib.org/).

- `mapDamage2 v2.2.2`: A tool to track and quantify damage patterns in ancient DNA samples [(Jónsson et al. 2013)](http://bioinformatics.oxfordjournals.org/content/early/2013/04/23/bioinformatics.btt193.abstract). Can be accessed and downloaded [here](https://ginolhac.github.io/mapDamage/).

- `Anvi'o`: A multi-omics platform for microbial genomics. Can be accessed/downloaded [here](https://anvio.org/).

  **Note**. It is likely that other versions of these software can be substituted and perfrom adequately. We have **not** tested this though.

## Considerations before beginning

- **Sequence type(s)**: These scripts use paired-end (PE) illumina reads. While the steps *may* work on other data types, it is likely that you will need to tweak the script based on reviewing the documentation whihc packages with each of the software employed here.

- **Job submission system**: Given the likely size of data files being analysed in these steps, we assume you will be using a batch job submission system. Here we will be using [SLURM](https://slurm.schedmd.com/documentation.html). If your system is different, please do take a look through the script to adjust relevant sections. This is mainly relevant for threading of various pipeline elements. For example: `-t ${SLURM_CPUS_PER_TASK}` If you are not using a job submission system, it *may* be possible to simply replace these incidences with an appropriate number of threads linked to your own system.

- **Parameters & assumptions**: Please read closely the manuals for each software. Parameters and thresholds will need to be adapted to suit biological, computational and logic criteria associated with your data/questions.

## Basic workflow

**Quality filtering steps**

- `FastQC`: script name...
- `Fastp`: script name...
- `FastQC`: **Note**. While reassessing reads post trimming & filtering is essential to ensure these steps were successful, we do not provide an adjusted script for this. Script `xx` can be easily adapted for this.

**Decontamination steps**

- `BBduk`: script name...
- `Trimmomatic`: script name...

**aDNA authentication**

- `Seqtk`: script name...
- `BWA mem`: script name...
- `SAMtools`: script name...
- `mapDamage2`: script name...


