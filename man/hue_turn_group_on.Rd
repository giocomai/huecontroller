% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/turn_on_off.R
\name{hue_turn_group_on}
\alias{hue_turn_group_on}
\title{Turn on group}
\usage{
hue_turn_group_on(id)
}
\arguments{
\item{id}{If numeric, numeric id of group. If character, name of group. You can check id and names with \code{hue_get_groups_names()}}
}
\value{
Silently returns http response from the bridge, but mostly used for its side effects.
}
\description{
Turn on group
}
