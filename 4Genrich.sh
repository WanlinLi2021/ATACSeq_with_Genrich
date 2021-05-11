#!/bin/bash
#SBATCH --account=
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=100G
#SBATCH --ntasks-per-node=5
#SBATCH --time=10:00:00

module purge 2>/dev/null
module load StdEnv/2020
module load mugqic/samtools/1.10
module load mugqic/java
cd $SLURM_SUBMIT_DIR

samtools sort -n \
-O SAM \
-o ../541_sorted_byname.sam \
../../results/bowtie2/541.bam \
&> sort_byname_541.sh.log

./Genrich -t ../541_sorted_byname.sam \
-o ../541_narrowPeak  \
-j \
-f ../541.log  -r  -x  -q 0.05  -a 20.0  -v  \
-e MT \
-E /home/wanlin/projects/def-makarenk/wanlin/atacseq/scripts/shiftAndRmblackList/mm10.blacklist.bed.gz