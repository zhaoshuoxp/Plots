#!/usr/bin/env Rscript
############################
# Usage : ./ggplots.R file1 file2 ...
############################
# arguments in command line
library("ggplot2")
options<-commandArgs(trailingOnly = T)
plot_heigh<-4.8
plot_width<-5
png_name<-unlist(strsplit(options[1],'.',fixed=T))[1]
png(file=paste(png_name,'png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

#awk -v OFS="\t" '{if ($14=="yes"){print $8,$9,"Significant"}else if(($8+1)/($9+1)>=2){print $8,$9,"2fold"}else if(($9+1)/($8+1)>=2){print $8,$9,"2fold"}else{print $8,$9,"no_change"}}'

dat<-read.table(file=options[1],header=T)
#dat[,1]<-(dat[,1]*100/(max(dat[,1])-min(dat[,1])))
#dat[,2]<-(dat[,2]*100/(max(dat[,2])-min(dat[,2])))

ggplot(dat,aes(x=log(v1+1),y=log(v2+1),group=sig,colour=sig))+
	geom_jitter(size=1)+	
	theme(
		legend.position = c(0.10,0.90), 
		legend.text = element_text(size=16), 
		legend.title = element_blank(), 
		legend.background = element_rect(fill="transparent"),
		axis.text.y = element_text(size=10,colour = 'black'),
		axis.title = element_text(size=20,colour = 'black'),
		axis.text.x = element_text(size=14,colour = 'black')
		)+
	xlab("logFPKM Ctrl")+
	ylab("logFPKM KD")->pic
pic
dev.off()

################ END ################
#          Created by Aone          #
#     quanyi.zhao@stanford.edu      #
################ END ################