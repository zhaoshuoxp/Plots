#!/usr/bin/env Rscript
#####################################
library(Hmisc)
library(corrplot)
library(pheatmap)
# ++++++++++++++++++++++++++++
# flattenCorrMatrix
# ++++++++++++++++++++++++++++
# cormat : matrix of the correlation coefficients
# pmat : matrix of the correlation p-values
flattenCorrMatrix <- function(cormat, pmat) {
    ut <- upper.tri(cormat)
    data.frame(
        row = rownames(cormat)[row(cormat)[ut]],
        column = rownames(cormat)[col(cormat)[ut]],
        cor  =(cormat)[ut],
        p = pmat[ut]
        )
}

options<-commandArgs(trailingOnly = T)

read.table(options[1],header=F)->a
a[,2:ncol(a)]->b
a$V1->row.names(b)
b[rowSums(b)>1,]->b
t(b)->c
rcorr(c)->res

write.table(res$r,file=paste(options[2],'r',sep='.'),sep='\t',quote=F,row.names=T, col.names=T)
write.table(res$P,file=paste(options[2],'p',sep='.'),sep='\t',quote=F,row.names=T, col.names=T)

flattenCorrMatrix(res$r, res$P)->res_list
write.table(res_list,file=paste(options[2],'list',sep='.'),sep='\t',quote=F,row.names=F, col.names=T)

png(file='rcor_heatmap.png',height = 8, width = 8, res=600, units = "in", family="Arial")
pheatmap(res_cor$r, cluster_rows = F, cluster_cols = F)->hm
hm
#corrplot(res, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45)->cp
#cp
dev.off()

################ END ################
#          Created by Aone          #
#     quanyi.zhao@stanford.edu      #
################ END ################