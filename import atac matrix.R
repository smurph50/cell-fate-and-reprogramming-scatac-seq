## atac seq data
setwd("/Users/YourDirectory")

#import MGT matrix
library(Matrix)
library(readr)
mtx <- readMM("mm100mgt1matrix.mtx")
barcodes <- as.vector(read.table("mm100mgt1barcodes.tsv",colClasses = "character")[,1]) #here, barcodes are the individual cell names
barcodes_c2 <- as.vector(read.csv("cluster2.csv",header=TRUE,colClasses = "character")[,1]) #subsetting to our cluster of interest, 2
not_c2 <- setdiff(barcodes,barcodes_c2)
colnames(mtx) <- barcodes

mtx_c2 <- mtx[,colnames(mtx) %in% barcodes_c2[,1]] #cluster 2 cells
`%notin%` <- Negate(`%in%`)
mtx_ee <- mtx[,colnames(mtx) %notin% barcodes_c2[,1]] #everything else


#subset singlecell.csv
scmat <- read.csv("singlecellmm100.csv",header=TRUE)

scmat_c2 <- scmat[scmat$barcode %in% barcodes_c2,]
write.csv(scmat_c2,"singlecell_c2.csv")

scmat_notc2 <- scmat[scmat$barcode %in% not_c2,]
write.csv(scmat_notc2,"singlecell_notc2.csv")

