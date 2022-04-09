rm(list=ls())
library("Biobase")
library(limma)

## Load Expression data
exprs <- read.table("transcriptomics.tsv",sep="\t",header=TRUE,stringsAsFactors=F,row.names=1,as.is=TRUE,check.names=FALSE)

## Genes of interest 
link_goi = c('NFAT5', 'NFKB1', 'ADAM28', 'F7', 'PDGFRL', 'ADAMTS6', 'CTSF', 'NCF4', 'ADAMTS4', 'CTSB', 'ITGB2', 'FGF22', 'ADAMTS14', 'IFNE1', 'ATP2A3', 'SMAD9', 'FGF11', 'FGF14', 'ADAMTS2', 'MMP15', 'MPO', 'NFE2L2', 'ADAMTS12', 'COL10A1', 'ADAM6', 'FGFR2', 'CTSA', 'ORAI1', 'COLEC12', 'COL6A6', 'PTGER1', 'PTGER4', 'NFATC1', 'COLEC11', 'CTSC', 'IFNA1', 'COL24A1', 'MMP7', 'KCNN4', 'OAS1', 'FGG', 'FGD2', 'NCF1B', 'FCN3', 'FGD1', 'NCF1', 'CD33', 'MMP1', 'MMP23B', 'FGF12', 'FGF21', 'SMAD7', 'TLR2', 'VDR', 'FGFR1OP', 'PDGFA', 'KEAP1', 'FGGY', 'F3', 'CTSL1', 'CTSO', 'ORAI3', 'ADAMTS20', 'FGD6', 'COL9A2', 'TGM2', 'TREML1', 'TNXB', 'TMEM66', 'TXNIP', 'CYP27B1', 'PDGFRB', 'FGFBP1', 'FGFR4', 'MMP11', 'IFNA6', 'ADAM3A', 'F13A1', 'ADAMTS16', 'ADAMTS3', 'SMAD3', 'STIM1', 'FGF5', 'F2R', 'ALOX12P2', 'ADAM5P', 'ICAM2', 'SPTLC2', 'LOXL2', 'IFNA2', 'ADAMTS8', 'COL14A1', 'FGFR3', 'FGR', 'NCF2', 'COL17A1', 'COL28A1', 'P2RX7', 'MMP21', 'ADAM32', 'COL1A2', 'LOXL1', 'ADAMTS9', 'ACTA2', 'F12', 'COL4A4', 'MMP19', 'IFNA5', 'ADAMTS13', 'TLR8', 'IFNA21', 'TIMP1', 'COL1A1', 'MYOF', 'ADAMTSL5', 'HMOX2', 'DCN', 'NFATC3', 'CTSD', 'CMIP', 'F5', 'OASL', 'LOXL4', 'VEGFA', 'PDGFC', 'COL11A2', 'COL25A1', 'FGF13', 'F11', 'TNFSF14', 'ADAM21P', 'ADAMTS7', 'F2RL2', 'ADAMTS15', 'COL23A1', 'COL6A3', 'TLR1', 'FAP', 'MMP12', 'PDGFRA', 'NFATC4', 'OAS3', 'COL4A1', 'MMP28', 'CTSW', 'COL4A6', 'COL5A1', 'ORAI2', 'TREML2P', 'ADAM23', 'ADAM29', 'FGF16', 'ADAM7', 'FBN1', 'FGF3', 'MMP27', 'FGF8', 'FGF2', 'CTSE', 'NFATC2', 'FGF17', 'F2RL3', 'ELANE', 'COL6A2', 'FIGF', 'F8A3', 'FGFR1', 'TIMP3', 'HIF1A', 'MMPL1', 'CAT', 'SPHK1', 'FCN1', 'PTGER2', 'IFNA10', 'NOX5', 'FGF18', 'PDGFD', 'TLR9', 'CYP2R1', 'F8', 'FGA', 'POSTN', 'NLRP3', 'ADAM9', 'STIM2', 'MMP20', 'COL28', 'COL4A3BP', 'JAK1', 'ADAM21', 'TLR5', 'OAS2', 'ADAM2', 'RNF5', 'IFNA4', 'CYP24A1', 'ADAMTSL3', 'MMP3', 'MMP9', 'COL6A1', 'TLR6', 'IFNB1', 'ADAM19', 'ALOXE3', 'F2', 'PTGER3', 'CTSH', 'IFNA16', 'COL21A1', 'TREM2', 'GNLY', 'FGF10', 'CTSL2', 'FGL2', 'SMAD2', 'F9', 'NOX4', 'SPI1', 'F10', 'COL27A1', 'ADAM20', 'MMP2', 'NFATC2IP', 'ADAMTSL4', 'F2RL1', 'ALOX15B', 'FGF7', 'FGF20', 'ADAM17', 'CTSL3', 'ADAMTS18', 'TNFRSF18', 'COL4A3', 'IFNE', 'TLR10', 'COLQ', 'ORMDL3', 'ORMDL2', 'IFNA13', 'MMP10', 'ATP2A2', 'COL16A1', 'COL11A1', 'TREML4', 'F11R', 'SERPINE1', 'TLR4', 'FGL1', 'PDGFB', 'ADAM10', 'ELN', 'TIMP4', 'ADAM15', 'ADAMDEC1', 'FGD5', 'TNFSF10', 'COL8A2', 'IFNA17', 'COL4A2', 'IFNA7', 'PLAT', 'PRF1', 'PLAU', 'MMP25', 'COL9A3', 'COL15A1', 'NKG7', 'ATP2A1', 'TIMP2', 'CD69', 'FGF1', 'PLG', 'NOX1', 'FGB', 'MMP24', 'COL5A3', 'COL22A1', 'COL7A1', 'ADAMTS5', 'NOX3', 'COL12A1', 'ADAM22', 'SMAD4', 'SERPINA1', 'FUT4', 'FGF9', 'ADAM30', 'SPTLC1', 'COL20A1', 'FGFR1OP2', 'CTSS', 'COL4A5', 'FGF6', 'FGD4', 'FGF23', 'HMOX1', 'KDR', 'COL8A1', 'ADAM11', 'IFNK', 'SMAD6', 'TLR3', 'TREML2', 'COL5A2', 'VEGFC', 'CTSK', 'ALOX5AP', 'CTLA4', 'COL29A1', 'MMP26', 'FGFBP3', 'FOXO3', 'CTSZ', 'ORMDL1', 'FGFRL1', 'IFNA14', 'MMP16', 'ALOX12', 'COL3A1', 'ADAMTSL1', 'FGFBP2', 'NOXO1', 'FCN2', 'MMP8', 'F8A1', 'ADAM33', 'ADAMTSL2', 'FGF19', 'SMAD1', 'SMAD5', 'COL18A1', 'COL2A1', 'ADAM18', 'COL13A1', 'ADAMTS17', 'F8A2', 'TREM1', 'FLT4', 'F13B', 'TYK2', 'COL19A1', 'ROMO1', 'CD47', 'COL9A1', 'SESN1', 'ALOX12B', 'IFNW1', 'ADAM8', 'NCF1C', 'ADAMTS10', 'MMP23A', 'FN1', 'PLAUR', 'TLR7', 'SP1', 'SPTLC3', 'COLEC10', 'FGF4', 'ADAMTS1', 'ADAMTS19', 'FGD3', 'MMP14', 'ADAM12', 'CTSG', 'ICAM1', 'MMP13', 'ATF6', 'CCL11', 'LOXL3')
exprs <- exprs[link_goi,]


exprs <- data.matrix(exprs)

## Load phenotype meta data
pData <- read.table("neu_meta.tsv",sep="\t",header=TRUE,stringsAsFactors=F,row.names=1,as.is=TRUE,check.names=FALSE)
intersec = intersect(row.names(pData),colnames(exprs))
exprs <- exprs[,intersec]
pData<-pData[intersec,]


phenoData <- new("AnnotatedDataFrame",data=pData)
all(rownames(pData)==colnames(exprs))

minimalSet <- ExpressionSet(assayData=exprs, phenoData=phenoData)

age <- phenoData$age
gender <- phenoData$gender

tmp <- phenoData$neu
grp_num <- 'Cluster 3' ## Check Cluster 3

tmp[tmp==grp_num] <- 'Grp_asthma'
tmp[!tmp=='Grp_asthma'] <- 'Control'
groups <- tmp

## Declare design matrix
design <- model.matrix(~1+groups+gender+age)

## Fit model
fit <- lmFit(minimalSet, design)
fit <- eBayes(fit)

dt <- decideTests(fit)
summary(dt)
colnames(fit)

res <-topTable(fit, coef='groupsGrp_asthma', number=Inf, sort.by='p')

## Asthma-COPD (Cluster 3 with link-goi)
link_tmp3 <- head(res, 129)
fcvals_up <- link_tmp3[link_tmp3['logFC']>=0,]
write.table(fcvals_up, file="DE_Link_Cluster3.txt", row.names = TRUE, col.names = TRUE, sep="\t")
