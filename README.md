# GPU-Accelerated-de-novo-assembly

## Table of contents

* [Introduction](#introduction)
* [Requirements](#requirements)
* [GPU platforms](#gpu-platforms)
* [Method](#method)
* [Results](#results)
* [License](#license)



## Introduction

Advances in DNA sequencing has enabled the rapid analysis of genomes, driving biological discovery. However, sequencing of complex genomes, which are very large and have a high content of repetitive sequences or many copies of similar sequences, still remains a great challenge. With improvements in long-read sequencing however, it is easier to generate high-quality sequences for complex genomes. The Overlap Layout Consensus algorithm (OLC) is best suited for long-read sequencing technologies like [PacBio](https://www.pacb.com/smrt-science/smrt-sequencing/) and [ONT](https://nanoporetech.com/applications/dna-nanopore-sequencing). Incorporating general-purpose [Graphics Processing Units](https://pubmed.ncbi.nlm.nih.gov/27402792/)(GPUs) which offer a higher computational power via their parallel capabilities speeds up the process of long-read *de novo* assembly. 

We developed a pipeline that accerelates the overlap step using [Cudamapper](https://github.com/clara-parabricks/GenomeWorks). An all-vs-all overlapper GPU accelerated library optimised for long reads. [Miniasm](https://github.com/lh3/miniasm) is a very fast OLC-based de novo assembler for noisy long reads. It takes all-vs-all read self-mappings from Cudamapper as input and outputs an assembly graph in the GFA format. Different from mainstream assemblers, miniasm does not have a consensus step. We therefore use two alternatives: [Cudapoa](https://github.com/clara-parabricks/GenomeWorks) which is GPU accerated or [Minipolish](https://github.com/rrwick/Minipolish) for the consensus step. 


<p align="center"><img src="Images/pipeline.png" alt="Pipeline" width="2000" height="800"></p>

## Requirements

* [Cudamapper](https://github.com/clara-parabricks/GenomeWorks)
* [Miniasm](https://github.com/lh3/miniasm) 
* [Minipolish](https://github.com/rrwick/Minipolish)
* [minimap2](https://github.com/lh3/minimap2)
* [Racon](https://github.com/isovic/racon)
* [Cudapoa](https://github.com/clara-parabricks/GenomeWorks) 

## GPU-Platforms 

#### Jetson nano
![alt Jetson nano](https://cdn.shopify.com/s/files/1/0066/9686/1780/products/Jatson_Nano_2_da68bde9-0d42-4949-86e8-c4fccb83c015_800x.jpg?v=1561185723)

#### Geforce RTX 2070
![alt Geforce RTX 2070](https://cdn.mos.cms.futurecdn.net/Sjm3NxT48N8qVupQerfKhg.jpg)

## Method

To test the pipeline, we used the [African Swine Fever Virus (ASFV)](https://mra.asm.org/content/9/44/e00948-20) genome which is double stranded with a size of 170 to 194 kbp. Data used was from a Virulent African Swine Fever Virus from a Domestic Pig in Ukraine under the SRA accession number [SRX6477592](https://www.ncbi.nlm.nih.gov/sra/SRX6477592[accn]). The preprocess step involved mapping the reads to the Sus scrofa 11 reference genome [GCA_000003025](https://www.ncbi.nlm.nih.gov/assembly/?term=GCF_000003025) to remove reads likely originating from the host. [minimap2](https://github.com/lh3/minimap2) map long noisy genomic reads was used at this step. The SAM output was converted to BAM using [Samtools](http://www.htslib.org/). Umapped reads were filtered out using samtools and converted to fastq format. [Porechop](https://github.com/rrwick/Porechop) was used to trim adaptors discard and sequences with middle adapters. The chopped unmapped fastq reads were used as the input in the pipeline.


## Results

![](https://cdn.mathpix.com/snip/images/HmYmTGoJFNWdwW3LZ_AH4uX4_x1skTVJsuyIheb0XOM.original.fullsize.png)

![](https://cdn.mathpix.com/snip/images/gAmkpBFObJ9_w3ca11xiDV4z8vxLVX0O-Le1TAexxVM.original.fullsize.png)

![](https://cdn.mathpix.com/snip/images/qrjZ66sNDiafP9fNmIbxEVILDsYUSdYAyTPksrQzAvo.original.fullsize.png)



## License

[MIT License](https://choosealicense.com/licenses/mit/)

