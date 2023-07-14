# BOXPLOTS

library(ggpubr)
library(gplots)
library(viridis)
library(hrbrthemes)
library(ggsci)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")
#dyn.load(paste("RIO", .Platform$dynlib.ext, sep=""))



input <- function(inputfile) {
# CHOW DIET
	pfix = prefix()
parameters <- readParameters(inputfile)
assay <<- read.table(paste(pfix, parameters["assay", 2], sep="/"), header = TRUE, sep=',')
species_combined_list <<- readSequential(paste(pfix, parameters["select", 2], sep="/"))
#species_combined_list <- c('X100001022', 'X100001293', 'X100001481', 'X1137', 'X1489', 'X1648', 'X798', 'X999924663', 'X999924712')
}

run <- function() {}

output <- function(outputfile) {
for(species in species_combined_list) {
  print(species)
  
  but_plot <- ggboxplot(assay, x="Group" , y = species,
                        color = "black", palette = "jco", fill="Group") +
    theme(axis.title.x = element_text(size=0, face="bold"), axis.text.x =element_text(size=12, face="bold")) +
    #stat_compare_means(method = 'wilcox.test', comparisons = rev(list(c('Control','WD_Control'),c('GWI','WD_GWI'), c('Control','GWI'),c('WD_Control','WD_GWI')))) + 
    theme_gray() + ylim(-3,5) #+ coord_flip()
  but_plot
  ggsave(paste(species,'.png', sep=''), path=outputfile, plot=but_plot, device = "png", dpi = 300)
}
}

# WD DIET
#assay <- read.table('assay_t.csv', header = TRUE, sep=',')
#species_combined_list <- c('X100000787', 'X100001162', 'X100001501', 'X100002568', 'X100015863', 'X1053', 'X240', 'X999917335', 'X999924669', 'X999924674', 'X999924675')
#
#for(species in species_combined_list) {
#  print(species)
#  
#  but_plot <- ggboxplot(assay, x="Group" , y = species,
#                        color = "black", palette = "jco", fill="Group") +
#    theme(axis.title.x = element_text(size=0, face="bold"), axis.text.x =element_text(size=12, face="bold")) +
    #stat_compare_means(method = 'wilcox.test', comparisons = rev(list(c('Control','WD_Control'),c('GWI','WD_GWI'), c('Control','GWI'),c('WD_Control','WD_GWI')))) + 
#    theme_gray() + ylim(-3,5) #+ coord_flip()
#  but_plot
#  ggsave(paste(species,'.png', sep=''), path='wd/', plot=but_plot, device = "png", dpi = 300)
#}

#
