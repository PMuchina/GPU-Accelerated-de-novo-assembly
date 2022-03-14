#!/usr/bin/env bash
#SBATCH -p batch
#SBATCH -J Mini_PK
#SBATCH -n 16

# load the minimap2 module

module load minimap2/2.13

# run the minimap2 with 16 CPU threads (cores)
#mapping the Ukranian reads on the ref genome

minimap2 -ax map-ont {Ref} {file} > {file}.sam

#load samtools

module load samtools/1.11

#converting sam to bam

samtools view -O BAM {file}.sam -o {file}.bam

#filter unmapped reads

samtools view -b -f 4 {file}.bam  > {file}.unmapped.bam

#extract the fastq sequence

samtools fastq -0 {file}.unmapped.fastq  {file}.unmapped.bam

#compress

gzip {file}.unmapped.fastq