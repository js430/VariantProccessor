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

multiSampleMerge <-function(folderPath){
    temp = list.files(pattern="*")
    myfiles = lapply(temp, fread)
    new<-bind_cols(myfiles)
    new<- new %>% remove_rownames %>% column_to_rownames(var="Position") #tidyverse
    new<-new[c(T,F)]
    final<-apply(new, 1, function(x) if(all(is.na(x))) NA else x[!is.na(x)][1])
    finaldf<-data.frame(final)
    name<-substr(temp[1], 1, 12)
    fwrite(finaldf, paste0(folderPath,name))

}
