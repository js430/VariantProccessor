#' Create BED file
#'
#' Creates the necessary BED file for positions
#'
#' @return None
#' @examples
#' createBEDfile()
#'
#' @export
createBEDFile <-function(){
    system('cat *.vcf |egrep -v "^#"> final.vcf')
    system("vcf2bed < final.vcf | cut -f 1,2,3 | sort -k 1,1 -k2,2n -u > final.bed")
}
