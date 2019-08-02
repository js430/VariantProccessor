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
    depth<-paste0(fileName, ".depth"

    gt_dataTable<-processVCF(vcf)
    df<-processDepth(depth)

    mergeframe<-right_join(gt_dataTable, df, by="Position") 
    names(mergeframe)[names(mergeframe)=="new"]<-colnames(mergeframe)[1] 
    new<-colnames(mergeframe)[1]

    levels(mergeframe[,2)<-c(levels(mergeframe[2]), 0)
    mergeframe_dt<-mergeframe_dt[,-1]
    expr<-substitutemergeframe_dt[is.na() & Reads>readCutoff, var_name
                                   := factor(1)], list(var_name=as.name()))
    eval(expr)
    mergeframe_dt<-mergeframe_dt[,-1]
    mergeframe_dt<-mergeframe_dt[,c(3,1)]
    fwrite(mergeframe_dt, file=fileName
}
