#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -M a.vanhoeck@umcutrecht.nl
#$ -m aes
#$ -l h_vmem=20G
#$ -l h_rt=40:00:00


# Selectvariant SNVs

java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
-T SelectVariants \
-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/KUI4105.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9BULK.vcf" \
-sn H9BULK

java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
-T SelectVariants \
-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/KUI4105.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEH2.vcf" \
-sn H9CLONEH2

java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
-T SelectVariants \
-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/KUI4105.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEH2SUBCLONE2.vcf" \
-sn H9CLONEH2SUBCLONE2

java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
-T SelectVariants \
-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/KUI4105.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEN2.vcf" \
-sn H9CLONEN2

java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
-T SelectVariants \
-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/KUI4105.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/H9CLONEN2SUBCLONE3.vcf" \
-sn H9CLONEN2SUBCLONE3

#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/17513D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/17513DBiopsy.vcf" \
#-sn 17513DBiopsy
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/17513D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/17513DC10.vcf" \
#-sn 17513DC10
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/17513D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/17513DC3.vcf" \
#-sn 17513DC3
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/17513D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/17513DSC105.vcf" \
#-sn 17513DSC105
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/17513D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/17513DSC33.vcf" \
#-sn 17513DSC33
#
###
#
##C30913D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf
##C30913DBiopsy	C30913DC10	C30913DC12	C30913DSC109	C30913DSC125
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/C30913D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/C30913DBiopsy.vcf" \
#-sn C30913DBiopsy
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/C30913D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/C30913DC10.vcf" \
#-sn C30913DC10
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/C30913D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/C30913DC12.vcf" \
#-sn C30913DC12
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/C30913D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/C30913DSC109.vcf" \
#-sn C30913DSC109
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/C30913D.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/C30913DSC125.vcf" \
#-sn C30913DSC125
#
##HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf
##EWSEVBULK	EWSEVCA1	EWSEVCA3	EWSEVCB3	EWSEVSCA1	EWSEVSCA3	EWSEVSCB3
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVBULK.vcf" \
#-sn EWSEVBULK
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVCA1.vcf" \
#-sn EWSEVCA1
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVCA3.vcf" \
#-sn EWSEVCA3
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVCB3.vcf" \
#-sn EWSEVCB3
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVSCA1.vcf" \
#-sn EWSEVSCA1
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVSCA3.vcf" \
#-sn EWSEVSCA3
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0161.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVSCB3.vcf" \
#-sn EWSEVSCB3
#
##HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf
##EWSEVCLONEHA1	EWSEVCLONEHA1SUBCLONE3	MASEVCLONEH2	MASEVCLONEH2SUBCLONE2	MASEVCLONEN4	MASEVCLONEN4SUBCLONE1	MASEVREFERENCE
#
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVCLONEHA1.vcf" \
#-sn EWSEVCLONEHA1
#
#
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/EWSEVCLONEHA1SUBCLONE3.vcf" \
#-sn EWSEVCLONEHA1SUBCLONE3
#
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/MASEVCLONEH2.vcf" \
#-sn MASEVCLONEH2
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/MASEVCLONEH2SUBCLONE2.vcf" \
#-sn MASEVCLONEH2SUBCLONE2
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/MASEVCLONEN4.vcf" \
#-sn MASEVCLONEN4
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/MASEVCLONEN4SUBCLONE1.vcf" \
#-sn MASEVCLONEN4SUBCLONE1
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/HMFreg0498_UMCU-002-063_ekuijk.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/MASEVREFERENCE.vcf" \
#-sn MASEVREFERENCE
#
##STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf
##STE0072Blood	STE0072C12	STE0072C23	STE0072C31	STE0072SC12A	STE0072SC23B	STE0072SC31A
#
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0072Blood.vcf" \
#-sn STE0072Blood
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0072C12.vcf" \
#-sn STE0072C12
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0072C23.vcf" \
#-sn STE0072C23
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0072C31.vcf" \
#-sn STE0072C31
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0072SC12A.vcf" \
#-sn STE0072SC12A
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0072SC23B.vcf" \
#-sn STE0072SC23B
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0072.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0072SC31A.vcf" \
#-sn STE0072SC31A
#
#
##STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf
##STE0076Blood	STE0076C12	STE0076C23	STE0076C32	STE0076SC12C	STE0076SC23A	STE0076SC32A
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0076Blood.vcf" \
#-sn STE0076Blood
#
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0076C12.vcf" \
#-sn STE0076C12
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0076C23.vcf" \
#-sn STE0076C23
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0076C32.vcf" \
#-sn STE0076C32
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0076SC12C.vcf" \
#-sn STE0076SC12C
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0076SC23A.vcf" \
#-sn STE0076SC23A
#java -Xmx4g -jar /hpc/cog_bioinf/common_scripts/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
#-T SelectVariants \
#-R "/hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta" \
#-V "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/STE0076.filtered_variants_snpEff_snpSift_Cosmicv76_GoNLv5.vcf" \
#-o "/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/RAW_DATA_Files/singles/STE0076SC32A.vcf" \
#-sn STE0076SC32A

