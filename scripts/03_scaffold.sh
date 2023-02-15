#!/bin.bash

mkdir 05_final_assembly
# use ragtag to scaffold to the reference genome
ragtag.py scaffold reference_genome.fasta 03_assembly/scaffolds.fasta -o 05_final_assembly

# rename to 'final assembly'
mv 05_final_assembly/*fasta 05_final_assembly/final_assembly.fasta

# run Quast again to see the final assembly
mkdir 06_QC_final_assembly
quast.py -o 06_QC_final_assembly -R reference_genome.fasta 05_final_assembly/final_assembly.fasta