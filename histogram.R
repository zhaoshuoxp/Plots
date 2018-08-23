#!/usr/bin/env Rscript
#####################################
# Usage:                            #
# Manual:                           #
#####################################
library("ggplot2")
library('plyr')
options<-commandArgs(trailingOnly = T)
plot_heigh<-4
plot_width<-6
png(file=paste('all','png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

dat<-read.table(file=options[1],header=T)

#76b2A3 darkgreen
#4169A0 darkblue
#bc6985 darkpink
cdat <- ddply(dat, "name", summarise, dist.median=median(dist))
ggplot(dat,aes(x=dist+1,fill=name))+
	geom_histogram(binwidth= 500, position='stack')+
	geom_vline(data=cdat, aes(xintercept=dist.median,color=name), linetype="dashed", size=1)+
	xlim(c(-1000,100000))+
	#scale_y_log10()+
	#ylim(c(0,1000))+
	scale_fill_manual(
		breaks=c("TCF21","JUN"),
		values=c("TCF21"="#76b2A3","JUN"="#bc6985"),
		labels=c("TCF21 to JUN","JUN to TCF21"))+
	scale_color_manual(
		breaks=c("TCF21","JUN"),
		values=c("TCF21"="forestgreen","JUN"="firebrick"),
		labels=c("TCF21 to JUN","JUN to TCF21"))+
	theme(
	 	legend.position=c(0.85,0.91), 
		legend.text = element_text(size=16), 
		legend.title=element_blank(),
		axis.text.y=element_text(size=10,colour = 'black'),
		axis.title = element_text(size=20,colour = 'black'),
		axis.text.x =element_text(size=14,colour = 'black')
	)+
		xlab("Distance to center (bp)")+
		ylab("Count")->pic
	
pic
dev.off()

################ END ################
#          Created by Aone          #
#     quanyi.zhao@stanford.edu      #
################ END ################