BED_FILES=("/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-I-1_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-I-2_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-I-3_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-L-26_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-L-29_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-L-30_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-L-A1_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-L-A5_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W15-L-B1_CallableLoci_CALLABLE_F100916W15-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-I-1_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-I-4_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-I-5_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-L-24_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-L-26_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-L-27_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-L-B1_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-L-B3_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/F100916W17-L-B4_CallableLoci_CALLABLE_F100916W17-REF_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/E090316-LIVER-CLONE1_CallableLoci_CALLABLE_E090316-REF-SKIN_CallableLoci_CALLABLE_intersect.bed"
"/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/SNV/4_CALLABLELOCI/C_intersectCALLABLE/E300316-LIVER-CLONE1_CallableLoci_CALLABLE_E300316-REF-SKIN_CallableLoci_CALLABLE_intersect.bed")

# all autosomal chromosomes

OUT_FILE="/hpc/cog_bioinf/cuppen/project_data/Myrthe_foetal/callable_length/autosomal_callable_length.txt"

# for each callable bed file, calculate the autosomal callable length
for f in ${BED_FILES[@]}
do
    echo $f
	name=`basename $f`
	length=`cat $f | awk '{if($1 >= 1 && $1 <= 22) {print $0}}' | awk -F'\t' 'BEGIN{SUM=0}{SUM+=$3-$2}END{print SUM}'`
	echo -e $name'\t'$length >> $OUT_FILE
done