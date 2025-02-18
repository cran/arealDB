% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{.matchOntology}
\alias{.matchOntology}
\title{Match target terms with an ontology}
\usage{
.matchOntology(
  table = NULL,
  columns = NULL,
  dataseries = NULL,
  ontology = NULL,
  beep = NULL,
  colsAsClass = TRUE,
  groupMatches = FALSE,
  stringdist = TRUE,
  strictMatch = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{table}{\code{\link[=data.frame]{data.frame(1)}}\cr a table that contains columns
that should be harmonised by matching with the gazetteer.}

\item{columns}{\code{\link[=character]{character(1)}}\cr the columns containing the
concepts}

\item{dataseries}{\code{\link[=character]{character(1)}}\cr the source dataseries from
which territories are sourced.}

\item{ontology}{\code{\link[ontologics:onto-class]{onto}}\cr path where the ontology/gazetteer is stored.}

\item{beep}{\code{\link[=integer]{integerish(1)}}\cr Number specifying what sound to be
played to signal the user that a point of interaction is reached by the
program, see \code{\link[beepr]{beep}}.}

\item{colsAsClass}{\code{\link[=logical]{logical(1)}}\cr whether to match \code{columns}
by their name with the respective classes, or with concepts of all classes.}

\item{groupMatches}{\code{\link[=logical]{logical(1)}}\cr whether or not to group
harmonized concepts when there are more than one match (for example for
broader or narrower matches).}

\item{stringdist}{\code{\link[=logical]{logical(1)}}\cr whether or not to use string
distance to find matches (should not be used for large datasets/when a
memory error is shown).}

\item{strictMatch}{\code{\link[=logical]{logical(1)}}\cr whether or not matches are
strict, i.e., there should be clear one-to-one relationships and no changes
in broader concepts.}

\item{verbose}{\code{\link[=logical]{logical(1)}}\cr whether or not to give detailed
information on the process of this function.}
}
\value{
Returns a table that resembles the input table where the target
columns were translated according to the provided ontology.
}
\description{
This function takes a table to replace the values of various columns with
harmonised values listed in the project specific gazetteer.
}
