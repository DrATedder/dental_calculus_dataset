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
