% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hue_set_colour.R
\name{hue_convert_to_hue_sat}
\alias{hue_convert_to_hue_sat}
\title{Convert hex colour to}
\usage{
hue_convert_to_hue_sat(colour)
}
\arguments{
\item{colour}{A colour name as listed by \code{colours()} or a hexadecimal colour string.}
}
\value{
A named list with two elements: \code{hue} and \code{sat}
}
\description{
Convert hex colour to
}
\examples{

hue_convert_to_hue_sat("red")
hue_convert_to_hue_sat("#E414FF")
if (interactive()) {
  hue_convert_to_hue_sat(colourpicker::colourPicker(numCols = 1))
}
}
