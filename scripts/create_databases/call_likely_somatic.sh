#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -M a.vanhoeck@umcutrecht.nl
#$ -m aes
#$ -l h_vmem=20G
#$ -l h_rt=4:00:00

module load vcfbcf/bio-vcf/0.9.2

folder=/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/


cd $folder
#mkdir potential_somatic
outdir_clean=$folder/potential_somatic/

for vcf in $folder/*.vcf; do
                filename=${vcf##*/}
                samplename=${filename%.vcf}
                echo $samplename
                cat $vcf | bio-vcf  -iq  --ifilter 's.gt=="0/1"'  > ${outdir_clean}${samplename}_potential_somatic.vcf
done
