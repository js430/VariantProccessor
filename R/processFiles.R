#' Process files
#'
#' Processes and parses VCCF and Depth files
#'
#' @param vcf_File VCF file to be processed
#' @param depth_File DEPTH file to be processed
#'
#' @examples
#' processVCF(xxx.vcf)
#' processDepth(xxx.depth)
#'
#' @importFrom vcfR extract.gt read.vcfR
#' @importFrom data.table as.data.table fread

processVCF<- function(vcf_File){
    vcf<-read.vcfR(vcf_File)
    gt<-extract.gt(vcf) #vcfR package
    new<-vapply(gt[,1], function(x) strtoi(substr(x, 1, 1))+strtoi(substr(x, 3, 3)),numeric(1))
    gt<-cbind(gt, new)
    Position<-row.names(gt)
    gt<-cbind(gt, Position)
    gt_dt<-as.data.table(gt) #data.table pacakge
    return(gt_dt)
}

processDepth<- function(depth_File){
    df<-fread(depth_File)
    vector<-rep("_", nrow(df))
    df<-cbind(df, vector)
    df$Position<-with(df, paste0(V1, vector, V2))
    df<-df[,-c(1,2,4)]
    names(df)[names(df) == "V3"] <- "Reads"
    df<-df[,c("Position", "Reads")]
    return(df)
}
