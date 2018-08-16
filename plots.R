#!/usr/bin/env Rscript
############################
# Usage : ./plots.R ATAC.txt HNF1A.txt SMAD3.txt TCF21.txt
############################
# arguments in command line
options<-commandArgs(trailingOnly = T)
plot_heigh<-4
plot_width<-4
png(file=paste('plots','jpeg',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

a<-read.table(file=options[1])
colMeans(a)->a1
b<-read.table(file=options[2])
colMeans(b)->b1
#c<-read.table(file=options[3])
#colMeans(c)->c1
#d<-read.table(file=options[4])
#colMeans(d)->d1

plot(a1,lwd =3,col='dodgerblue3',type='l',ylab='Relative Enrichment',xaxt='n',xlab='',cex.lab=1.3,ylim=c(0,11))
lines(b1,col='green3',lwd=3)
#lines(c1,col='green3',lwd=3)
#lines(d1,col='black',lwd=3)
legend('topright',lwd=2,col=c('dodgerblue3','green3'),legend=c('Ctrl','siJUN'))
axis(side=1,at=c(0,50,100),labels = c('-2kb','Centre','+2kb'))
dev.off()