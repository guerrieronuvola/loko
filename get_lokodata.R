library(xlsx)
loko_s1 <- read.xlsx("Dati Lokomat.xlsx", sheetIndex=1, header=TRUE, startRow=2, as.data.frame=TRUE)
loko_s1 <- loko_s1[1:30,c(2:5, 7:13)]


loko_s2 <- read.xlsx("Dati Lokomat.xlsx", sheetIndex=2, header=TRUE, startRow=2, as.data.frame=TRUE)
loko_s2 <- loko_s2[,c(2:5, 7:13)]

loko <- rbind(loko_s1, loko_s2)

col_names <- c("sex", "age", "GMFCS", "X.GMFM.tot.T0", "delta.GMFM.D", "delta.GMFM.E", "delta.gmfm66", 
"delta.6minWT", "delta.stance.medio.norm", "delta.gait.velocity.norm", "delta.step.length.media.norm")

colnames(loko) <- col_names
