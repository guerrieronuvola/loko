set_output <- function(output) {

if(!is.numeric(output)) {
	num <- which( colnames(loko)== output )
	} else { 
		num <- output
	}

print(num)

loko_input <- loko[,1:4]
loko_output <- loko[,num]

loko_ok <- cbind(loko_input, loko_output)

}