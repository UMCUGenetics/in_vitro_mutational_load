#!/bin/bash

echo "##############"
echo "SNV pipeline 2019 -- merged files"
echo "##############"
cd /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/VCFs/substracted_VCFs_callable/

for vcf in ./*.vcf; do
        filename=${vcf##*/}
        samplename=${filename%.*}
        #echo -ne $samplename
        printf "`echo $samplename` `cat $vcf | grep -v '^#' |  wc -l`\n"

        #cat $vcf | grep -v '^#' |  wc -l
done


echo "##############"
echo "SNV pipeline 2019"
echo "##############"
cd /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/VCFs/substracted_VCFs_callable/

for vcf in ./*_SNV.vcf; do
        filename=${vcf##*/}
        samplename=${filename%.*}
        #echo -ne $samplename
        printf "`echo $samplename` `cat $vcf | grep -v '^#' |  wc -l`\n"

        #cat $vcf | grep -v '^#' |  wc -l
done

echo ""
echo "##############"
echo "SNV pipeline 2018"
echo "##############"
cd /hpc/cog_bioinf/cuppen/project_data/Ewart_invitro/vcfs/

for vcf in ./*.vcf; do
        filename=${vcf##*/}
        samplename=${filename%.*}
        #echo -ne $samplename
        printf "`echo $samplename` `cat $vcf | grep -v '^#' |  wc -l`\n"

        #cat $vcf | grep -v '^#' |  wc -l
done

echo ""
echo ""
echo "##############"
echo "INDEL pipeline 2019"
echo "##############"
cd /hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/VCFs/substracted_VCFs_callable/

for vcf in ./*_INDEL.vcf; do
        filename=${vcf##*/}
        samplename=${filename%.*}
        #echo -ne $samplename
        printf "`echo $samplename` `cat $vcf | grep -v '^#' |  wc -l`\n"

        #cat $vcf | grep -v '^#' |  wc -l
done

echo ""
echo "##############"
echo "INDEL pipeline 2018"
echo "##############"
cd /hpc/cog_bioinf/cuppen/project_data/Ewart_invitro/indels\ filtered_all_TP/

for vcf in ./*_TP.vcf; do
        filename=${vcf##*/}
        samplename=${filename%.*}
        #echo -ne $samplename
        printf "`echo $samplename` `cat $vcf | grep -v '^#' |  wc -l`\n"

        #cat $vcf | grep -v '^#' |  wc -l
done