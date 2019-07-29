#' Merging a signle sample
#'
#' Processes and merges VCF and Depth of single sample
#'
#' @param filePath folder path for final data
#'
#' @return None
#' @examples
#' sampleMerge("/users/xxxx/Documents)
#'
#' @export
#' @importFrom dplyr right_join
#' @importFrom data.table as.data.table
#' @importFrom tools file_path_sans_ext

sampleMerge<-function(cutoff){
    list<-list.files(pattern="*", full.names = T)
    base<-lapply(list, file_path_sans_ext)
    base<-unique(base)
    lapply(base, merge, readCutoff=cutoff)
}

merge<-function(fileName, readCutoff){
    
    vcf<-paste0(fileName, ".vcf")
    depth<-paste0(fileName, ".depth") #Reads in depth

    gt_dataTable<-processVCF(vcf) #Process VCF and depth
    df<-processDepth(depth)

    mergeframe<-right_join(gt_dataTable, df, by="Position") #Merge VCF and depth
    #based on chromosomal position
    names(mergeframe)[names(mergeframe)=="new"]<-colnames(mergeframe)[1] #Rename
    #column
    new<-colnames(mergeframe)[1]

    levels(mergeframe[,2])<-c(levels(mergeframe[2]), 0)#Allow 0 to be a value

    mergeframe_dt<-as.data.table(mergeframe)
    mergeframe_dt<-mergeframe_dt[,-1]
    expr<-substitute(mergeframe_dt[is.na(var_name) & Reads>readCutoff, var_name
                                   := factor(0)], list(var_name=as.name(new)))
    eval(expr)
    mergeframe_dt<-mergeframe_dt[,-3]
    mergeframe_dt<-mergeframe_dt[,c(2,1)]
    fwrite(mergeframe_dt, file=fileName)
}
