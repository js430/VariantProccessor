#' Reading files
#'
#' Reads in VCF and Depth files
#'
#' @return None
#'
#' @examples
#' enterVCFFileName()
#' enterDepthFileName()

enterVCFFileName<- function(){
    filename<- readline(prompt = "Enter VCF file name:")
    return(filename)
}

enterDepthFileName<- function(){
    filename<- readline(prompt = "Enter Depth file name:")
    return(filename)
}

