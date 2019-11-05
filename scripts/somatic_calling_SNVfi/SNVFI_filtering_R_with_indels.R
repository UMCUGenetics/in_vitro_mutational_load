# @Author: Francis Blokzijl   
# @Date: 8 September 2015
library(VariantAnnotation)
library(ggplot2)
library(reshape2)


# Input from command line
args = commandArgs(trailingOnly = TRUE)
vcf_file = args[1]
REF = as.integer(args[2])
SUB = as.integer(args[3])
#ADDED PNR ARGUMENT
PNR = as.numeric(args[4])
vcf_no_evidence_and_called_SNV = args[5]
vcf_final_SNV = args[6]
pnr_plot_file_SNV = args[7]

vcf_no_evidence_and_called_indel = args[8]
vcf_final_indel = args[9]
pnr_plot_file_indel = args[10]

#vcf_file = "~/surfdrive/projects/ips_organoid_invitro/STE0072SC12A_STE0072Blood_Q100_CGQ10_SGQ99_PASS_20X_autosomal_nonBlacklist.vcf.gz"
#REF = as.integer("1")
#SUB = as.integer("5")
##ADDED PNR ARGUMENT
#PNR = as.numeric("0.3")
#vcf_no_evidence_and_called = "~/surfdrive/projects/ips_organoid_invitro/STE0072SC12A_STE0072Blood_Q100_CGQ10_SGQ99_PASS_20X_autosomal_nonBlacklist_noEvidenceCon.vcf"
#vcf_final = "~/surfdrive/projects/ips_organoid_invitro/STE0072SC12A_STE0072Blood_Q100_CGQ10_SGQ99_PASS_20X_VAF0.3_autosomal_nonBlacklist_final.vcf"
#pnr_plot_file = "~/surfdrive/projects/ips_organoid_invitro/STE0072SC12A_STE0072Blood_VAF.pdf"

# Read vcf file
vcf = readVcf(vcf_file, "hg19")
n = dim(vcf)[1]
s = dim(vcf)[2]
vr = as(vcf, "VRanges")
vcf_SNV = vcf[isSNV(vcf, singleAltOnly=FALSE)]
n_SNV = dim(vcf_SNV)[1]
vcf_INDEL = vcf[isIndel(vcf, singleAltOnly=FALSE)]
n_INDEL = dim(vcf_INDEL)[1]

#vcf_SNV=vcf
sample_names = samples(header(vcf))



##
#1SNVs
# Calculate Variant Allele Frequency
# This is the only way it works with VariantAnnotation vcf parsing AND multiple alternative alleles
# Get AD values
ad = CharacterList(geno(vcf_SNV)$AD)
# Coerce from character to integer
ad = lapply(ad, function(x) as.integer(x))
# Calculate alternative allele frequency as total altdepth / totaldepth
vaf = lapply(ad, function(x) (sum(x) - x[1]) / sum(x))
VAF_matrix = matrix(data = vaf, nrow = n_SNV, ncol = s)
altdepth = lapply(ad, function(x) sum(x) - x[1])
alt_matrix = matrix(data = altdepth, nrow = n_SNV, ncol = s)

# Called in subject sample
genotype = geno(vcf_SNV)$GT
called_in_subject = which(!(genotype[,SUB] == "0/0"))

VAF_in_subject = which(VAF_matrix[,SUB] >= PNR)

# No evidence in reference sample
no_evidence_reference = which(alt_matrix[,REF] < 1)

# Function to intersect multiple lists
overlap = function(x)
{
  A = Reduce('intersect', x)
  return(A)
}

# Find final set of SNVs that meet al criteria
final = overlap(list(called_in_subject, VAF_in_subject, no_evidence_reference))

# Called SNVS with no evidence in the reference
no_evidence_and_called = overlap(list(called_in_subject, no_evidence_reference))

# --------------------- OUTPUT VCFs ---------------------------

writeVcf(vcf_SNV[no_evidence_and_called,], vcf_no_evidence_and_called_SNV)
writeVcf(vcf_SNV[final,], vcf_final_SNV)

# --------------------- VAF/PNR plot ------------------------------
selection = overlap(list(called_in_subject, no_evidence_reference))
dat = as.data.frame(VAF_matrix[selection, SUB])
dat = melt(dat)
NSV_count=length(selection)


pdf(pnr_plot_file_SNV)
ggplot(dat, aes(x=value)) + 
  geom_histogram(aes(y=..density..), binwidth=0.01) +
  geom_density(alpha=.2, fill="#FF6666") + 
  scale_x_continuous(limits=c(0,1)) +
  labs(x = "Fraction non-reference (PNR)") +
  ggtitle(sprintf("%s #SNVs:%s",sample_names[SUB],NSV_count))
dev.off()



##
#2INDELs
# Calculate Variant Allele Frequency
# This is the only way it works with VariantAnnotation vcf parsing AND multiple alternative alleles
# Get AD values
ad = CharacterList(geno(vcf_INDEL)$AD)
# Coerce from character to integer
ad = lapply(ad, function(x) as.integer(x))
# Calculate alternative allele frequency as total altdepth / totaldepth
vaf = lapply(ad, function(x) (sum(x) - x[1]) / sum(x))
VAF_matrix = matrix(data = vaf, nrow = n_INDEL, ncol = s)
altdepth = lapply(ad, function(x) sum(x) - x[1])
alt_matrix = matrix(data = altdepth, nrow = n_INDEL, ncol = s)

totalreaddepth = geno(vcf_INDEL)$DP
# Coerce from character to integer
totalreaddepth = lapply(totalreaddepth, function(x) as.integer(x))
totalreaddepth_matrix = matrix(data = totalreaddepth, nrow = n_INDEL, ncol = s)

quality_score = geno(vcf_INDEL)$GQ
# Coerce from character to integer
quality_score = lapply(quality_score, function(x) as.integer(x))
quality_score_matrix = matrix(data = quality_score, nrow = n_INDEL, ncol = s)


# Called in subject sample
genotype = geno(vcf_INDEL)$GT
called_in_subject = which(!(genotype[,SUB] == "0/0"))

VAF_in_subject = which(VAF_matrix[,SUB] >= PNR)

# No evidence in reference sample
no_evidence_reference = which(alt_matrix[,REF] < 1)

# INDEL has high GQ_score
GQ_score = which(quality_score_matrix[,REF] >= 99)

# INDEL has reliable read support both in ref sample as well as in SUB sample
goodreapsupport_in_REF = which(totalreaddepth_matrix[,REF] > 10 & totalreaddepth_matrix[,REF] < 60)
goodreapsupport_in_SUB = which(totalreaddepth_matrix[,SUB] > 10 & totalreaddepth_matrix[,SUB] < 60)

# Find final set of INDELs that meet al criteria
final = overlap(list(called_in_subject, VAF_in_subject, no_evidence_reference,GQ_score,goodreapsupport_in_REF,goodreapsupport_in_SUB))

# Called SNVS with no evidence in the reference
no_evidence_and_called = overlap(list(called_in_subject, no_evidence_reference,GQ_score,goodreapsupport_in_REF,goodreapsupport_in_SUB))

# --------------------- OUTPUT VCFs ---------------------------

writeVcf(vcf_INDEL[no_evidence_and_called,], vcf_no_evidence_and_called_indel)
writeVcf(vcf_INDEL[final,], vcf_final_indel)

# --------------------- VAF/PNR plot ------------------------------
selection = overlap(list(called_in_subject, no_evidence_reference,GQ_score,goodreapsupport_in_REF,goodreapsupport_in_SUB))
dat = as.data.frame(VAF_matrix[selection, SUB])
dat = melt(dat)
INDEL_count=length(selection)


pdf(pnr_plot_file_indel)
ggplot(dat, aes(x=value)) + 
  geom_histogram(aes(y=..density..), binwidth=0.01) +
  geom_density(alpha=.2, fill="#FF6666") + 
  scale_x_continuous(limits=c(0,1)) +
  labs(x = "Fraction non-reference (PNR)") +
  ggtitle(sprintf("%s #INDELs:%s",sample_names[SUB],INDEL_count))
dev.off()

