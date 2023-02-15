Project date: 09-02-2023

In this pipeline I will assemble a prokaryotic genome from Illumina paired end reads.

First we will create a new conda environment to install all the dependencies:
```
$ conda env create -f dependencies.yaml
$ conda activate bacterial_genome_assembly_pipeline
```
Next we will download WGS reads from ncbi via their SRR-codes with the base script '01_download_reads.sh'.
I will use 'SRR23409909' in this example.
```
bash scripts/01_download_reads.sh
```

Running the bash file '01_download_reads.sh' downloads the sequence reads from the NCBI SRA archive,
zips the file for lower disk space usage, and generates the quality control files using fastqc.
It also prompts the user to download the reference genome for the organism. In this case Listeria monocytogenes EGDe.

The reads look good and no trimming is necessary.

Now we can assemble the reads with SPAdes by running the '02_assemble.sh' script and look at the resulting contigs.
```
bash scripts/02_assemble.sh
```

Now we can scaffold the contigs with the reference genome with the '03_scaffold.sh' script. This will running
Quast again to look at the final assembly.
```
bash scripts/03_scaffold.sh
```

The final assembly looks very similar to the reference genome with similar GC-content and a total contig 
length of 2,922,676 bp (vs reference genome of 2,944,527 bp)

We can identify the strain by looking whether there are antimicrobial genes or mlst sequence type identifiers with '04_identify.sh'
```
bash scripts/04_identify.sh
```

The assembly and the reference genome can now be annotated with protein names with prokka using '05_annotate.sh'.
```
bash scripts/05_annotate.sh
```

The new genome is now assembled!


Things I learned from this:
- bash scripting to automate bioinformatics tools
- conda environment management