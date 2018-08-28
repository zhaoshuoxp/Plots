#!/usr/bin/env Rscript
#####################################
# Usage:                            #
# Manual:                           #
#####################################
library("ggplot2")
options<-commandArgs(trailingOnly = T)
plot_heigh<-4.5
plot_width<-2.5
png_name<-unlist(strsplit(options[1],'.',fixed=T))[1]
png(file=paste(png_name,'png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

dat<-read.table(file=options[1],header=T)

#76b2A3 darkgreen
#4169A0 darkblue
#bc6985 darkpink

pic<-ggplot(dat,aes(x=sample,y=length,fill=sample))+
	geom_boxplot(outlier.colour = NA,notch = T)+
	#geom_violin()+
	ylim(c(0,2500))+
	scale_fill_manual(values=c("#4169A0","#76b2A3"))+
	#theme_bw()+
	theme(
		legend.position="none",
		axis.text.y=element_text(size=10,colour = 'black'),
		axis.title.y = element_text(size=14,colour = 'black'),
		axis.text.x =element_text(size=14,colour = 'black')
		)+
	xlab("")+
	ylab("Peak length")
	
pic
dev.off()

################ END ################
#          Created by Aone          #
#     quanyi.zhao@stanford.edu      #
################ END ################