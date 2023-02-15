#!/bin.bash

# we will now annotate the assembly with prokka
prokka --cpus 12 --kingdom Bacteria --locustag strain_x --prefix new --outdir 08_annotation/new_strain \
--addgenes 05_final_assembly/final_assembly.fasta

# we will also annotate the reference genome
prokka --cpus 12 --kingdom Bacteria --locustag reference --prefix ref --outdir 08_annotation/reference_strain \
--addgenes reference_genome.fasta