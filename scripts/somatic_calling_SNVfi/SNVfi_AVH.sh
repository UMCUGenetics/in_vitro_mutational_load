#!/bin/bash
# @Date: 02-02-2016

# @Author(s): Francis Blokzijl, Sander Boymans, Roel Janssen
# @Title: SNVFI

# @Description: Pipeline for filtering somatic SNVs for clonal (organoid) cultures
# @Args: (1) Path to .cfg file containing paths to tools. (2) Path to .ini file containing
# job specific settings

# -----------------------------------------------------------------------------
# Define helper functions
# -----------------------------------------------------------------------------
function join { local IFS="$1"; shift; echo "$*"; }
function techo { echo `date +"%Y-%m-%d_%H:%M:%S"`": "$*; }


# Read default configuration file
config=$1
ini=$2

source $config
source $ini

echo $config
echo $ini

# -----------------------------------------------------------------------------
# Define absolute paths to external programs
# -----------------------------------------------------------------------------



run_RSCRIPT="$R_PREFIX"Rscript
run_VCFTOOLS="$VCFTOOLS_PREFIX"vcftools
run_BGZIP="$TABIX_PREFIX"bgzip
run_TABIX="$TABIX_PREFIX"tabix
run_BIOVCF="$BIOVCF_PREFIX"bio-vcf
run_GREP="$GREP_PREFIX"grep
run_ZGREP="$ZGREP_PREFIX"zgrep

# create tmp dir and log-files
TMP_DIR=$OUT_DIR/tmp

if [ ! -d $TMP_DIR ]; then
    mkdir $TMP_DIR
fi


# get sample names
SAMPLES=($($run_GREP -P "^#CHROM" < $SNV))

CON_NAME=${SAMPLES[ $(( $CON+8 )) ]}
SUB_NAME=${SAMPLES[ $(( $SUB+8 )) ]}

LOG=$OUT_DIR/$SUB_NAME"_"$CON_NAME"_filter-log.txt"
ERR=$OUT_DIR/$SUB_NAME"_"$CON_NAME"_filter-err.txt"
COUNTS=$OUT_DIR/$SUB_NAME"_"$CON_NAME"_filter-count.txt"

#get version
INSTALL_DIR=$( cd $( dirname '${BASH_SOURCE[0]}' ) && pwd )
SCRIPT_NAME=`basename "$0"`
VERSION=$INSTALL_DIR/$SCRIPT_NAME

# -----------------------------------------------------------------------------
# Print control and subject sample names, as feedback for user
# -----------------------------------------------------------------------------
techo $SUB_NAME" is used as the subject sample" >> $LOG
techo $CON_NAME" is used as the control sample" >> $LOG




# make output file names
s="_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_autosomal.vcf"
vcf_filtered="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_autosomal.vcf.gz"
vcf_filtered_zip="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_autosomal_nonBlacklist.vcf.gz"
vcf_no_blacklist="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_autosomal_nonBlacklist_noEvidenceCon_SNV.vcf"
vcf_no_evidence_and_called_SNV="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_VAF"$VAF"_autosomal_nonBlacklist_final_SNV.vcf"
vcf_final_SNV="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_VAF_SNV.pdf"
VAF_plot_file_SNV="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_autosomal_nonBlacklist_noEvidenceCon_INDEL.vcf"
vcf_no_evidence_and_called_INDEL="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_VAF"$VAF"_autosomal_nonBlacklist_final_INDEL.vcf"
vcf_final_INDEL="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

s="_VAF_INDEL.pdf"
VAF_plot_file_INDEL="$OUT_DIR$SUB_NAME"_"$CON_NAME$s"

techo "(1) Filtering SNV file with bio_vcf STARTED" >> $LOG
# bio vcf is zero based: subtract one from CON and sub index
export TMPDIR=$TMP_DIR
if [ $FILTER = "PASS" ]; then
  cat $SNV | $run_BIOVCF -i --num-threads $MAX_THREADS --thread-lines 50_000 --filter "r.filter=='PASS' and r.qual>=$QUAL and r.chrom.to_i>0 and r.chrom.to_i<23" \
  --sfilter-samples $(($CON-1)),$(($SUB-1)) --sfilter "!s.empty? and s.dp>=$COV" 1>$vcf_filtered"tmp1" 2>>$ERR
  cat $vcf_filtered"tmp1" | $run_BIOVCF -i --num-threads $MAX_THREADS --thread-lines 50_000 --sfilter-samples $(($CON-1)) --sfilter "s.gq>=$CON_GQ" 1>$vcf_filtered"tmp2" 2>>$ERR
  cat $vcf_filtered"tmp2" | $run_BIOVCF -i --num-threads $MAX_THREADS --thread-lines 50_000 --sfilter-samples $(($SUB-1)) --sfilter "s.gq>=$SUB_GQ" 1>$vcf_filtered 2>>$ERR

elif [ $FILTER = "ALL" ]; then
  cat $SNV | $run_BIOVCF -i --num-threads $MAX_THREADS --thread-lines 50_000 --filter "r.qual>=$QUAL and r.chrom.to_i>0 and r.chrom.to_i<23" \
  --sfilter-samples $(($CON-1)),$(($SUB-1)) --sfilter "!s.empty? and s.dp>=$COV"  1>$vcf_filtered"tmp1" 2>>$ERR
  cat $vcf_filtered"tmp1" | $run_BIOVCF -i --num-threads $MAX_THREADS --thread-lines 50_000 --sfilter-samples $(($CON-1)) --sfilter "s.gq>=$CON_GQ" 1>$vcf_filtered"tmp2" 2>>$ERR
  cat $vcf_filtered"tmp2" | $run_BIOVCF -i --num-threads $MAX_THREADS --thread-lines 50_000 --sfilter-samples $(($SUB-1)) --sfilter "s.gq>=$SUB_GQ" 1>$vcf_filtered 2>>$ERR

else
  printf "$FILTER is not a valid value for FILTER (PASS | ALL)\n"
  exit 1
fi

$run_BGZIP -c $vcf_filtered 1> $vcf_filtered_zip 2>> $ERR
$run_TABIX -p vcf $vcf_filtered_zip 2>> $ERR

techo "(1) Filtering SNV file with bio_vcf DONE" >> $LOG

echo "Input file:" > $COUNTS
$run_GREP -Pvc "^#" $SNV >> $COUNTS

echo "Q"$QUAL" CGQ"$CON_GQ" SGQ"$SUB_GQ $FILTER $COV"X autosomal:" >> $COUNTS
$run_GREP -Pvc "^#" $vcf_filtered >> $COUNTS

techo "(2) Removing blacklisted SNPs from SNV file STARTED" >> $LOG
COUNT=1
vcf_tmp=$vcf_filtered_zip
for vcf in "${BLACKLIST[@]}";
do
    OUT=$TMP_DIR/$SUB_NAME"_"$CON_NAME"_Q"$QUAL"_CGQ"$CON_GQ"_SGQ"$SUB_GQ"_"$FILTER"_"$COV"X_autosomal_nonBlacklist_"$COUNT

    $run_VCFTOOLS --gzvcf $vcf_tmp --exclude-positions $vcf --recode --recode-INFO-all --out $OUT 2>>$ERR
    $run_BGZIP -c $OUT.recode.vcf > $OUT.recode.vcf.gz 2>>$ERR
    $run_TABIX $OUT.recode.vcf.gz 2>>$ERR

    echo "Not in blacklist $vcf: " >> $COUNTS
    $run_ZGREP -Pvc "^#" $OUT.recode.vcf.gz >> $COUNTS

    vcf_tmp=$OUT.recode.vcf.gz
    ((COUNT++))
done



mv $vcf_tmp $vcf_no_blacklist
mv $vcf_tmp.tbi $vcf_no_blacklist.tbi

#remove comma seperated snps and indels
zcat $vcf_no_blacklist | head -350 | grep "^#" > $OUT_DIR/no_blacklist_temp.vcf
zcat $vcf_no_blacklist | grep -v "^#" | awk '!($5 ~ ",")' >> $OUT_DIR/no_blacklist_temp.vcf

$run_BGZIP -c $OUT_DIR/no_blacklist_temp.vcf > $vcf_no_blacklist 2>>$ERR
$run_TABIX $vcf_no_blacklist 2>>$ERR

rm $OUT_DIR/no_blacklist_temp.vcf

techo "(2) Removing blacklisted SNPs from SNV file DONE" >> $LOG

#Load appropriate R version


techo "(3) Filtering SNV file with R STARTED" >> $LOG
touch $OUT_DIR/Rjob.sh
echo guixr load-profile /home/cog/avanhoeck/.guix-profile '--<<EOF' > $OUT_DIR/Rjob.sh
echo Rscript $RSCRIPT $vcf_no_blacklist $CON $SUB $VAF $vcf_no_evidence_and_called_SNV $vcf_final_SNV $VAF_plot_file_SNV $vcf_no_evidence_and_called_INDEL $vcf_final_INDEL $VAF_plot_file_INDEL >> $OUT_DIR/Rjob.sh
echo 'EOF' >> $OUT_DIR/Rjob.sh
sh $OUT_DIR/Rjob.sh
techo "(3) Filtering SNV file with R DONE" >> $LOG

#add filter steps to header
vcf_final_tmp=$vcf_final"_tmp"

TIME=`date +"%Y-%m-%d_%H:%M:%S"`
#FINAL_HEADER=`grep -P "^#" $vcf_final`
HEADER_ADD="##SNVFI_filtering=<Version=$VERSION, Date=$TIME, Tools='bio-vcf=$run_BIOVCF tabix=$run_TABIX vcftools=$run_VCFTOOLS rscript=$run_RSCRIPT', SNV=$SNV, SUB=$SUB, CON=$CON, OUT_DIR=$OUT_DIR, QUAL=$QUAL, SUB_GQ=$SUB_GQ, CON_GQ=$CON_GQ,COV=$COV, VAF=$VAF, BLACKLIST=["
HEADER_ADD+=`join , ${BLACKLIST[@]}`
HEADER_ADD+="]>"

$run_GREP -P "^##" $vcf_final > $vcf_final_tmp
echo $HEADER_ADD >> $vcf_final_tmp
$run_GREP -P "^#CHROM" $vcf_final >> $vcf_final_tmp
$run_GREP -Pv "^#" $vcf_final >> $vcf_final_tmp
mv $vcf_final_tmp $vcf_final

techo "(4) Writing info on mutation numbers to log file STARTED" >> $LOG

# Write info on mutations numbers to log file
echo "No evidence control and called:" >> $COUNTS
$run_GREP -Pvc "^#" $vcf_no_evidence_and_called >> $COUNTS

echo "Called and VAF > $VAF in subject:" >> $COUNTS
$run_GREP -Pvc "^#" $vcf_final >> $COUNTS

techo "(4) Writing info on mutation numbers to log file DONE" >> $LOG
techo "(5) Removing files that are not needed STARTED" >> $LOG

# remove files that are not needed
if [ $CLEANUP == "YES" ]; then
    rm -r $TMP_DIR
fi

techo "(5) Removing files that are not needed DONE" >> $LOG

