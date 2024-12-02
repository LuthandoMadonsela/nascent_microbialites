###Figure 6
#Generating barplot of Conserved OTUs (2019-2022) 

library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(vegan)
library(grid)

#Read in data
data <- read.csv(file = "Conserved_OTUs.txt", header=T, sep="\t")

#convert data frame from a "wide" format to a "long" format
melted_data = melt(data, id = c("Sample"))

#Keep samples ordered the way they're ordered in the data
melted_data$Sample <- factor(melted_data$Sample,levels=unique(melted_data$Sample))

#Making a nice palette with distinctive colours
n <- 7
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

#Generating plot
barplot = ggplot(melted_data, aes(x = Sample, fill = forcats::fct_rev(variable), y = value)) + 
  geom_bar(stat = "identity") + 
  theme(panel.background = element_blank(), axis.text.x = element_text(angle = 90, size = 6, colour = "black", vjust = 0.5, hjust = 1), 
        axis.title.y = element_text(size = 10), legend.title = element_text(size = 16), 
        axis.text.y = element_text(colour = "black", size = 10, face = "bold")) + 
  scale_y_continuous(expand = c(0,0)) + 
  theme(legend.position = "none") +
  scale_fill_manual(values = rep(palette,20))+
  labs(x = "Sample", y = "Relative Abundance (%)", fill = "OTU")

barplot