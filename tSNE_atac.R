#TSNE plots
library(ggplot2)

tsne_mm100 <- as.data.frame(read.csv("projectionmm100.csv",header=T))


pg <- ggplot(data=tsne_mm100,aes(x = TSNE.1,y = TSNE.2,col=as.factor(Cluster))) +
  geom_point(size=0.25) +
  scale_colour_manual(values = c("#4299AA","#DEA9BB","#887643","#1B8968","#444466","#77EF88","#E2DA35")) + #formerly EF8877
  theme_classic()

ggsave(file="tsne_mm100_newcolor.svg",plot=pg, height = 4,width=5)


#AD0038

tsne_mm101 <- as.data.frame(read.csv("projectionmm101.csv",header=T))


pg1 <- ggplot(data=tsne_mm101,aes(x = TSNE.1,y = TSNE.2,col=as.factor(Cluster))) +
  geom_point(size=0.25) +
  scale_colour_manual(values = c("#4299AA","#EF8877","#887643","#1B8968","#444466","#DEA9BB","#E2DA35","#AD0038","#A3A6A9")) +
  theme_classic()

ggsave(file="tsne_mm101.svg",plot=pg1, height = 4, width=5)


tsne_mm99 <- as.data.frame(read.csv("projectionmm99.csv",header=T))


pg2 <- ggplot(data=tsne_mm99,aes(x = TSNE.1,y = TSNE.2,col=as.factor(Cluster))) +
  geom_point(size=0.25) +
  scale_colour_manual(values = c("#4299AA","#DEA9BB","#887643","#1B8968","#444466","#EF8877","#E2DA35")) +
  theme_classic()

ggsave(file="tsne_mm99.svg",plot=pg2, height = 4,width=5)