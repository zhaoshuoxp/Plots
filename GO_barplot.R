#!/usr/bin/env Rscript
#####################################
# Usage:                            #
# Manual:                           #
#####################################
library("ggplot2")
options<-commandArgs(trailingOnly = T)
plot_heigh<-5
plot_width<-7
png_name<-unlist(strsplit(options[1],'.',fixed=T))[1]
png(file=paste(png_name,'png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

dat<-read.table(file=options[1],header=T,sep="\t")
# keep original reversed order of $Term
dat<- dat[seq(dim(dat)[1],1),]
dat<-transform(dat,Term=factor(Term,levels=unique(Term)))

#5FBBA3 brightgreen
#4169A0 darkblue
#C96486 pink

pic<-ggplot(dat,aes(x=Term,y=-1*log(Pvalue),fill = group))+
	geom_bar(stat= 'identity')+
	#ploar bar
	#coord_polar(theta = "x")+
	#flip X-Y axis
	coord_flip()+
	#scale_fill_manual(values=c("#f17e2e","#4bb7e2"))+
	#theme_bw()+
	theme(
		legend.position = c(0.75,0.08),
		legend.text = element_text(size=10), 
		legend.title = element_blank(), 
		legend.background = element_rect(fill="transparent"),
		axis.text.y = element_text(size=12,colour = 'black'),
		axis.title.x = element_text(size=13,colour = 'black'),
		axis.text.x = element_text(size=12,colour = 'black')
		)+
	xlab("")+
	ylab("-log P-value")
	
pic
dev.off()

################ END ################
#          Created by Aone          #
#     quanyi.zhao@stanford.edu      #
################ END ################