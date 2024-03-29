% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plots_Functions.R
\name{Filteraxisinputmax}
\alias{Filteraxisinputmax}
\title{Filters values for max axis ranges}
\usage{
Filteraxisinputmax(
  Columninputwigdet = NULL,
  Instrument_input = NULL,
  Parameter_input = NULL,
  Laser_input = NULL,
  Detector_input = NULL,
  TableInstrument = NULL,
  TableParameter = NULL,
  TableLaser = NULL,
  TableDetector = NULL
)
}
\arguments{
\item{Instrument_input}{string, input of Instrument filter wigdet.}

\item{Parameter_input}{string, input of Parameter filter wigdet.}

\item{Laser_input}{string, input of Laser filter widget.}

\item{Detector_input}{string, input of Detector filter wigdet.}

\item{TableInstrument}{colum dataframe, reference to instrument column.}

\item{TableParameter}{colum dataframe, reference to parameter column.}

\item{TableLaser}{colum dataframe, reference to Laser column.}

\item{TableDetector}{column dataframe, reference to Detector column.}

\item{COlumninputwigdet}{column of dataframe, value column of dataframe.}
}
\value{
filteredinput, date type object or numeric to use as max value of an axis.
}
\description{
Filters values to be used as input for max axis ranges, so they adjust to max of the input data input.
}
