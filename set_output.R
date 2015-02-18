# This function will fetch the selected output parameter from raw data

set_output <- function(output) {

if(!is.numeric(output)) {
	num <- which( colnames(loko)== output )
	} else { 
		num <- output
	}

output_name <- colnames(loko[num])

loko_input <- loko[,1:4]
loko_output <- loko[,num]

loko_ok <- cbind(loko_input, loko_output)

colnames(loko_ok)[5] <- output_name

loko_ok

}