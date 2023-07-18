#' Get character vector of directory and file names
#'
#' @description
#' Import data returns a character vector containing the names of the directories and files of the selected directory.
#'
#' @param FilePattern regular expression, Only listing files that contain the specified regular expression.
#' @param DireSelect string, dirname() the output of the directory selector.
#' @param case_ignore logical, Should the function be case-sensitive.
#' @param Recursive logical, can the function search all directories.
#'
#' @returns listQC, directory and file names resulting from importing
#'
#' @export
  ImportData <- function(FilePattern, DirSelect, NameFull, case_ignore, Recursive){
  listQC <- list.files(path = DirSelect, pattern = FilePattern, full.names = TRUE,  ignore.case= case_ignore, recursive = Recursive)
  return(listQC)
  }



#' Create rename df based on column other df
#'
#' @description
#' Creates a df based on the column that has to be renamed. The resulting df has an OldName and NewName column containing all unique values from the original column.
#'
#' @param ColumntoRename column, column of df that is to be renamed.
#'
#' @returns Old_Excel_Names, df contains two column: NewName & OldName. Both containing all unique values from original columns.
#'
#' @export
  Generate_renamedf <- function(ColumntoRename){
  Old_Excel_Names <- data.frame(unique(ColumntoRename))
  Old_Excel_Names <- Old_Excel_Names %>% rename(OldName = unique.ColumntoRename.)
  Old_Excel_Names <- Old_Excel_Names %>% mutate(NewName = OldName)
  return(Old_Excel_Names)
  }



#' Converts df to an Excel file
#'
#' @description
#' Converts a df to an Excel file.
#'
#' @param ExcelFile df, df that needs to be converted into an Excel file.
#' @param DownloadpathExcel string, File path
#'
#' @importFrom writexl write_xlsx
#'
#' @export
  Download_renameExcel <- function(ExcelFile, DownloadpathExcel) {
  write_xlsx(ExcelFile , path = DownloadpathExcel)
  }



#' Converts Excel file to a df
#'
#' @description
#' Converts Excel into df.
#'
#' @param Input_Read string, filepath to Excel file.
#'
#' @importFrom openxlsx read.xlsx
#'
#' @export
  ExcelRead <- function(Input_Read){
  read.xlsx(Input_Read)
  }



#' Save ggplot object
#'
#' @description
#' Save ggplot object, used in application to generate ggplot images.
#'
#' @param PlotvarName ggplot object, Name of ggplot.
#' @param Formatwidth numeric, Width of object (image).
#' @param Formatheightnumeric, Height of object (image).
#' @param Formatunit string, Unit of length to apply.
#' @param filecontent string, Name of file.
#'
#' @returns StandPlot, ggplot object, used to export ggplot images.
#'
#' @export
  GenerateStandplotimage <- function(PlotvarName, Formatwidth, Formatheight, Formatunit, filecontent){
  StandPlot <- ggsave(PlotvarName, width = Formatwidth, height = Formatheight, units = Formatunit, filename = filecontent)
  return(StandPlot)
  }



#' Save and export ggplot images based on df column
#'
#' @description
#' Save and export plots based on df column, containing all possible combinations of variables.
#'
#' @param Columnparams df column, column of df to base images on.
#' @param DownloadpatyImages string, file path chosen by the user.
#' @param loopname loop, function is placed within a loop, references which loop to apply.
#' @param loopid value, letter to indicate iterations to loop through.
#'
#' @returns StandPlot, ggplot object used to export ggplot images.
#'
#' @export
  ExportAllImages <- function (Columnparams, DownloadpathImages, loopname, loopid) {
  ggplot(loopname, mapping = aes(x=as.Date(Date),y=value)) + geom_line()
  ggsave(filename = paste(loopid,".png",sep=""), path = DownloadpathImages)
  }



