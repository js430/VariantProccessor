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


sampleMerge<-function(filePath){
    vcf<-enterVCFFileName() #Reads in VCF
    depth<-enterDepthFileName() #Reads in depth

    gt_dataTable<-processVCF(vcf) #Process VCF and depth
    df<-processDepth(depth)

    mergeframe<-right_join(gt_dataTable, df, by="Position") #Merge VCF and depth
    #based on chromosomal position
    names(mergeframe)[names(mergeframe)=="new"]<-colnames(mergeframe)[1] #Rename
    #column
    new<-colnames(mergeframe)[1]
    levels(mergeframe$new)<-c(levels(mergeframe$new), 0) #Allow 0 to be a value

    mergeframe_dt<-as.data.table(mergeframe)
    mergeframe_dt<-mergeframe_dt[,-1]
    expr<-substitute(mergeframe_dt[is.na(var_name) & Reads>5, var_name
                                   := factor(0)], list(var_name=as.name(new)))
    eval(expr)
    mergeframe_dt<-mergeframe_dt[,-3]
    mergeframe_dt<-mergeframe_dt[,c(2,1)]
    mergeframe_dt<-mergeframe_dt %>% remove_rownames
        %>% column_to_rownames(var="Position")
    fwrite(mergeframe_dt, file=filePath)
}
