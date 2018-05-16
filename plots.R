#!/usr/bin/env Rscript
############################
# Usage : ./plots.R ATAC.txt HNF1A.txt SMAD3.txt TCF21.txt
############################
# arguments in command line
options<-commandArgs(trailingOnly = T)
plot_heigh<-4.5
plot_width<-5
png(file=paste('plots','jpeg',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

a<-read.table(file=options[1])
colMeans(a)->a1
h<-read.table(file=options[2])
colMeans(h)->h1
s<-read.table(file=options[3])
colMeans(s)->s1
t<-read.table(file=options[4])
colMeans(t)->t1

plot(t1,lwd =3,col='red2',type='l',ylab='Relative Enrichment',xaxt='n',xlab='',cex.lab=1.3,ylim = c(0,2.5))
lines(h1,col='dodgerblue3',lwd=3)
lines(s1,col='black',lwd=3)
lines(a1,col='green3',lwd=3)
legend('topright',lwd=2,col=c('black','red2','dodgerblue3','green3'),legend=c('SMAD3','TCF21','HNF1A','ATAC'))
axis(side=1,at=c(0,50,100),labels = c('-2kb','0','+2kb'))
dev.off()