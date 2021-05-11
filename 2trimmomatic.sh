#!/bin/bash
#SBATCH --account=
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=8Gb

module purge 2>/dev/null
module load  StdEnv/2020
module load  trimmomatic/0.39
cd $SLURM_SUBMIT_DIR

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar SE -phred33 \
/home/data/SRR11687541_1.fq.gz \
/home/trim/clean_SRR11687541_1.fq.gz \
HEADCROP:17

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar SE -phred33 \
/home/data/SRR11687541_2.fq.gz \
/home/trim/clean_SRR11687541_2.fq.gz \
HEADCROP:17
