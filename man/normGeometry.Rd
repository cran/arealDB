% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/normGeometry.R
\name{normGeometry}
\alias{normGeometry}
\title{Normalise geometries}
\usage{
normGeometry(
  input = NULL,
  ...,
  thresh = 10,
  outType = "gpkg",
  pattern = NULL,
  update = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{input}{[\code{character(1)}]\cr path of the file to normalise. If this
is left empty, all files at stage two as subset by \code{pattern} are
chosen.}

\item{...}{[\code{character(.)}]\cr a subset of administrative units as given
by \code{nation}, \code{continent}, \code{region}, \code{subregion} or
\code{un_member = TRUE/FALSE}. Valid selection criteria and their values
are in the object \code{\link{countries}}.}

\item{thresh}{[\code{integerish(1)}]\cr the deviation of percentage of
overlap above which to consider two territorial units "different".}

\item{outType}{[\code{character(1)}]\cr the output file-type, see
\code{\link{st_drivers}} for a list. If a file-type supports layers, they
are stored in the same file, otherwise the different layers are provided
separately.}

\item{pattern}{[\code{character(1)}]\cr an optional regular expression. Only
dataset names which match the regular expression will be returned.}

\item{update}{[\code{logical(1)}]\cr whether or not the physical files should
be updated (\code{TRUE}) or the function should merely return the geometry
inventory of the handled files (\code{FALSE}, default). This is helpful to
check whether the metadata specification and the provided file(s) are
properly specified.}

\item{verbose}{[\code{logical(1)}]\cr be verbose about what is happening
(default \code{FALSE}). Furthermore, you can use
\code{\link{suppressMessages}} to make this function completely silent.}
}
\value{
This function harmonises and integrates so far unprocessed geometries
  at stage two into stage three of the geospatial database. It produces for
  each nation in the registered geometries a spatial file of the specified
  file-type.
}
\description{
Harmonise and integrate geometries in a standardised format
}
\details{
To normalise geometries, this function proceeds as follows:
  \enumerate{ \item Read in \code{input} and extract initial metadata from
  the file name. \item Loop through every nation potentially included in the
  file that shall be processed and carry out the following steps: \itemize{
  \item In case the geometries are provided as a list of simple feature
  POLYGONS, they are dissolved into a single MULTIPOLYGON per nation. \item
  In case the nation to which a geometry belongs has not yet been created at
  stage three, the following steps are carried out: \enumerate{ \item Check
  whether the recent dataset is GADM, to build the initial administrative
  hierarchy from GADM geometries, and stop if this is not the case. \item
  Extract the full hierarchy of all territorial units that are part of the
  geometry. \item Reconstruct ahID from the intermediate spatial objects and
  from the metadata. } \item In case the nation to which the geometry belongs
  has already been created, the following steps are carried out: \enumerate{
  \item Check whether the new geometries have the same coordinate reference
  system as the already existing database and re-project the new geometries
  if this is not the case. \item Check whether all new geometries are already
  exactly matched spatially and stop if that is the case. \item Check whether
  the new geometries are all within the already defined parents, and save
  those that are not as a new geometry. \item Calculate spatial overlap and
  distinguish the geometries into those that overlap with more and those with
  less than \code{thresh}. \item For all units that did match, copy ahID from
  the geometries they overlap. \item For all units that did not match,
  rebuild metadata and a new ahID. } \item If update = TRUE, store the
  processed geometry at stage three.} \item Move the geometry to the folder
  '/processed', if it is fully processed.}
}
\examples{
library(sf)

# build the example database
makeExampleDB(until = "regGeometry")

# normalise all geometries ...
normGeometry(nation = "estonia", update = TRUE)

# ... and check the result
output <- st_read(paste0(tempdir(), "/newDB/adb_geometries/stage3/estonia.gpkg"))
}
\seealso{
Other normalisers: 
\code{\link{normTable}()}
}
\concept{normalisers}
