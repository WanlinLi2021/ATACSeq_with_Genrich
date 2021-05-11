#!/bin/bash
#SBATCH --account=
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=5G
#SBATCH --ntasks-per-node=3
#SBATCH --time=1:00:00

module purge 2>/dev/null
module load mugqic/homer/4.11

cd $SLURM_SUBMIT_DIR

findMotifsGenome.pl \
./diff_Genrich_forHomer.bed \
mm10 \
../../results/motif_genrich \
-size 150 \
-preparsedDir . \
&> findMotifs_genrich.sh.log