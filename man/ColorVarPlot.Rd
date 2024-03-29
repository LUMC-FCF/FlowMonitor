% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plots_Functions.R
\name{ColorVarPlot}
\alias{ColorVarPlot}
\title{Create an adjustable input for 'color' argument in ggplot}
\usage{
ColorVarPlot(Filter1 = NULL, Filter2 = NULL, Column1 = NULL, Column2 = NULL)
}
\arguments{
\item{Filter1}{Widget input1, input of wigdet selection box.}

\item{Filter2}{Column of df, dataframe column corresponding to the filter.}

\item{Column1}{Widget input2, input of wigdet selection box.}

\item{Column2}{Column of df, dataframe column corresponding to the filter.}
}
\value{
Lasers_Detectors, filtered column of df as input for the colored argument of ggplot.
}
\description{
Filter used to adjust 'colored' argument based on selected filters. If a filter is selected, the ggplot will be colored for the selected filter.
}
