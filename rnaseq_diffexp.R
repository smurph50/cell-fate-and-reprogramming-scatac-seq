#RNA-seq 
library(DESeq2)

countTable <- read.csv("raw_counts.csv", row.names=1, header=T)

samples <- data.frame(row.names=c("mgt1","mgt2","mgt_siAJSZ_1","mgt_siAJSZ_2"),
                      condition=as.factor(c(rep("MGT",2),rep("MGT_siAJSZ",2))))

colnames(countTable)
bckCDS <- DESeqDataSetFromMatrix(countData = countTable, colData=samples, design=~condition)

dds <- DESeq(bckCDS)
res <- results(dds)

rld <- rlog(dds, blind = FALSE)
plotPCA(rld)
write.csv(res, "degenes_MGT_siAJSZ.csv")



