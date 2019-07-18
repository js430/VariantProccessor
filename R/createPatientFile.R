#'Create Patient File
#'
#'Binds all patient of a certain cancer into one large data file
#'
#'@return None
#'
#'@export

createPatientFile<-function(){
    system('paste * > patientFile')
}
