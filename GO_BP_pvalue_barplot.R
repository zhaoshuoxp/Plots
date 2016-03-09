#!/usr/bin/env Rscript
options<-commandArgs(trailingOnly = T)
############################
# Usage : ./GO_BP_pvalue_barplot.R <*.txt> <title> <color>
############################
# arguments in command line
my_data<-read.table(file=options[1],header=T,sep="\t",as.is = T)
BP<-my_data[,c(2,5)]
BP_sorted<-BP[order(-log(BP$PValue)/log(10),decreasing = T),]
if(length(BP_sorted[,1]) >= 10) {BP_sorted_top10<-BP_sorted[1:10,]} else {
BP_sorted_top10<-BP_sorted}
labels<-unlist(strsplit(as.character(BP_sorted_top10$Term),split="~"))[seq(2,20,by=2)]
plot_heigh<-5
plot_width<-15
pvalue_max<-ceiling(max(-log10(BP_sorted_top10$PValue)))
##### barplot of GO analysis #######
png(file=paste(options[2],'png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")
par(mar=c(5,50,5,1))
options(digits=1)
barplot(rev(-log(BP_sorted_top10$PValue)/log(10)),horiz = T,ylab='',xlab='-log(P value)',cex.lab=2,col=options[3],xlim=c(0,(pvalue_max+1)),xaxt='n',yaxt='n',space=0.5,main=options[2],cex.main=1.5)->pos
axis(side=1,at=seq(0,(pvalue_max),by=2),labels = seq(0,(pvalue_max),by=2),cex.axis=1.5,lwd=3)
mtext(text = rev(labels),side=2,line=1,at=pos,cex=1.5,las=2)
dev.off()
