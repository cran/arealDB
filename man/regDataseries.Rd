% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regDataseries.R
\name{regDataseries}
\alias{regDataseries}
\title{Register a new dataseries}
\usage{
regDataseries(
  name = NULL,
  description = NULL,
  homepage = NULL,
  licence_link = NULL,
  licence_path = NULL,
  notes = NULL,
  update = FALSE,
  overwrite = FALSE
)
}
\arguments{
\item{name}{[\code{character(1)}]\cr the dataseries abbreviation or name.}

\item{description}{[\code{character(1)}]\cr the "long name" or "brief
description" of the dataseries.}

\item{homepage}{[\code{character(1)}]\cr the homepage of the data provider
where the dataseries or additional information can be found.}

\item{licence_link}{[\code{character(1)}]\cr link to the licence or the
webpage from which the licence was copied.}

\item{licence_path}{[\code{character(1)}]\cr path to the local file in which
the licence text is stored.}

\item{notes}{[\code{character(1)}]\cr optional notes.}

\item{update}{[\code{logical(1)}]\cr whether or not the file
'inv_dataseries.csv' should be updated (obligatory to continue registering
geometries or tables associated to this dataseries).}

\item{overwrite}{[\code{logical(1)}]\cr whether or not the dataseries to
register shall overwrite a potentially already existing older version.}
}
\value{
Returns a tibble of the new entry that is appended to
  'inv_dataseries.csv' in case \code{update = TRUE}.
}
\description{
This function registers a new dataseries of both, geometries or areal data
into the geospatial database. This contains the name and relevant meta-data
of a dataseries to enable provenance tracking and reproducability.
}
\examples{
if(dev.interactive()){
  # start the example database
  makeExampleDB(until = "match_gazetteer", path = tempdir())

  regDataseries(name = "gadm",
                description = "Database of Global Administrative Areas",
                homepage = "https://gadm.org/index.html",
                licence_link = "https://gadm.org/license.html",
                update = TRUE)
}
}
\seealso{
Other register functions: 
\code{\link{regGeometry}()},
\code{\link{regTable}()}
}
\concept{register functions}
