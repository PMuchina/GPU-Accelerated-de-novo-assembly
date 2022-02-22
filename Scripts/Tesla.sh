
#!/usr/bin/env bash
#SBATCH -p batch
#SBATCH -J cudamapper
#SBATCH -n 4

#SBATCH --gres=gpu:v100:1


# load the cudamapper module

module load genomeworks/git-baab5668

# run the cudamapper with 4 CPU threads (cores)

cudamapper /home/pkimani/Data/Ukraine/SRR9719895.unmapped.choped.fastq /home/pkimani/Data/Ukraine/SRR9719895.unmapped.choped.fastq > SRR9719895.paf

