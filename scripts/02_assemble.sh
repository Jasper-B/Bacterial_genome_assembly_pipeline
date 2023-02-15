#!/bin/bash

#run SPAdes
mkdir 03_assembly
spades.py --careful -o 03_assembly -1 01_raw_reads/*_1.fastq.gz -2 01_raw_reads/*_2.fastq.gz

# quality control of the assembly with Quast
mkdir 04_QC_assembly
quast.py -o 04_QC_assembly -R reference_genome.fasta 03_assembly/scaffolds.fasta