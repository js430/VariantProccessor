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
#' @importFrom vcfR extract.gt
#' @importFrom data.table as.data.table fread

processVCF<- function(vcf_File){
    gt<-extract.gt(get(vcf_File)) #vcfR package
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
    df$CHR<-with(df, paste0(V1, vector, V2))
    df<-df[,-c(1,2,4)]
    names(depth)[names(depth) == "V3"] <- "Reads"
    depth<-depth[,c("Position", "Reads")]
    return(depth)
}
