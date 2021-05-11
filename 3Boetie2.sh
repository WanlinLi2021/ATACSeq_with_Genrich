#!/bin/bash
#SBATCH --account=
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=100G
#SBATCH --ntasks-per-node=5
#SBATCH --time=10:00:00

module purge 2>/dev/null
module load mugqic/bowtie2/2.3.5
module load mugqic/samtools/1.10
module load mugqic/java
cd $SLURM_SUBMIT_DIR

bowtie2 \
--very-sensitive \
-X 1000 \
-x /cvmfs/ref.mugqic/genomes/species/Mus_musculus.GRCm38/genome/bowtie2_index/Mus_musculus.GRCm38 \
-1 /home/wanlin/projects/def-makarenk/wanlin/atacseq/results/trim/clean_SRR11687541_1.fq.gz \
-2 /home/wanlin/projects/def-makarenk/wanlin/atacseq/results/trim/clean_SRR11687541_2.fq.gz \
1> /home/wanlin/projects/def-makarenk/wanlin/atacseq/results/bowtie2/541.sam \
2> 541.sh.log

samtools view -hbS /home/wanlin/projects/def-makarenk/wanlin/atacseq/results/bowtie2/541.sam \
1> /home/wanlin/projects/def-makarenk/wanlin/atacseq/results/bowtie2/541.bam \
2>> 541.sh.log

rm /home/wanlin/projects/def-makarenk/wanlin/atacseq/results/bowtie2/541.sam \
2>> 541.sh.log
