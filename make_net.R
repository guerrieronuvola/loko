library(caret)
library(kernlab)
library(neuralnet)

make_net <- function(lokonet, nNascosti = c(1,2,3,4,5,6), tsld = tsld<-c(0.20,0.15,0.1,0.020,0.015,0.010,0.0015,0.001,0.0001)) {


inTrain <- createDataPartition(y=lokonet[,5] , p=0.75, list=FALSE)


training <- lokonet[inTrain,]
testing <- lokonet[-inTrain,]


neuroni <- c() 						#vettore delle possibili combinazioni del numero di neuroni #nascosti
thresholds <- rep(tsld,length(nNascosti))
rp <- 6

for(i in 1:length(nNascosti)){
	neuroni <- c(neuroni,rep(nNascosti[i],length(tsld)))
}


errori<-c()
Err<-c()
nc<-99

for(u in 1:length(nNascosti)){ 
errori<-c()
for (i in 1:length(tsld)){ 

	Bionet <- neuralnet(training[,5] ~ training[,1] + training[,2] + training[,3] + training[,4], data=training, 
	hidden=nNascosti[u], lifesign="minimal", linear.output=FALSE, rep=rp,threshold=tsld[i] )

	a <- Bionet$result.matrix[1,] 
	#a è il vettore contenente i valori di errore #nelle differenti ripetizioni.

	if(length(a)!=6){ #se la rete non converge, il numero di elementi di a #diminuisce
		m<-rp-length(a)
		a<-c(a,rep(nc,m)) #se la rete non converge ad una certa #combinazione/ripetizione
		} 

	errori<-rbind(errori,a) 
	}

Err<-rbind(Err,errori)

}

ErrMedio<-apply(Err,1,mean)
VarMedia<-apply(Err,1,var)


riassunto<-cbind(neuroni,thresholds,ErrMedio,VarMedia)
riassunto<-riassunto[order(riassunto[,3]),]


best<-subset(riassunto,riassunto[,3]==min(riassunto[,3]))


}
