#' Multi sample merge
#'
#' Merges multiple samples from single patient based on preference order of
#' samples
#'
#' @return None
#'
#'
#' @example multiSampleMerge()
#'
#' @export
#'
#' @import dplyr

multiSampleMerge <-function(){
    temp = list.files(pattern="*")
    myfiles = lapply(temp, fread)
    new<-bind_cols(myfiles)
    new<- new %>% remove_rownames %>% column_to_rownames(var="Position") #tidyverse
    toDelete<-seq(3,NCOL(new), 2)
    new[,toDelete]
    final<-apply(new, 1, function(x) if(all(is.na(x))) NA else x[!is.na(x)][1])

}
