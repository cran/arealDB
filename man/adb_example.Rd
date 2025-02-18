% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adb_example.R
\name{adb_example}
\alias{adb_example}
\title{Build an example areal database}
\usage{
adb_example(path = NULL, until = NULL, verbose = FALSE)
}
\arguments{
\item{path}{\code{\link[=character]{character(1)}}\cr The database gets created by
default in tempdir(), but if you want it in a particular location, specify
that in this argument.}

\item{until}{\code{\link[=character]{character(1)}}\cr The database building step in
terms of the function names until which the example database shall be
built, one of \code{"start_arealDB"}, \code{"regDataseries"},
\code{"regGeometry"}, \code{"regTable"}, \code{"normGeometry"} or
\code{"normTable"}.}

\item{verbose}{\code{\link[=logical]{logical(1)}}\cr be verbose about building the
example database (default \code{FALSE}).}
}
\value{
No return value, called for the side effect of creating an example
database at the specified \code{path}.
}
\description{
This function helps setting up an example database up until a certain step.
}
\details{
Setting up a database with an R-based tool can appear to be
cumbersome and too complex and thus intimidating. By creating an example
database, this functions allows interested users to learn step by step how
to build a database of areal data. Moreover, all functions in this package
contain verbose information and ask for information that would be missing
or lead to an inconsistent database, before a failure renders hours of work
useless.
}
\examples{
if(dev.interactive()){
# to build the full example database
adb_example(path = paste0(tempdir(), "/newDB"))

# to make the example database until a certain step
adb_example(path = paste0(tempdir(), "/newDB"), until = "regDataseries")

}
}
