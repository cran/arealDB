% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regGeometry.R
\name{regGeometry}
\alias{regGeometry}
\title{Register a new geometry entry}
\usage{
regGeometry(
  ...,
  subset = NULL,
  gSeries = NULL,
  label = NULL,
  layer = NULL,
  archive = NULL,
  archiveLink = NULL,
  nextUpdate = NULL,
  updateFrequency = NULL,
  notes = NULL,
  update = FALSE,
  overwrite = FALSE
)
}
\arguments{
\item{...}{[\code{character(1)}]\cr optional named argument selecting the
main territory into which this geometry is nested. The name of this must be
a class of the gazetteer and the value must be one of the territory names
of that class, e.g. \emph{nation = "Estonia"}.}

\item{subset}{[\code{character(1)}]\cr optional argument to specify which
subset the file contains. This could be a subset of territorial units (e.g.
only one municipality) or of a target variable.}

\item{gSeries}{[\code{character(1)}]\cr the name of the geometry dataseries
(see \code{\link{regDataseries}}).}

\item{label}{[\code{list(.)}]\cr list of as many columns as there are in
common in the ontology and this geometry. Must be of the form
\code{list(class = columnName)}, with 'class' as the class of the ontology
corresponding to the respective column name in the geometry.}

\item{layer}{[\code{character}]\cr the name of the file's layer from which
the geometry should be created (if applicable).}

\item{archive}{[\code{character(1)}]\cr the original file (perhaps a *.zip)
from which the geometry emerges.}

\item{archiveLink}{[\code{character(1)}]\cr download-link of the archive.}

\item{nextUpdate}{[\code{character(1)}]\cr value describing the next
anticipated update of this dataset (in YYYY-MM-DD format).}

\item{updateFrequency}{[\code{character(1)}]\cr value describing the
frequency with which the dataset is updated, according to the ISO 19115
Codelist, MD_MaintenanceFrequencyCode. Possible values are: 'continual',
'daily', 'weekly', 'fortnightly', 'quarterly', 'biannually', 'annually',
'asNeeded', 'irregular', 'notPlanned', 'unknown', 'periodic',
'semimonthly', 'biennially'.}

\item{notes}{[\code{character(1)}]\cr optional notes that are assigned to all
features of this geometry.}

\item{update}{[\code{logical(1)}]\cr whether or not the file
'inv_geometries.csv' should be updated.}

\item{overwrite}{[\code{logical(1)}]\cr whether or not the geometry to
register shall overwrite a potentially already existing older version.}
}
\value{
Returns a tibble of the entry that is appended to
  'inv_geometries.csv' in case \code{update = TRUE}.
}
\description{
This function registers a new geometry of territorial units into the
geospatial database.
}
\details{
When processing geometries to which areal data shall be linked,
  carry out the following steps: \enumerate{ \item Determine the main
  territory (such as a nation, or any other polygon), a \code{subset} (if
  applicable), the dataseries of the geometry and the ontology \code{label},
  and provide them as arguments to this function. \item Run the function.
  \item Export the shapefile with the following properties: \itemize{ \item
  Format: GeoPackage \item File name: What is provided as message by this
  function \item CRS: EPSG:4326 - WGS 84 \item make sure that 'all fields are
  exported'} \item Confirm that you have saved the file.}
}
\examples{
if(dev.interactive()){
  # build the example database
  makeExampleDB(until = "regDataseries", path = tempdir())

  # The GADM dataset comes as *.7z archive
  regGeometry(gSeries = "gadm",
              label = list(al1 = "NAME_0"),
              layer = "example_geom1",
              archive = "example_geom.7z|example_geom1.gpkg",
              archiveLink = "https://gadm.org/",
              nextUpdate = "2019-10-01",
              updateFrequency = "quarterly",
              update = TRUE)

  # The second administrative level in GADM contains names in the columns
  # NAME_0 and NAME_1
  regGeometry(gSeries = "gadm",
              label = list(al1 = "NAME_0", al2 = "NAME_1"),
              layer = "example_geom2",
              archive = "example_geom.7z|example_geom2.gpkg",
              archiveLink = "https://gadm.org/",
              nextUpdate = "2019-10-01",
              updateFrequency = "quarterly",
              update = TRUE)
}
}
\seealso{
Other register functions: 
\code{\link{regDataseries}()},
\code{\link{regTable}()}
}
\concept{register functions}
