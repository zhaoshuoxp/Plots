p6 <- read.table(file = '~/GO/lost/p6_sp_all_lost_pathway.txt',header = T,sep = '\t')
a <- unlist(strsplit(as.character(p6$Term[1:5]),split = ':'))[seq(2,10,by = 2)]
a <- rev(a)
b <- -log(p6$PValue[1:5])/log(10)
b <- rev(b)
par(mar=c(8.2,1,8.2,20),mgp = c(0,0.5,0),tcl = -0.3,lwd = 2)
color1 = c(rep('grey50',2),'#08519C',rep('grey50',2),'#08519C',rep('grey50',4))
color2 = c(rep('grey30',2),'#08519C')
barplot(b,names.arg = F,horiz = T,adj = 1,las = 1,cex.names = 0.9,space = 0.3,col = color1,xaxt = 'n',border = F) -> pos
mtext(a,side = 4,at = pos,col = color2,las = 1,adj = 1,line = 19,cex = 1.05,font = 1)
#abline(v = c(20,40,60,80),lwd =0.5,col = 'grey48')
abline(v = 0,lwd =2,col = 'black')
axis(side = 1,at = c(0,1,2,3,4,5),lwd =2,labels = F)
mtext(c(0,1,2,3,4,5),side = 1,at = c(0,1,2,3,4,5),line = 0.5)
mtext('-lg(pValue)',side = 1,at = 2.5,line = 1.8,lwd = 3,cex = 1.1)#1.8
mtext('double lost gene GO analysis\n(Pathway)',side = 3,line = 1.5,at = 10,las = 1.5,cex = 1.6,font = 2)


