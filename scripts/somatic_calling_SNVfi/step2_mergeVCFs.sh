#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -M a.vanhoeck@umcutrecht.nl
#$ -m aes
#$ -l h_vmem=17G

module load Java/1.8.0_60
module load gatk/3.4-46
outdir=/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/VCFs/substracted_VCFs/
cd $outdir
rm -rf ./tmp
mkdir ./tmp


for vcf in ./*vcf; do
        filename=${vcf##*/}
        samplename=${filename%_SNV.*}
        echo $samplename
        
        java -Xmx20G -Djava.io.tmpdir=$outdir/tmp/ \
        -jar /hpc/local/CentOS7/cog_bioinf/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar \
        -T CombineVariants \
        -R /hpc/cog_bioinf/GENOMES/Homo_sapiens.GRCh37.GATK.illumina/Homo_sapiens.GRCh37.GATK.illumina.fasta \
        -o $outdir/${samplename}.vcf \
        --genotypemergeoption uniquify \
        -V:${samplename}_SNV $outdir${samplename}_SNV.vcf \
        -V:${samplename}_INDEL $outdir${samplename}_INDEL.vcf


        #bgzip $vcf
done

