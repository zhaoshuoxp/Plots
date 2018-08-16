#!/usr/bin/env Rscript
############################
# Usage : ./ggplots.R file1 file2 ...
############################
# arguments in command line
library("ggplot2")
options<-commandArgs(trailingOnly = T)
plot_heigh<-4.5
plot_width<-5
png(file=paste('TCF-JUN-K27','jpeg',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

d1<-read.table(file=options[1])
colMeans(d1)->d1.1
#d1.2<-(d1.1*100/(max(d1.1)-min(d1.1)))

d2<-read.table(file=options[2])
colMeans(d2)->d2.1
#d2.2<-(d2.1*100/(max(d2.1)-min(d2.1)))

d3<-read.table(file=options[3])
colMeans(d3)->d3.1
#dd.2<-(d3.1*100/(max(d3.1)-min(d3.1)))

values<-c(d1.1,d2.1,d3.1)

s1<-rep("JUN",100)
s2<-rep("TCF21",100)
s3<-rep("H3K27ac",100)
sample<-c(s1,s2,s3)

p<-seq(-2000,1999,by=40)
pos<-c(p,p,p)

data.frame(values,sample,pos)->dat
#76b2A3 darkgreen
#3c5488 darkblue
#bc6985 darkpink
ggplot(dat,aes(x=pos,y=values,group=sample,colour=sample))+geom_line(size=0.8)+scale_colour_manual(values=c("firebrick","forestgreen","darkblue"),breaks=c("JUN","TCF21","H3K27ac"))+theme(legend.position=c(0.85,0.9), legend.text = element_text(size=16), axis.text.y=element_text(size=10,colour = 'black'),axis.title = element_text(size=20,colour = 'black'),axis.text.x =element_text(size=14,colour = 'black'))+xlab("Distance from peaks center (bp)")+ylab("Rel.Enrichment")+ labs(color='') ->pic
pic
dev.off()