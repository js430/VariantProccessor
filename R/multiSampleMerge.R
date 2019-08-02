#' Multi sample merge
#'
#' Merges multiple samples from single patient based on preference order of
#' samples
#'
#' @return None
#'
#'
#' @example multiSampleMerge(/users/xxxxx/Documents/Patients)
#'
#' @export
#'
#' @import dplyr
#' @import tibble

multiSampleMerge <-function(orderVec){
    temp = list.files(pattern="*")
    #temp<-temp[seq(1, length(temp), 3)]
    myfiles = lapply(temp, fread)
    new<-bind_rows(myfiles)
    new<- new %>% remove_rownames %>% column_to_rownames(var="Position") #tidyverse
    new<-order(new, orderVec)
    name<-substr(temp[1], 1, 12)
    new<-`colnames<-`(new, name)
}
order<-function(dataFrame, orderVector){
    dataFrame<-dataFrame[,orderVector]
    final<-apply(new, 1, function(x) if(is.na(x)) NA else x[!is.na(x)][1])
    finald<-data.frame(final)
    return(finaldf)
}
