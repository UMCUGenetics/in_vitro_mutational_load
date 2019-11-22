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
outdir_clean=$folder/potential_somatic/

echo "run somatic"

#cat /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9BULK.vcf | bio-vcf  -iq  --ifilter 's.gt=="0/1"'  > ${outdir_clean}H9BULK_potential_somatic.vcf
cat /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEH2.vcf | bio-vcf  -iq  --ifilter 's.gt=="0/1"'  > ${outdir_clean}H9CLONEH2_potential_somatic.vcf
cat /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEH2SUBCLONE2.vcf | bio-vcf  -iq  --ifilter 's.gt=="0/1"'  > ${outdir_clean}H9CLONEH2SUBCLONE2_potential_somatic.vcf
cat /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEN2.vcf | bio-vcf  -iq  --ifilter 's.gt=="0/1"'  > ${outdir_clean}H9CLONEN2_potential_somatic.vcf
cat /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEN2SUBCLONE3.vcf | bio-vcf  -iq  --ifilter 's.gt=="0/1"'  > ${outdir_clean}H9CLONEN2SUBCLONE3_potential_somatic.vcf

