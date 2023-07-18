#' Create an adjustable input for 'color' argument in ggplot
#'
#' @description
#' Filter used to adjust 'colored' argument based on selected filters. If a filter is selected, the ggplot will be colored for the selected filter.
#'
#' @param Filter1 Widget input1, input of wigdet selection box.
#' @param Filter2 Column of df, dataframe column corresponding to the filter.
#' @param Column1 Widget input2, input of wigdet selection box.
#' @param Column2 Column of df, dataframe column corresponding to the filter.
#'
#' @returns Lasers_Detectors, filtered column of df as input for the colored argument of ggplot.
#'
#' @export
  ColorVarPlot <-  function(Filter1 = NULL, Filter2 = NULL, Column1 = NULL, Column2 = NULL) {
  Laser_Detectors <- ifelse(
  !is.null(Filter1),
  Lasers_Detectors <- Column1,
  ifelse(
  !is.null(Filter2),
  Lasers_Detectors <- Column2,
  Lasers_Detectors <- ""))
 return(Lasers_Detectors)
  }



#' Creates standard visualization plot
#'
#' @description
#' Generate ggplot for standard visualization, creates newscale for vline colors.
#'
#' @param Finaldf df, df with contents that need to be plotted.
#' @param x_axis string, value from df presented on x-axis.
#' @param y_axis string, value from df presented on y-axis.
#' @param Instrument df column, uses the instrument column of df as input for linetype.
#' @param Lasers_Detectors string, output of the color filter controls what data to color in plot.
#' @param widthline number, Width of line in plot.
#' @param limxmin numeric, Minimumn of x-axis.
#' @param limxmax numeric, Maximum of x-axis.
#' @param limymin numeric, Minimum of y-axis.
#' @param limymax numeric, Minimum of y-axis.
#' @param titleplot string, Title of plot.
#' @param ylabaxis string, Title of y-axis.
#' @param xlabaxis string, Title of X-axis.
#' @param colorscale colorscale, Insert a color scale to use for plot.
#' @param color1 string, color1 for vlines presented in the plot.
#' @param color2 string, color2 for vlines presented in the plot.
#' @param color3 string, color3 for vlines presented in the plot.
#' @param color4 string, color4 for vlines presented in the plot.
#' @param color5 string, color5 for vlines presented in the plot.
#' @param color6 string, color6 for vlines presented in the plot.
#' @param color7 string, color7 for vlines presented in the plot.
#'
#' @returns QCplot, ggplot object for standard plot.
#'
#' @importFrom ggnewscale new_scale_color
#'
#' @export
QCPlotFunctionStand <- function(Finaldf,
                                x_axis,
                                y_axis,
                                Instrument,
                                Lasers_Detectors,
                                widthline,
                                limxmin,
                                limxmax,
                                limymin,
                                limymax,
                                titleplot,
                                ylabaxis,
                                xlabaxis,
                                colorscale,
                                color1,
                                color2,
                                color3,
                                color4,
                                color5,
                                color6,
                                color7){
  QCPlot <- ggplot(
    data = Finaldf,
    aes(x = x_axis, y = y_axis, color = Lasers_Detectors, linetype = Instrument)) +
    geom_line(linewidth = widthline) +
    ylim(limymin, limymax) +
    xlim(limxmin, limxmax) +
    ggtitle(titleplot) +
    labs(y = ylabaxis, x = xlabaxis) +
    theme_bw() +
    colorscale +
    new_scale_color() + scale_color_manual(name = "VLines", values = c(color1, color2, color3, color4, color5, color6, color7))

  return(QCPlot)
  }




#' Creates detailed visualization plot
#'
#' @description
#' Generate ggplot for detailed visualization, does not create new scale for vlines.
#'
#' @param Finaldf df, df with contents that need to be plotted.
#' @param x_axis string, value from df presented on x-axis.
#' @param y_axis string, value from df presented on y-axis.
#' @param Instrument df column, uses the instrument column of df as input for linetype.
#' @param Lasers_Detectors string, output of the color filter controls what data to color in plot.
#' @param widthline number, Width of line in plot.
#' @param limxmin numeric, Minimumn of x-axis.
#' @param limxmax numeric, Maximum of x-axis.
#' @param limymin numeric, Minimum of y-axis.
#' @param limymax numeric, Minimum of y-axis.
#' @param titleplot string, Title of plot.
#' @param ylabaxis string, Title of y-axis.
#' @param xlabaxis string, Title of X-axis.
#' @param colorscale colorscale, Insert a color scale to use for plot.
#'
#' @returns QCDetailPlot, ggplot object for detailed plot.
#'
#' @export
  QCPlotFunctionDetail <- function(Finaldf,
                                 x_axis,
                                 y_axis,
                                 Instrument,
                                 Lasers_Detectors,
                                 widthline,
                                 limxmin,
                                 limxmax,
                                 limymin,
                                 limymax,
                                 titleplot,
                                 ylabaxis,
                                 xlabaxis,
                                 colorscale) {
  QCDetailPlot <- ggplot(
    data = Finaldf,
    aes(x = x_axis, y = y_axis, color = Lasers_Detectors, linetype = Instrument)) +
    geom_line(linewidth = widthline) +
    ylim(limymin, limymax) +
    xlim(limxmin, limxmax) +
    ggtitle(titleplot) +
    labs(y = ylabaxis, x = xlabaxis) +
    theme_bw() +
    colorscale

  return(QCDetailPlot)
  }




#' Adds vertical line to standard visualization plot
#'
#' @description
#' Adds vertical line to standard visualization plot, using widgets as input.
#'
#' @param Nameline string, name of selection box for vline.
#' @param Lineselect input of wigdet, input of selection box for vlines.
#' @param vlinexintcep Date, Determines position of vline of x-axis.
#' @param vlinecolor string, input of text wigdet determines name of the vline.
#' @param vlinewidth numeric, width of vline.
#'
#' @return vlineresult, vline to added to standard plot.
#'
#' @export
vline <- function(Nameline,
                  Lineselect,
                  vlinexintcep,
                  vlinecolor,
                  vlinetype,
                  vlinewitdh){

  if (Nameline %in% Lineselect) {
      vlineresult <- geom_vline(aes(xintercept = vlinexintcep,
                   color = vlinecolor),
                   linetype = vlinetype,
                   linewidth = vlinewitdh)
  return(vlineresult)}
  }




#' Adds horizontal line to standard visualization plot
#'
#' @description
#' Adds horizontal line to standard visualization plot, using widgets as input.
#'
#' @param Nameline string, name of selection box for hline.
#' @param Lineselect input of wigdet, input of selection box for hlines.
#' @param hlineyintcep numeric, Determines position of vline of y-axis.
#' @param hlinecolor string, input of text wigdet determines name of the hline.
#' @param hlinewidth numeric, width of the hline.
#'
#' @return hlineresult, hline to added to standard plot.
#'
#' @export
  hline <- function(Nameline,
                  Lineselect,
                  hlineyintcep,
                  hlinecolor,
                  hlinetype,
                  hlinewitdh){
  if (Nameline %in% Lineselect) {
  hlineresult <- geom_hline(aes(yintercept = hlineyintcep),
                 linetype = hlinetype,
                 color = hlinecolor,
                 linewidth = hlinewitdh)}
  }



#' Adds vertical line to detailed visualization plot
#'
#' @description
#' Adds vertical line to detailed visualization plot, using widgets as input.
#'
#' @param Nameline string, name of selection box for vline.
#' @param Lineselect input of wigdet, input of selection box for vlines.
#' @param vlinexintcep Date, Determines position of vline of x-axis.
#' @param vlinecolor string, input of text wigdet determines name of the vline.
#' @param vlinewidth numeric, width of vline.
#' @param showlegend logical, show vline in legend, recommened set to TRUE.
#'
#' @return vlineresultdetail, vline to added to detailed plot.
#'
#' @export
  vlinedetail <- function (Nameline,
                         Lineselect,
                         vlinexintcep,
                         vlinecolor,
                         vlinetype,
                         vlinewitdh,
                         showlegd) {
  if (Nameline%in% Lineselect) {
  vlineresultdetail  <- geom_vline(aes(xintercept = vlinexintcep,
                        linetype = vlinetype),
                        color =  vlinecolor,
                        linewidth = vlinewitdh,
                        show.legend = showlegd)}
  }



#' Assign plot to global env
#'
#' @description
#' Assigns a ggplot object to global env.
#'
#' @param ImageName string, Name object will take in global env.
#' @param varimage ggplot object, Name of ggplot object.
#'
#' @export
  Varimageplot <- function(ImageName, Varimage) {
  assign(ImageName, Varimage, envir = .GlobalEnv)
  }



#' Filters values for max axis ranges
#'
#' @description
#' Filters values to be used as input for max axis ranges, so they adjust to max of the input data input.
#'
#' @param COlumninputwigdet column of dataframe, value column of dataframe.
#' @param Instrument_input string, input of Instrument filter wigdet.
#' @param Parameter_input string, input of Parameter filter wigdet.
#' @param Laser_input string, input of Laser filter widget.
#' @param Detector_input string, input of Detector filter wigdet.
#' @param TableInstrument colum dataframe, reference to instrument column.
#' @param TableParameter colum dataframe, reference to parameter column.
#' @param TableLaser colum dataframe, reference to Laser column.
#' @param TableDetector column dataframe, reference to Detector column.
#'
#' @return filteredinput, date type object or numeric to use as max value of an axis.
#'
#' @export
Filteraxisinputmax <- function (Columninputwigdet = NULL,
                                Instrument_input = NULL,
                                Parameter_input = NULL,
                                Laser_input = NULL,
                                Detector_input = NULL,
                                TableInstrument = NULL,
                                TableParameter = NULL,
                                TableLaser = NULL,
                                TableDetector = NULL) {
    ifelse(!is.null(Instrument_input) & is.null(Laser_input) & is.null(Detector_input),
       filteredinput <- max((Columninputwigdet[TableInstrument %in% Instrument_input & TableParameter %in%  Parameter_input]), na.rm = TRUE),
       ifelse(!is.null(Laser_input)  &  is.null(Detector_input),
              filteredinput <- max((Columninputwigdet[TableInstrument %in% Instrument_input & TableParameter %in%  Parameter_input & TableLaser %in% Laser_input]), na.rm = TRUE),
              ifelse(!is.null(Detector_input),
                     filteredinput <- max((Columninputwigdet[TableInstrument %in% Instrument_input & TableParameter %in% Parameter_input & TableLaser %in% Laser_input & TableDetector %in% Detector_input]), na.rm = TRUE),
                     filteredinput <- max(Columninputwigdet, na.rm = TRUE))))
 return(filteredinput)
}



#' Filters values for min axis ranges
#'
#' @description
#' Filters values to be used as input for max axis ranges, so they adjust to min of the input data input.
#'
#' @param COlumninputwigdet column of dataframe, value column of dataframe.
#' @param Instrument_input string, input of Instrument filter wigdet.
#' @param Parameter_input string, input of Parameter filter wigdet.
#' @param Laser_input string, input of Laser filter widget.
#' @param Detector_input string, input of Detector filter wigdet.
#' @param TableInstrument colum dataframe, reference to instrument column.
#' @param TableParameter colum dataframe, reference to parameter column.
#' @param TableLaser colum dataframe, reference to Laser column.
#' @param TableDetector column dataframe, reference to Detector column.
#'
#' @return filteredinput, date type object or numeric to use as min value of an axis.
#'
#' @export
Filteraxisinputmin <- function (Columninputwigdet = NULL,
                                Instrument_input = NULL,
                                Parameter_input = NULL,
                                Laser_input = NULL,
                                Detector_input = NULL,
                                TableInstrument = NULL,
                                TableParameter = NULL,
                                TableLaser = NULL,
                                TableDetector = NULL) {
  ifelse(!is.null(Instrument_input) & is.null(Laser_input) & is.null(Detector_input),
         filteredinput <- min((Columninputwigdet[TableInstrument %in% Instrument_input & TableParameter %in%  Parameter_input]), na.rm = TRUE),
         ifelse(!is.null(Laser_input)  &  is.null(Detector_input),
                filteredinput <- min((Columninputwigdet[TableInstrument %in% Instrument_input & TableParameter %in%  Parameter_input & TableLaser %in% Laser_input]), na.rm = TRUE),
                ifelse(!is.null(Detector_input),
                       filteredinput <- min((Columninputwigdet[TableInstrument %in% Instrument_input & TableParameter %in% Parameter_input & TableLaser %in% Laser_input & TableDetector %in% Detector_input]), na.rm = TRUE),
                       filteredinput <- min(Columninputwigdet, na.rm = TRUE))))
  return(filteredinput)
}




