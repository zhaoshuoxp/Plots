#!/usr/bin/env Rscript
options<-commandArgs(trailingOnly = T)
############################
# Usage : ./GO_pathway_barplot.R <pathway.txt> <title> <color>
############################
# arguments in command line
my_data<-read.table(file=options[1],header=T,sep="\t",as.is = T)
term<-my_data$Term
pvalue<-my_data$PValue
term_number<-length(term)
term<-unlist(strsplit(term,split = ":"))
labels<-term[seq(2,term_number*2,by=2)]
pvalue<--log(as.numeric(pvalue))/log(10)
if (length(pvalue) >=10) {
pvalue<-pvalue[1:10]
labels<-labels[1:10]
}
# pvalue labels
labels_len<-nchar(labels)
max_labels_len<-max(labels_len)
pvalue_max=ceiling(max(pvalue))
plot_heigh<-4
plot_width<-7.5
##### barplot of GO analysis #######
png(file=paste(options[2],'png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")
par(mar=c(5,25,5,5))
barplot(rev(pvalue),horiz = T,ylab='',xlab='-log(P value)',cex.lab=2,col=options[3],xlim=c(0,(pvalue_max)),xaxt='n',
        yaxt='n',space=0.5,main=options[2],cex.main=1.5)->pos
axis(side=1,at=seq(0,(pvalue_max)),labels = seq(0,(pvalue_max)),cex.axis=1.5,lwd=3)
mtext(text = rev(labels),side=2,line=1,at=pos,cex=1.5,las=2)
dev.off()
