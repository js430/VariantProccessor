#'Create Index file
#'
#'Creates an index file to loccate which fst file a particular position is
#'located in
#'
#'@param file File name
#'@param filePath Folder path for file to be written to
#'
#'@return None
#'
#'@export
#'
#'@importFrom data.table fread fwrite

createIndex<-function(file, filePath){
    positionFile<-fread(file) #data.table package
    one<-positionFile[,1]
    fwrite(one, filePath)
}
