#!/bin/bash
#SBATCH --account=
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=8Gb

module purge 2>/dev/null
module load mugqic/fastqc/0.11.5
module load mugqic/java
cd $SLURM_SUBMIT_DIR

fastqc --outdir /home/results/fastqc \
/home/data/SRR11687541_1.fq.gz \
&> fastqc_clean_541.1.sh.log

fastqc --outdir /home/results/fastqc \
/home/data/SRR11687541_2.fq.gz \
&> fastqc_clean_541.2.sh.log


