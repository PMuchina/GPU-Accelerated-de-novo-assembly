# GPU-Accelerated-de-novo-assembly

## Table of contents

* [Introduction](#introduction)
* [Requirements](#requirements)
* [GPU platforms](#gpu-platforms)
* [Method](#method)
* [Results](#results)
* [License](#license)



## Introduction

Advances in DNA sequencing has enabled the rapid analysis of genomes, driving biological discovery. However, sequencing of complex genomes, which are very large and have a high content of repetitive sequences or many copies of similar sequences, still remains a great challenge. With improvements in long-read sequencing however, it is easier to generate high-quality sequences for complex genomes. The Overlap Layout Consensus algorithm (OLC) is best suited for long-read sequencing technologies like PACBIO and ONT. Incorporating GPUs which offer a higher computational power via their parallel capabilities speeds up the process of long-read *de novo* assembly. 

We developed a pipeline that accerelates the overlap step using [Cudamapper](https://github.com/clara-parabricks/GenomeWorks). An all-vs-all overlapper GPU accelerated library optimised for long reads. [Miniasm](https://github.com/lh3/miniasm) is a very fast OLC-based de novo assembler for noisy long reads. It takes all-vs-all read self-mappings from Cudamapper as input and outputs an assembly graph in the GFA format. Different from mainstream assemblers, miniasm does not have a consensus step. We therefore use two alternatives: [Cudapoa](https://github.com/clara-parabricks/GenomeWorks) which is GPU accerated or [Minipolish](https://github.com/rrwick/Minipolish) for the consensus step. 


<p align="center"><img src="Images/pipeline.png" alt="Pipeline" width="2000" height="800"></p>

## Requirements

* [Cudamapper](https://github.com/clara-parabricks/GenomeWorks)
* [Miniasm](https://github.com/lh3/miniasm) 
* [Minipolish](https://github.com/rrwick/Minipolish)
* [minimap2](https://github.com/lh3/minimap2)
* [Racon](https://github.com/isovic/racon)
* 

## GPU-Platforms 

#### Jetson nano
![alt Jetson nano](https://cdn.shopify.com/s/files/1/0066/9686/1780/products/Jatson_Nano_2_da68bde9-0d42-4949-86e8-c4fccb83c015_800x.jpg?v=1561185723)

#### Geforce RTX 2070
![alt Geforce RTX 2070](https://cdn.mos.cms.futurecdn.net/Sjm3NxT48N8qVupQerfKhg.jpg)

## Method



## Results

![](https://cdn.mathpix.com/snip/images/HmYmTGoJFNWdwW3LZ_AH4uX4_x1skTVJsuyIheb0XOM.original.fullsize.png)

![](https://cdn.mathpix.com/snip/images/gAmkpBFObJ9_w3ca11xiDV4z8vxLVX0O-Le1TAexxVM.original.fullsize.png)

![](https://cdn.mathpix.com/snip/images/qrjZ66sNDiafP9fNmIbxEVILDsYUSdYAyTPksrQzAvo.original.fullsize.png)



## License

[MIT License](https://choosealicense.com/licenses/mit/)

