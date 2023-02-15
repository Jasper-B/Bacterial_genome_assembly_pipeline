#!/bin.bash

# make a new directory for the raw reads
mkdir 01_raw_reads

# ask for SSR filename and write to disk
echo -n "Enter SSR filename: "
read SRR

# prefetch the SSR data
prefetch $SRR --output-directory 01_raw_reads

# find all sra files and write to fastq
find 01_raw_reads/$SRR/*sra | parallel 'fasterq-dump {} --split-files -O 01_raw_reads'

# zip all fastq files
find 01_raw_reads/*fastq | parallel 'pigz {}'

# delete the .sra files
find 01_raw_reads/$SRR/*sra -delete

# delete the unnecessary folder
find 01_raw_reads/$SRR -type d -delete

# quality control of the raw reads
# make a new directory for quality control
mkdir 02_QC_raw_reads

# use fastqc for quality control
fastqc 01_raw_reads/* -o 02_QC_raw_reads

# download the reference genome
# first get the scientific name
name=$(esearch -db sra -query $SRR | efetch -format runinfo -mode xml \
| xtract -pattern SraRunInfo -element ScientificName)
echo "Download the reference genome for ${name} and rename to 'reference_genome.fasta'"