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

annotatePeaks.pl \
./diff_Genrich_forHomer.bed \
mm10 -gsize mm10 -cons -CpG \
-go ../../results/homer_diffAnno_Genrich/gene_ontology \
-genomeOntology ../../results/homer_diffAnno_Genrich/genome_ontology \
1> ../../results/homer_diffAnno_Genrich/diff_peaks_Genrich.csv \
2> diff_macs_peaksAnnot.log