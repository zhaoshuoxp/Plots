#!/usr/bin/env Rscript
############################
# Usage : ./ggplots.R file1 file2 ...
############################
# arguments in command line
library("ggplot2")
options<-commandArgs(trailingOnly = T)
plot_heigh<-2
plot_width<-5
png_name<-unlist(strsplit(options[1],'.',fixed=T))[1]
png(file=paste(png_name,'png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

dat<-read.table(file=options[1],header=T)

ggplot(dat,aes(x=number,y=count,fill=number))+
	geom_bar(stat= 'identity')+	
	#coord_flip()+
	theme(
		legend.position="none",
		axis.text.y=element_text(size=10,colour = 'black'),
		axis.title = element_text(size=20,colour = 'black'),
		axis.text.x =element_text(size=14,colour = 'black')
		)+
		xlab("Exon number")+
		ylab("Count")->pic
pic
dev.off()

################ END ################
#          Created by Aone          #
#     quanyi.zhao@stanford.edu      #
################ END ################