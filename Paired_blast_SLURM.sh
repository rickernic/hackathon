#!/bin/bash

#SBATCH --job-name="MERGEM_blast"                # name of the job submitted
#SBATCH -p short                                        # name of the queue you are submitting to
#SBATCH -N 1                                            # number of nodes in this job
#SBATCH -n 40                                           # number of cores/tasks in this job, you get all 20 cores with 2 threads per core with hyperthreading
#SBATCH -t 48:00:00                                     # time allocated for this job hours:mins:seconds
#SBATCH --mail-user=rickernic@gmail.coom                # enter your email address to receive emails
#SBATCH --mail-user=rickernic@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL                      # will receive an email when job starts, ends or fails
#SBATCH -o "stdout.%j.%N"                               # standard out %j adds job number to outputfile name and %N adds the node name
#SBATCH -e "stderr.%j.%N"                               # optional but it prints our standard error

# ENTER COMMANDS HERE:

#NOTE: this is the sample SLURM that I made for bioinformatics club, not my original file used in the analysis

TRIMMED_READS_PATH=/home/nicole.ricker/fsep_004_link/nricker/FS1_Ricker/hiSeq_plasmidome/raw/Lane1

source /etc/profile.d/modules.sh
module load blast+
module load parallel
module load python_2/gcc/64/2.7.12

#converting fastq to fasta

#for x in $TRIMMED_READS_PATH/*_L1-?_pe; do echo "python fastq-to-fasta.py $x > $x.fa"; done >> make_fasta.sh
#cat make_fasta.sh | parallel

#run blast

#for x in $TRIMMED_READS_PATH/*_pe.fa; do echo "blastn -db Mergem_named.fasta -query $x -out $x.Mergem.blastnout -max_target_seqs 1 -evalue 1e-5 -outfmt 6"; done >> blast-Mergem.sh
#cat blast-Mergem.sh | parallel

#get the paired hits

#for x in *L1-1_MERGEM.1hit.blastnout; do echo "python get-paired-hits.py $x ${x%L1*}L1-2_MERGEM.1hit.blastnout > ${x%L1*}L1.Mergem.blast.pairs"; done > get-pairs-Mergem.sh
#cat get-pairs-Mergem.sh | parallel

#count them up in groups

#python count-up.py P24_L1.Mergem.blast.pairs P26_L1.Mergem.blast.pairs P27_L1.Mergem.blast.pairs P28_L1.Mergem.blast.pairs
#mv summary-count.tsv Control.Mergem.counts.tsv

#python count-up.py P29_L1.Mergem.blast.pairs P30_L1.Mergem.blast.pairs P31_L1.Mergem.blast.pairs P33_L1.Mergem.blast.pairs
#mv summary-count.tsv Inject.Mergem.counts.tsv

#python count-up.py P36_L1.Mergem.blast.pairs P37_L1.Mergem.blast.pairs P38_L1.Mergem.blast.pairs P40_L1.Mergem.blast.pairs
#mv summary-count.tsv Infeed.Mergem.counts.tsv
