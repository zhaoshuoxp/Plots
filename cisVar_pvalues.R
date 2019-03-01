#!/usr/bin/env Rscript
############################
# Usage :
############################
# arguments in command line
options<-commandArgs(trailingOnly = T)
plot_heigh<-5
plot_width<-7
png_name<-unlist(strsplit(options[1],'.',fixed=T))[1]
png(file=paste(png_name,'png',sep='.'),height = plot_heigh, width = plot_width, res=600, units = "in", family="Arial")

dat<-read.table(file=options[1],header=T)
n_row<-dim(dat)[1]
dat$num<-seq(1,n_row)
par(omi=c(0, 0, 0, 0.5))

plot(dat$num, dat$sig_score,pch=16,axes=FALSE,ylim=c(0,max(dat$sig_score)),type='b',col='blue',xlab="",ylab="")
box()
axis(2,ylim=c(0,max(dat$sig_score)),col="blue",las=1,col.axis="blue")
par(new=TRUE)
plot(dat$num, dat$sig_data,pch=16,axes=FALSE,ylim=c(0,max(dat$sig_data)),type='b',col='red',xlab="",ylab="")
axis(4, ylim=c(0,max(dat$sig_data)),col="red",las=1,col.axis="red")
axis(1,at=dat$num, labels=dat$cutoff,cex.axis=0.7,las=2)
mtext("P value cutoff",side=1,col="black",line=2.5)
legend('right', legend=c("sig_score","sig_data"), text.col=c("blue","red"),pch=c(16,16),col=c("blue","red"))

dev.off()

################ END ################
#          Created by Aone          #
#     quanyi.zhao@stanford.edu      #
################ END ################