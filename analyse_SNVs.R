#source("https://bioconductor.org/biocLite.R")
#biocLite()
#biocLite("hrbrthemes")
library(devtools)
#install_github("UMCUGenetics/MutationalPatterns", ref = "develop")
library("MutationalPatterns")
#biocLite("dendextend")
library("GenomeInfoDb")
#biocLite("cowplot")
library(BSgenome)
#biocLite("BSgenome.Hsapiens.UCSC.hg19")
ref_genome <- "BSgenome.Hsapiens.UCSC.hg19"
library(ref_genome, character.only = TRUE)
library(reshape2)
library(ggplot2) 
library(MutationalPatterns)
library(GenomicRanges)
library(VariantAnnotation)
library(ggdendro)
library(cowplot)
library(dendextend)
library(stringr)
library(hrbrthemes)

options(scipen=10000)

#bugfix
#remove DelayedArray()
#install_github("Bioconductor-mirror/DelayedArray", ref="22cf715874e9c9378b9ff3691d7cb72fc82bcbf6")
library(DelayedArray)
#check R version
version
packageStatus()
packageVersion("DelayedArray")

# Global package variables

# Default colours for mutation spectrum plotting
COLORS6 = c(
  "#2EBAED", "#000000", "#DE1C14",
  "#D4D2D2", "#ADCC54", "#F0D0CE")

COLORS7 = c(
  "#2EBAED", "#000000", "#DE1C14",
  "#E98C7B", "#D4D2D2", "#ADCC54",
  "#F0D0CE")

SUBSTITUTIONS = c('C>A','C>G','C>T','T>A','T>C','T>G')
SUBSTITUTIONS_96 = rep(SUBSTITUTIONS, each=16)
SUBSTITUTIONS_192 = rep(SUBSTITUTIONS, each=32)

SUBSTITUTIONS = c('C>A','C>G','C>T','T>A','T>C','T>G')

C_TRIPLETS = c(
  "ACA", "ACC", "ACG", "ACT",
  "CCA", "CCC", "CCG", "CCT",
  "GCA", "GCC", "GCG", "GCT",
  "TCA", "TCC", "TCG", "TCT")

T_TRIPLETS = c(
  "ATA", "ATC", "ATG", "ATT",
  "CTA", "CTC", "CTG", "CTT",
  "GTA", "GTC", "GTG", "GTT",
  "TTA", "TTC", "TTG", "TTT")

TRIPLETS_96 = c(rep(C_TRIPLETS, 3), rep(T_TRIPLETS, 3))

STRAND = rep(c("U","T"), 96)
DNA_BASES = c("A", "C", "G", "T")

colorpalette = c("Signature.1" =  '#8dd3c7',
                 "Signature.2" =  '#ffffb3',
                 "Signature.3" =  'slateblue',
                 "Signature.4" =  '#fb8072',
                 "Signature.5" =  '#80b1d3',
                 "Signature.6" =  '#fdb462',
                 "Signature.7" =  '#b3de69',
                 "Signature.8" =  '#fccde5',
                 "Signature.9" =  '#d9d9d9',
                 "Signature.10" = '#ff1417' ,
                 "Signature.11" = '#ff6611' ,
                 "Signature.12" = '#c4ff00' ,
                 "Signature.13" = '#ff8844' ,
                 "Signature.14" = '#ffee55' ,
                 "Signature.15" = '#ffff99' ,
                 "Signature.16" = '#78FA37' ,
                 "Signature.17" = '#aacc22' ,
                 "Signature.18" = '#bbdd77' ,
                 "Signature.19" = '#c8cf82' ,
                 "Signature.20" = '#92a77e' ,
                 "Signature.21" = '#5599ee' ,
                 "Signature.22" = '#0088cc' ,
                 "Signature.23" = '#226688' ,
                 "Signature.24" = '#175279' ,
                 "Signature.25" = '#557777' ,
                 "Signature.26" = '#ddbb33' ,
                 "Signature.27" = '#d3a76d' ,
                 "Signature.28" = '#a9834b' ,
                 "Signature.29" = '#aa6688',
                 "Signature.30" = '#767676',
                 "Signature.A" = '#458B00' ,
                 "Signature.B" = '#D2691E' ,
                 "Signature.C" = '#6495ED' ,
                 "Signature.D" = '#A2CD5A' ,
                 "Signature.E" = '#CD3333' ,
                 "Signature.F" = '#7AC5CD' ,
                 "Signature.G" = '#009ACD' ,
                 "Signature.H" = '#CD2626' ,
                 "Signature.I" = '#FFB90F' ,
                 "Signature.J" = '#76EEC6' ,
                 "Signature.K" = '#EEB422' ,
                 "Signature.L" = '#97FFFF' ,
                 "Signature.M" = '#E9967A' ,
                 "Signature.N" = '#5F9EA0')

chromosome <- c('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','X','Y','MT')
str(chromosome)
##########
##########
##########
########

vcf_files <- list.files(path = "/Users/avanhoeck/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/VCFs/substracted_VCFs_callable/", pattern = "SNV.vcf$", full.names=TRUE)
sample_names <- c("colon1", "colon2", "colon3")
vcf_files_names <- sub("/Users/avanhoeck/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/VCFs/substracted_VCFs_callable//","",vcf_files)
vcf_files_names <- sub("_CALLABLE_SNV.vcf","",vcf_files_names)

vcfs <- read_vcfs_as_granges(vcf_files, vcf_files_names, ref_genome)

mut_mat <- mut_matrix(vcf_list = vcfs, ref_genome = ref_genome)

tri_nuclt_context = read.csv("/Users/avanhoeck/hpc/cog_bioinf/cuppen/personal_data/avanhoeck/regex_in_fasta/overview_sorted.csv",sep = " ",header = F)
names(tri_nuclt_context)=c("context","chr","strand","count")

saveRDS(mut_mat, file = "/Users/avanhoeck/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/mut_mat.rds")
saveRDS(tri_nuclt_context, file = "/Users/avanhoeck/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/tri_nuclt_context.rds")


mut_mat <- readRDS(file = "/Users/avanhoeck/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/mut_mat.rds")
tri_nuclt_context <- readRDS(file = "/Users/avanhoeck/hpc/cog_bioinf/cuppen/project_data/Arne_ips_organoid_invitro/tri_nuclt_context.rds")


tri_nuclt_context %>% 
  dplyr::group_by(context,chr) %>% 
  dplyr::summarize(count = sum(count, na.rm = TRUE)) %>% 
  as.data.frame() -> tri_nuclt_context_per_chr

tri_nuclt_context %>% 
  dplyr::group_by(context,strand) %>% 
  dplyr::summarize(count = sum(count, na.rm = TRUE)) %>% 
  as.data.frame() -> tri_nuclt_context_per_strand

tri_nuclt_context %>% 
  dplyr::group_by(context) %>% 
  dplyr::summarize(count = sum(count, na.rm = TRUE)) %>% 
  as.data.frame() -> tri_nuclt_context_genome

tri_nuclt_context$type_strand <- paste(tri_nuclt_context$context,tri_nuclt_context$strand, sep = "_")
tri_nuclt_context$chr <- factor(tri_nuclt_context$chr, levels =chromosome)
ggplot(tri_nuclt_context, aes(chr,type_strand, fill= count)) + 
  geom_tile()  +
  scale_fill_continuous(high = "#132B43", low = "#56B1F7")



tri_nuclt_context_genome %>% 
  dplyr::mutate(corrfactor = 100/(count / min(count))) -> tri_nuclt_context_genome_corrfactors


ggplot(tri_nuclt_context_genome_corrfactors, aes("strand",context, fill= corrfactor)) + 
  geom_tile()  +
  scale_fill_continuous(high = "#132B43", low = "#56B1F7")


#tri_nuclt_context_genome %>% 
#  dplyr::mutate(freq = count / sum(count)) %>%
#  dplyr::mutate(corr = (0.1-freq)) %>%
#  dplyr::mutate(corr.factor = corr / sum(corr)) -> tri_nuclt_context_genome_corrfactor
#sum(tri_nuclt_context_genome_corrfactor$corr.factor)
#
#cytosine <- dplyr::filter(tri_nuclt_context_genome, grepl("^.{1}C.{1}$",context)) %>% 
#  dplyr::mutate(freq = count / sum(count)*100) %>%
#  dplyr::mutate(corr_factor = 1-freq) 
#thymine <- dplyr::filter(tri_nuclt_context_genome, grepl("^.{1}T.{1}$",context))%>% 
#  dplyr::mutate(freq = count / sum(count))
#
sp_url <- paste("http://cancer.sanger.ac.uk/cancergenome/assets/", "signatures_probabilities.txt", sep = "")
cancer_signatures = read.table(sp_url, sep = "\t", header = TRUE)
cancer_signatures = cancer_signatures[order(cancer_signatures[,1]),]

names(tri_nuclt_context_genome_corrfactors) <- c("Trinucleotide","count","corrfactor")
tri_nuclt_context_genome_corrfactors = dplyr::inner_join(cancer_signatures[,1:3], tri_nuclt_context_genome_corrfactors, by = "Trinucleotide")


cancer_signatures = cancer_signatures[,4:33]

cancer_signatures_corrected <- cancer_signatures * tri_nuclt_context_genome_corrfactors$corrfactor
colClean <- function(x){ colnames(x) <- paste0(colnames(x), "_corrected"); x }
cancer_signatures_corrected = colClean(cancer_signatures_corrected)

cancer_signatures_new = read.csv("~/surfdrive/Shared/Sig17/HMF_data/matrices/sigProfiler_SBS_signatures.csv", sep = ";", header = TRUE)
cancer_signatures_new = cancer_signatures_new[order(cancer_signatures_new[,1]),]
cancer_signatures_new = as.matrix(cancer_signatures_new[,4:68])

cancer_signatures_new_corrected <- cancer_signatures_new * tri_nuclt_context_genome_corrfactors$corrfactor
colClean <- function(x){ colnames(x) <- paste0(colnames(x), "_corrected"); x }
cancer_signatures_new_corrected = colClean(cancer_signatures_new_corrected)

cancer_signatures_all <- cbind(cancer_signatures,cancer_signatures_corrected,cancer_signatures_new,cancer_signatures_new_corrected)

plot_96_profile(cancer_signatures_all[,c("Signature.1","SBS1","Signature.1_corrected","SBS1_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.2","SBS2","Signature.2_corrected","SBS2_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.3","SBS3","Signature.3_corrected","SBS3_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.4","SBS4","Signature.4_corrected","SBS4_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.5","SBS5","Signature.5_corrected","SBS5_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.6","SBS6","Signature.6_corrected","SBS6_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.7","SBS7","Signature.7_corrected","SBS7_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.8","SBS8","Signature.8_corrected","SBS8_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.9","SBS9","Signature.9_corrected","SBS9_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.10","SBS10a","Signature.10_corrected","SBS10a_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.10","SBS10b","Signature.10_corrected","SBS10b_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.11","SBS11","Signature.11_corrected","SBS11_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.12","SBS12","Signature.12_corrected","SBS12_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.13","SBS13","Signature.13_corrected","SBS13_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.14","SBS14","Signature.14_corrected","SBS14_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.15","SBS15","Signature.15_corrected","SBS15_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.16","SBS16","Signature.16_corrected","SBS16_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.17","SBS17a","Signature.17_corrected","SBS17a_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.17","SBS17b","Signature.17_corrected","SBS17b_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.18","SBS18","Signature.18_corrected","SBS18_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.19","SBS19","Signature.19_corrected","SBS19_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.20","SBS20","Signature.20_corrected","SBS20_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.21","SBS21","Signature.21_corrected","SBS21_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.22","SBS22","Signature.22_corrected","SBS22_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.23","SBS23","Signature.23_corrected","SBS23_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.24","SBS24","Signature.24_corrected","SBS24_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.25","SBS25","Signature.25_corrected","SBS25_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.26","SBS26","Signature.26_corrected","SBS26_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.27","SBS27","Signature.27_corrected","SBS27_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.28","SBS28","Signature.28_corrected","SBS28_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.29","SBS29","Signature.29_corrected","SBS29_corrected")])
plot_96_profile(cancer_signatures_all[,c("Signature.30","SBS30","Signature.30_corrected","SBS30_corrected")])

plot_96_profile(mut_mat)
mut_mat=cbind(mut_mat,as.data.frame(rowSums(mut_mat)))
mut_mat
mut_mat  %>% tibble::rownames_to_column("Somatic.Mutation.Type") %>% 
  dplyr::left_join(., dplyr::select(tri_nuclt_context_genome_corrfactors,Trinucleotide,Somatic.Mutation.Type,count,corrfactor), by = "Somatic.Mutation.Type") %>% 
  as.data.frame() %>% 
  dplyr::rename(in_vitro = 'rowSums(mut_mat)') %>% 
  dplyr::mutate(in_vitro.corrected = in_vitro * corrfactor /100) -> test

names(test)
test[c("Somatic.Mutation.Type")]

plot_96_profile(test[,c("in_vitro","in_vitro.corrected")])

test[,c("in_vitro","in_vitro.corrected")]


hclust_cosmic = cluster_signatures(cancer_signatures, method = "average")
# store signatures in new order
cosmic_order = colnames(cancer_signatures)[hclust_cosmic$order]
plot(hclust_cosmic)

cos_sim_samples_signatures = cos_sim_matrix(test[,c("in_vitro","in_vitro.corrected")], cancer_signatures)
colnames(cos_sim_samples_signatures) <-  sub("_corrected", "", colnames(cos_sim_samples_signatures))
# Plot heatmap with specified signature order
plot_cosine_heatmap(cos_sim_samples_signatures,
                    col_order = cosmic_order,
                    cluster_rows = TRUE)
#mut_mat_rel <- sweep(mut_mat,2,(colSums(mut_mat)),`/`)
#plot_96_profile(mut_mat_rel)


plot_96_profile(cancer_signatures_all[,c("Signature.10","Signature.10_corrected")])


sp_url <- paste("http://cancer.sanger.ac.uk/cancergenome/assets/", "signatures_probabilities.txt", sep = "")
cancer_signatures = read.table(sp_url, sep = "\t", header = TRUE)
cancer_signatures = cancer_signatures[order(cancer_signatures[,1]),]
cancer_signatures = cancer_signatures[,4:33]
cancer_signatures%*%as.numeric(tri_nuclt_context_genome_corrfactors$corrfactor)


cancer_signatures*dplyr::select(tri_nuclt_context_genome_corrfactors,corrfactor)
cancer_signatures   %>% 
  dplyr::left_join(., dplyr::select(tri_nuclt_context_genome_corrfactors,Somatic.Mutation.Type,corrfactor), by = "Somatic.Mutation.Type") %>% 
  as.data.frame() %>% 
  dplyr::rename(in_vitro = 'rowSums(mut_mat)') %>% 
  dplyr::mutate(in_vitro.corrected = in_vitro * corrfactor /100) -> test
  



sp_url <- paste("http://cancer.sanger.ac.uk/cancergenome/assets/", "signatures_probabilities.txt", sep = "")
cancer_signatures = read.table(sp_url, sep = "\t", header = TRUE)
cancer_signatures = cancer_signatures[order(cancer_signatures[,1]),]
cancer_signatures = as.matrix(cancer_signatures[,4:33])
fit_res <- fit_to_signatures(mut_matrix_all, cancer_signatures)
#extract signatures accounting for more than 1%
select <- which((rowSums(fit_res$contribution)/sum(fit_res$contribution)*100) > 1)
rownames(fit_res$contribution[select,])


datafr <- as.data.frame(read_excel("~/surfdrive/projects/ips_organoid_invitro/overview.xlsx", "Sheet1"),row.names = F)
datafr <- melt(datafr,id.vars = "sample")
names(datafr) <- c("sample","approach","count")
SNV <- dplyr::filter(datafr, grepl("^SNV*",approach))
ggplot(data=SNV, aes(x=sample, y=count, fill=approach)) +
  geom_bar(stat="identity", position=position_dodge())+ coord_flip() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
datafr <- dplyr::select(datafr,sample,SNV_pipeline_2019,INDEL_pipeline_2019)
datafr <- melt(datafr,id.vars = "sample")
ggplotRegression <- function (fit) {
  
  require(ggplot2)
  
  ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(title = paste("Adj R2 = ",signif(summary(fit)$adj.r.squared, 5),
                       "Intercept =",signif(fit$coef[[1]],5 ),
                       " Slope =",signif(fit$coef[[2]], 5),
                       " P =",signif(summary(fit)$coef[2,4], 5)))
}
ggplotRegression(lm(SNV_pipeline_2019 ~ INDEL_pipeline_2019, data = datafr))

fit1 <- lm(SNV_pipeline_2019 ~ INDEL_pipeline_2019, data = datafr)
plot_contribution_heatmap(fit_res$contribution,plot_values = F)

df_cluster = as.data.frame(t(fit_res$contribution))
#cluster
# cluster samples based on eucledian distance between relative contribution
dista <- hclust(dist(df_cluster), method = "complete")
# order samples according to clustering
sample_order = rownames(df_cluster)[dista$order]
#include dendogram
#dhc <- as.dendrogram(dista) 
#plot(dhc)
#dhc_gg <- ggplot(dhc, horiz = T,labels = FALSE) 

fit_res_melt = melt(fit_res$contribution[select,])
colnames(fit_res_melt) = c("Signature", "Sample", "Contribution")

df_cluster$sample = rownames(df_cluster)
df_cluster_melt = melt(df_cluster,id=c("sample"))
colnames(df_cluster_melt) = c("Sample","Signature","Contribution")
df_cluster_melt <- within(df_cluster_melt, Sample <- factor(Sample,levels=sample_order))

#set colors
ggplot(data = df_cluster_melt, aes(x = factor(Sample), y = Contribution, fill = factor(Signature),order = Sample))+ 
  geom_bar(position="fill",stat = "identity", width = 1) + #position="fill",
  # white background
  theme_bw() +
  # no gridlines
  theme(panel.grid.minor.x=element_blank(),
        panel.grid.major.x=element_blank()) +
  theme(panel.grid.minor.y=element_blank(),
        panel.grid.major.y=element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x = "Sample", y = "Absolute contribution \n (no. mutations)") +
  guides(fill=guide_legend(title="Signature")) +
  scale_fill_manual(values = colorpalette,name= "Signature")

########################
#######################


#!/usr/bin/env Rscript
library(GenomicRanges)
library(VariantAnnotation)
library(ggplot2)
library(reshape2)
library(BSgenome)
#available.genomes()[1:5]
#source("https://bioconductor.org/biocLite.R")
#biocLite("BSgenome.Hsapiens.UCSC.hg19")
ref_genome <- "BSgenome.Hsapiens.UCSC.hg19"
library(ref_genome, character.only = TRUE)
library(MutationalPatterns)
library(dplyr)
library(grid)
library(gridExtra)
COLORS6 = c(
  "#2EBAED", "#000000", "#DE1C14",
  "#D4D2D2", "#ADCC54", "#F0D0CE")

COLORS7 = c(
  "#2EBAED", "#000000", "#DE1C14",
  "#E98C7B", "#D4D2D2", "#ADCC54",
  "#F0D0CE")

SUBSTITUTIONS = c('C>A','C>G','C>T','T>A','T>C','T>G')
SUBSTITUTIONS_96 = rep(SUBSTITUTIONS, each=16)
SUBSTITUTIONS_192 = rep(SUBSTITUTIONS, each=32)

C_TRIPLETS = c(
  "ACA", "ACC", "ACG", "ACT",
  "CCA", "CCC", "CCG", "CCT",
  "GCA", "GCC", "GCG", "GCT",
  "TCA", "TCC", "TCG", "TCT")

T_TRIPLETS = c(
  "ATA", "ATC", "ATG", "ATT",
  "CTA", "CTC", "CTG", "CTT",
  "GTA", "GTC", "GTG", "GTT",
  "TTA", "TTC", "TTG", "TTT")

CONTEXTS_96 = c(rep(C_TRIPLETS, 3), rep(T_TRIPLETS, 3))

# combine substitutions and context in one 
TRIPLETS_96 = paste(substr(CONTEXTS_96,1,1), "[", SUBSTITUTIONS_96, "]", substr(CONTEXTS_96,3,3), sep = "")

STRAND = rep(c("U","T"), 96)
DNA_BASES = c("A", "C", "G", "T")

colorpalette = c("Signature.1" =  '#8dd3c7',
                 "Signature.2" =  '#ffffb3',
                 "Signature.3" =  '#bebada',
                 "Signature.4" =  '#fb8072',
                 "Signature.5" =  '#80b1d3',
                 "Signature.6" =  '#fdb462',
                 "Signature.7" =  '#b3de69',
                 "Signature.8" =  '#fccde5',
                 "Signature.9" =  '#d9d9d9',
                 "Signature.10" = '#ff1417' ,
                 "Signature.11" = '#ff6611' ,
                 "Signature.12" = '#c4ff00' ,
                 "Signature.13" = '#ff8844' ,
                 "Signature.14" = '#ffee55' ,
                 "Signature.15" = '#ffff99' ,
                 "Signature.16" = '#78FA37' ,
                 "Signature.17" = '#aacc22' ,
                 "Signature.18" = '#bbdd77' ,
                 "Signature.19" = '#c8cf82' ,
                 "Signature.20" = '#92a77e' ,
                 "Signature.21" = '#5599ee' ,
                 "Signature.22" = '#0088cc' ,
                 "Signature.23" = '#226688' ,
                 "Signature.24" = '#175279' ,
                 "Signature.25" = '#557777' ,
                 "Signature.26" = '#ddbb33' ,
                 "Signature.27" = '#d3a76d' ,
                 "Signature.28" = '#a9834b' ,
                 "Signature.29" = '#aa6688',
                 "Signature.30" = '#767676',
                 "Signature.A" = '#458B00' ,
                 "Signature.B" = '#D2691E' ,
                 "Signature.C" = '#6495ED' ,
                 "Signature.D" = '#A2CD5A' ,
                 "Signature.E" = '#CD3333' ,
                 "Signature.F" = '#7AC5CD' ,
                 "Signature.G" = '#009ACD' ,
                 "Signature.H" = '#CD2626' ,
                 "Signature.I" = '#FFB90F' ,
                 "Signature.J" = '#76EEC6' ,
                 "Signature.K" = '#EEB422' ,
                 "Signature.L" = '#97FFFF' ,
                 "Signature.M" = '#E9967A' ,
                 "Signature.N" = '#5F9EA0')
bed_to_granges = function(bed_file)
{
  bed = read.table(bed_file, header = F, stringsAsFactors = F)
  chr = paste("chr", bed[,1], sep="")
  # Convert BED (0-based) start postion to Granges (1-based)
  start = bed[,2] + 1
  # In BED end position is excluded, in Granges end position is included -> +1 -1 -> no conversion needed
  end = bed[,3]
  GR = GRanges(chr, IRanges(start,end))  
  return(GR)
}

#compare SNVs
vcf_list <- list.files("~/surfdrive/projects/Colon_MSI_organoids/colon_MSI/somatic_mutations_march_2019/56_57/", pattern = ".vcf.gz$", full.names = TRUE)
vcf_files_names <- sub("/Users/avanhoeck/surfdrive/projects/Colon_MSI_organoids/colon_MSI/somatic_mutations_march_2019/56_57//","",vcf_list)
vcf_files_names <- sub("_post_processed_PASS.vcf.gz","",vcf_files_names)

vcfs_MSI <- read_vcfs_as_granges(vcf_list, vcf_files_names, genome = ref_genome)


library(VariantAnnotation)

MSI_GRList = list()  
for(i in 1:length(vcf_list)){
  # Read vcf files with VariantAnnotation
  vcf_object = readVcf(vcf_list[i], "hg19")
  seqlevels(vcf_object) <- paste("chr", seqlevels(vcf_object), sep="")
  # predict coding effects
  #coding_GR = predictCoding(vcf_object, txdb, seqSource = Hsapiens)
  # store result in list
  MSI_GRList[[i]] = vcf_object
}

names(MSI_GRList) = vcf_files_names
length(rowRanges(MSI_GRList$N57T_T57T))

length(rowRanges(MSI_GRList$N41_T41))
length(rowRanges(MSI_GRList$`N41_T41-1`))
length(rowRanges(MSI_GRList$`N41_T41-3`))
length(rowRanges(MSI_GRList$`N41_T41-4`))
length(rowRanges(MSI_GRList$`N41_T41-5`))
length(rowRanges(MSI_GRList$`N40T_T41-1`))
length(rowRanges(MSI_GRList$`N40T_T41-3`))
length(rowRanges(MSI_GRList$`N40T_T41-4`))
length(rowRanges(MSI_GRList$`N40T_T41-5`))

length(intersect(rowRanges(MSI_GRList$N41_T41),rowRanges(MSI_GRList$`N41_T41-1`)))
length(intersect(rowRanges(MSI_GRList$N41_T41),rowRanges(MSI_GRList$`N41_T41-3`)))
length(intersect(rowRanges(MSI_GRList$N41_T41),rowRanges(MSI_GRList$`N41_T41-4`)))
length(intersect(rowRanges(MSI_GRList$N41_T41),rowRanges(MSI_GRList$`N41_T41-5`)))


length(intersect(rowRanges(MSI_GRList$`N41_T41-1`),rowRanges(MSI_GRList$`N41_T41-3`)))
length(intersect(rowRanges(MSI_GRList$`N41_T41-1`),rowRanges(MSI_GRList$`N41_T41-4`)))
length(intersect(rowRanges(MSI_GRList$`N41_T41-1`),rowRanges(MSI_GRList$`N41_T41-5`)))

length(intersect(rowRanges(MSI_GRList$`N41_T41-3`),rowRanges(MSI_GRList$`N41_T41-4`)))
length(intersect(rowRanges(MSI_GRList$`N41_T41-3`),rowRanges(MSI_GRList$`N41_T41-5`)))

length(intersect(rowRanges(MSI_GRList$`N41_T41-4`),rowRanges(MSI_GRList$`N41_T41-5`)))




# write the muts to data.frame
coding_df = data.frame()
for(i in 1:length(MSI_GRList)){
  temp = MSI_GRList[[i]]
  temp2 = rowRanges(temp)
  
  temp2 <- temp2[sapply(temp2$ALT, length) == 1]
  temp2$ALT <- unlist(temp2$ALT)
  
  temp2 <- as.data.frame(temp2)
  
  temp2 %>% dplyr::select(seqnames,start,end,REF,ALT)
  rownames(temp2) =NULL
  temp2['sampleId'] = names(MSI_GRList[i])
  temp2 <- temp2 %>% dplyr::select(sampleId,seqnames,start,end,REF,ALT)
  coding_df = rbind(coding_df, temp2)
}
unique(coding_df)



library(dndscv)
mutations <- coding_df[,c("sampleId","seqnames","start", "REF","ALT")]
colnames(mutations) <- c("sampleID", "chr", "pos", "ref", "mut")
mutations$chr <- substr(mutations$chr, 4, nchar(as.vector(mutations$chr)))
dndsout = dndscv(mutations)
annotmuts_MSI <-dndsout$annotmuts
write.table(as.data.frame(dndsout$annotmuts), file = "~/surfdrive/projects/Colon_MSI_organoids/annotation_table.txt",sep = "\t", col.names = NA,qmethod = "double", quote = FALSE)


sel_cv_5FU <- sel_cv
signif_genes_5FU = sel_cv_5FU[sel_cv_5FU$qglobal_cv<0.1, c("gene_name","qglobal_cv")]

annotmuts_MSI[which(annotmuts_MSI$gene %in% c("MSH2","MSH3","MLH3", "MLH1","MSH3", "MSH6","PMS1","PMS2", "POLE","POLD1")),]

####
###
#script from dndsCV
#####
data("refcds_hg19", package="dndscv")
GR_genes
gene_list
gene_list = sapply(RefCDS, function(x) x$gene_name)
data(list=sprintf("cancergenes_%s",kc), package="dndscv")


nt = c("A","C","G","T")
trinucs = paste(rep(nt,each=16,times=1),rep(nt,each=4,times=4),rep(nt,each=1,times=16), sep="")
trinucinds = setNames(1:64, trinucs)
trinucsubs = NULL
for (j in 1:length(trinucs)) {
  trinucsubs = c(trinucsubs, paste(trinucs[j], paste(substr(trinucs[j],1,1), setdiff(nt,substr(trinucs[j],2,2)), substr(trinucs[j],3,3), sep=""), sep=">"))
}
trinucsubsind = setNames(1:192, trinucsubs)
ind = setNames(1:length(RefCDS), sapply(RefCDS,function(x) x$gene_name))
gr_genes_ind = ind[gr_genes$names]

mutations$end = mutations$start = mutations$pos
l = nchar(mutations$ref)-1
mutations$end = mutations$end + l
ind = substr(mutations$ref,1,1)==substr(mutations$mut,1,1) & nchar(mutations$ref)>nchar(mutations$mut) # Position correction for deletions annotated in the previous base (e.g. CA>C)
mutations$start = mutations$start + ind


# Mapping mutations to genes
gr_muts = GenomicRanges::GRanges(mutations$chr, IRanges::IRanges(mutations$start,mutations$end))
ol = as.matrix(GenomicRanges::findOverlaps(gr_muts, gr_genes, type="any", select="all"))
mutations = mutations[ol[,1],] # Duplicating subs if they hit more than one gene
mutations$geneind = gr_genes_ind[ol[,2]]
mutations$gene = sapply(RefCDS,function(x) x$gene_name)[mutations$geneind]
mutations = unique(mutations)
mutations %>% dplyr::filter(sampleID=="N41_T41") %>% count()

mutations_back = mutations
nsampl = sort(table(mutations$sampleID))
exclsamples = NULL
if (any(nsampl>max_coding_muts_per_sample)) {
  message(sprintf('    Note: %0.0f samples excluded for exceeding the limit of mutations per sample',sum(nsampl>max_coding_muts_per_sample)))
  exclsamples = names(nsampl[nsampl>max_coding_muts_per_sample])
  mutations = mutations[!(mutations$sampleID %in% names(nsampl[nsampl>max_coding_muts_per_sample])),]
}



mutations$strand = sapply(RefCDS,function(x) x$strand)[mutations$geneind]
snv = (mutations$ref %in% nt & mutations$mut %in% nt)

if (!any(snv)) { stop("Zero coding substitutions found in this dataset. Unable to run dndscv.") }
indels = mutations[!snv,]
mutations = mutations[snv,]
mutations$ref_cod = mutations$ref
mutations$mut_cod = mutations$mut
compnt = setNames(rev(nt), nt)
isminus = (mutations$strand==-1)
mutations$ref_cod[isminus] = compnt[mutations$ref[isminus]]
mutations$mut_cod[isminus] = compnt[mutations$mut[isminus]]

for (j in 1:length(RefCDS)) {
  RefCDS[[j]]$N = array(0, dim=c(192,4)) # Initialising the N matrices
}

# Subfunction: obtaining the codon positions of a coding mutation given the exon intervals

chr2cds = function(pos,cds_int,strand) {
  if (strand==1) {
    return(which(unlist(apply(cds_int, 1, function(x) x[1]:x[2])) %in% pos))
  } else if (strand==-1) {
    return(which(rev(unlist(apply(cds_int, 1, function(x) x[1]:x[2]))) %in% pos))
  }
}

ref3_cod = mut3_cod = wrong_ref = aachange = ntchange = impact = codonsub = array(NA, nrow(mutations))
numcode = 1
for (j in 1:nrow(mutations)) {
  
  geneind = mutations$geneind[j]
  pos = mutations$pos[j]
  
  if (any(pos == RefCDS[[geneind]]$intervals_splice)) { # Essential splice-site substitution
    
    impact[j] = "Essential_Splice"; impind = 4
    pos_ind = (pos==RefCDS[[geneind]]$intervals_splice)
    cdsnt = RefCDS[[geneind]]$seq_splice[pos_ind]
    ref3_cod[j] = sprintf("%s%s%s", RefCDS[[geneind]]$seq_splice1up[pos_ind], RefCDS[[geneind]]$seq_splice[pos_ind], RefCDS[[geneind]]$seq_splice1down[pos_ind])
    mut3_cod[j] = sprintf("%s%s%s", RefCDS[[geneind]]$seq_splice1up[pos_ind], mutations$mut_cod[j], RefCDS[[geneind]]$seq_splice1down[pos_ind])
    aachange[j] = ntchange[j] = codonsub[j] = "."
    
  } else { # Coding substitution
    
    pos_ind = chr2cds(pos, RefCDS[[geneind]]$intervals_cds, RefCDS[[geneind]]$strand)
    cdsnt = RefCDS[[geneind]]$seq_cds[pos_ind]
    ref3_cod[j] = sprintf("%s%s%s", RefCDS[[geneind]]$seq_cds1up[pos_ind], RefCDS[[geneind]]$seq_cds[pos_ind], RefCDS[[geneind]]$seq_cds1down[pos_ind])
    mut3_cod[j] = sprintf("%s%s%s", RefCDS[[geneind]]$seq_cds1up[pos_ind], mutations$mut_cod[j], RefCDS[[geneind]]$seq_cds1down[pos_ind])
    codon_pos = c(ceiling(pos_ind/3)*3-2, ceiling(pos_ind/3)*3-1, ceiling(pos_ind/3)*3)
    old_codon = as.character(as.vector(RefCDS[[geneind]]$seq_cds[codon_pos]))
    pos_in_codon = pos_ind-(ceiling(pos_ind/3)-1)*3
    new_codon = old_codon; new_codon[pos_in_codon] = mutations$mut_cod[j]
    old_aa = seqinr::translate(old_codon, numcode = numcode)
    new_aa = seqinr::translate(new_codon, numcode = numcode)
    aachange[j] = sprintf('%s%0.0f%s',old_aa,ceiling(pos_ind/3),new_aa)
    ntchange[j] = sprintf('%s%0.0f%s',mutations$ref_cod[j],pos_ind,mutations$mut_cod[j])
    codonsub[j] = sprintf('%s>%s',paste(old_codon,collapse=""),paste(new_codon,collapse=""))
    
    # Annotating the impact of the mutation
    if (new_aa == old_aa){ 
      impact[j] = "Synonymous"; impind = 1
    } else if (new_aa == "*"){
      impact[j] = "Nonsense"; impind = 3
    } else if (old_aa != "*"){
      impact[j] = "Missense"; impind = 2
    } else if (old_aa=="*") {
      impact[j] = "Stop_loss"; impind = NA
    }
  }
  
  if (mutations$ref_cod[j] != as.character(cdsnt)) { # Incorrect base annotation in the input mutation file (the mutation will be excluded with a warning)
    wrong_ref[j] = 1
  } else if (!is.na(impind)) { # Correct base annotation in the input mutation file
    trisub = trinucsubsind[ paste(ref3_cod[j], mut3_cod[j], sep=">") ]
    RefCDS[[geneind]]$N[trisub,impind] = RefCDS[[geneind]]$N[trisub,impind] + 1 # Adding the mutation to the N matrices
  }
  
  if (round(j/1e4)==(j/1e4)) { message(sprintf('    %0.3g%% ...', round(j/nrow(mutations),2)*100)) }
}




mutations$ref3_cod = ref3_cod
mutations$mut3_cod = mut3_cod
mutations$aachange = aachange
mutations$ntchange = ntchange
mutations$codonsub = codonsub
mutations$impact = impact
mutations$pid = sapply(RefCDS,function(x) x$protein_id)[mutations$geneind]

if (any(nrow(indels))) { # If there are indels we concatenate the tables of subs and indels
  indels = cbind(indels, data.frame(ref_cod=".", mut_cod=".", ref3_cod=".", mut3_cod=".", aachange=".", ntchange=".", codonsub=".", impact="no-SNV", pid=sapply(RefCDS,function(x) x$protein_id)[indels$geneind]))
  
  # Annotation of indels
  ins = nchar(gsub("-","",indels$ref))<nchar(gsub("-","",indels$mut))
  del = nchar(gsub("-","",indels$ref))>nchar(gsub("-","",indels$mut))
  multisub = nchar(gsub("-","",indels$ref))==nchar(gsub("-","",indels$mut)) # Including dinucleotides
  l = nchar(gsub("-","",indels$ref))-nchar(gsub("-","",indels$mut))
  indelstr = rep(NA,nrow(indels))
  for (j in 1:nrow(indels)) {
    geneind = indels$geneind[j]
    pos = indels$start[j]:indels$end[j]
    if (ins[j]) { pos = c(pos-1,pos) } # Adding the upstream base for insertions
    pos_ind = chr2cds(pos, RefCDS[[geneind]]$intervals_cds, RefCDS[[geneind]]$strand)
    if (length(pos_ind)>0) {
      inframe = (length(pos_ind) %% 3) == 0
      if (ins[j]) { # Insertion
        indelstr[j] = sprintf("%0.0f-%0.0f-ins%s",min(pos_ind),max(pos_ind),c("frshift","inframe")[inframe+1])
      } else if (del[j]) { # Deletion
        indelstr[j] = sprintf("%0.0f-%0.0f-del%s",min(pos_ind),max(pos_ind),c("frshift","inframe")[inframe+1])
      } else { # Dinucleotide and multinucleotide changes (MNVs)
        indelstr[j] = sprintf("%0.0f-%0.0f-mnv",min(pos_ind),max(pos_ind))
      }
    }
  }
  indels$ntchange = indelstr
  annot = rbind(mutations, indels)
} else {
  annot = mutations
}
annot = annot[order(annot$sampleID, annot$chr, annot$pos),]
