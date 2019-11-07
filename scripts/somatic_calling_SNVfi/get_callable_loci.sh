#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -M a.vanhoeck@umcutrecht.nl
#$ -m aes
#$ -l h_vmem=20G
#$ -l h_rt=4:00:00

module load vcfbcf/bio-vcf/0.9.2

folder=/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/CALLABLE/
outdir=/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/callable_loci_counts/
out_file=$outdir/overview_autosomal_callable_length.csv
cd $outdir
rm -f *

out_file=$outdir/overview_autosomal_callable_length.csv

job_name=${directname}/RUNSNVFI_${filename}.job
	if [[ ! -p $out_file ]]; then
		touch $out_file
	fi


for bed in $folder/*.bed; do
	filename=${bed##*/}
	samplename=${filename%.bed}
	echo $samplename
	length=`cat $bed | awk '{if($1 >= 1 && $1 <= 22) {print $0}}' | awk -F'\t' 'BEGIN{SUM=0}{SUM+=$3-$2}END{print SUM}'`
	echo -e $samplename'\t'$length >> $out_file

done

