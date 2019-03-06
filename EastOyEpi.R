
library(ggplot2)

info <- read.csv("/Users/hputnam/MyProjects/EastOyEpi/data/sample.info.csv", header=TRUE, sep=",", na.string="NA", stringsAsFactors = FALSE)
data1 <- read.csv("/Users/hputnam/MyProjects/EastOyEpi/data/ID_CpG_labelled_all.sorted", header=TRUE, sep="", na.string="NA", stringsAsFactors = FALSE)
row.names(data1) <- data1$ID
data1 <- data1[,-1]
data <- t(data1)
pca.all <- prcomp(data, retx=TRUE)
summary(pca.all)
ev <- pca.all$sdev^2
plot(ev)
screeplot(pca.all, type="lines")
PC.scores <- as.data.frame(pca.all$x)
PC.scores <- PC.scores[,1:2] #select first two components

cols <- c("#FF00FF", "#6ee078", "#0d9312", "#7fcdff", "#76b6c4", "#77c442", "#8ccd99", 
          "#5d4a36", "#8d8072", "#1da2d8", "#064273", "#698dab", "#167729", "#105d1f", "#ff1818")

group <- info$Pop.ID
type <- info$Wild.Sel
cc <- row.names(PC.scores)

plot(PC.scores$PC1, PC.scores$PC2, xlab="PC1", ylab="PC2", cex=1.3, col=cols)

ggplot(PC.scores,aes(x=PC1,y=PC2,color=cc)) +
  geom_point()+
  geom_text(aes(label=cc),hjust=0, vjust=0)



