#!/bin.bash

mkdir 07_identify

# we will run abricate to search for antimicrobial and virulence genes
abricate 05_final_assembly/final_assembly.fasta > 07_identify/amr.summary.tab

# we will also run mlst to sequence type the strain
mlst --csv 05_final_assembly/final_assembly.fasta > 07_identify/mlst.csv