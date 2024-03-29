% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regTable.R
\name{regTable}
\alias{regTable}
\title{Register a new areal data table}
\usage{
regTable(
  ...,
  subset = NULL,
  dSeries = NULL,
  gSeries = NULL,
  label = NULL,
  begin = NULL,
  end = NULL,
  schema = NULL,
  archive = NULL,
  archiveLink = NULL,
  nextUpdate = NULL,
  updateFrequency = NULL,
  metadataLink = NULL,
  metadataPath = NULL,
  notes = NULL,
  update = FALSE,
  overwrite = FALSE
)
}
\arguments{
\item{...}{[\code{character(1)}]\cr name and value of the topmost unit under
which the table shall be registered. The name of this must be a class of
the gazetteer and the value must be one of the territory names of that
class, e.g. \emph{nation = "Estonia"}.}

\item{subset}{[\code{character(1)}]\cr optional argument to specify which
subset the file contains. This could be a subset of territorial units (e.g.
only one municipality) or of a target variable.}

\item{dSeries}{[\code{character(1)}]\cr the dataseries of the areal data (see
\code{\link{regDataseries}}).}

\item{gSeries}{[\code{character(1)}]\cr optionally, the dataseries of the
geometries, if the geometry dataseries deviates from the dataseries of the
areal data (see \code{\link{regDataseries}}).}

\item{label}{[\code{integerish(1)}]\cr the label in the onology this geometry
should correspond to.}

\item{begin}{[\code{integerish(1)}]\cr the date from which on the data are
valid.}

\item{end}{[\code{integerish(1)}]\cr the date until which the data are valid.}

\item{schema}{[\code{list(1)}]\cr the schema description of the table to read
in (must have been placed in the global environment before calling it
here).}

\item{archive}{[\code{character(1)}]\cr the original file from which the
boundaries emerge.}

\item{archiveLink}{[\code{character(1)}]\cr download-link of the archive.}

\item{nextUpdate}{[\code{character(1)}]\cr when does the geometry dataset get
updated the next time (format restricted to: YYYY-MM-DD).}

\item{updateFrequency}{[\code{character(1)}]\cr value describing the
frequency with which the dataset is updated, according to the ISO 19115
Codelist, MD_MaintenanceFrequencyCode. Possible values are: 'continual',
'daily', 'weekly', 'fortnightly', 'quarterly', 'biannually', 'annually',
'asNeeded', 'irregular', 'notPlanned', 'unknown', 'periodic',
'semimonthly', 'biennially'.}

\item{metadataLink}{[\code{character(1)}]\cr if there is already metadata
existing: link to the meta dataset.}

\item{metadataPath}{[\code{character(1)}]\cr if an existing meta dataset was
downloaded along the data: the path where it is stored locally.}

\item{notes}{[\code{character(1)}]\cr optional notes.}

\item{update}{[\code{logical(1)}]\cr whether or not the file 'inv_tables.csv'
should be updated.}

\item{overwrite}{[\code{logical(1)}]\cr whether or not the geometry to
register shall overwrite a potentially already existing older version.}
}
\value{
Returns a tibble of the entry that is appended to 'inv_tables.csv' in
  case \code{update = TRUE}.
}
\description{
This function registers a new areal data table into the geospatial database.
}
\details{
When processing areal data tables, carry out the following steps:
  \enumerate{ \item Determine the main territory (such as a nation, or any
  other polygon), a \code{subset} (if applicable), the ontology
  \code{label} and the dataseries of the areal data and of the geometry, and
  provide them as arguments to this function. \item Provide a \code{begin}
  and \code{end} date for the areal data. \item Run the function. \item
  (Re)Save the table with the following properties: \itemize{\item Format:
  csv \item Encoding: UTF-8 \item File name: What is provided as message by
  this function \item make sure that the file is not modified or reshaped.
  This will happen during data normalisation via the schema description,
  which expects the original table.} \item Confirm that you have saved the
  file.}

  Every areal data dataseries (\code{dSeries}) may come as a slight
  permutation of a particular table arrangement. The function
  \code{\link{normTable}} expects internally a schema description (a list
  that describes the position of the data components) for each data table,
  which is saved as \code{paste0("meta_", dSeries, TAB_NUMBER)}. See package
  \code{tabshiftr}.
}
\examples{
if(dev.interactive()){
  # build the example database
  makeExampleDB(until = "regGeometry", path = tempdir())

  # the schema description for this table
  library(tabshiftr)

  schema_madeUp <-
    setIDVar(name = "al1", columns = 1) \%>\%
    setIDVar(name = "year", columns = 2) \%>\%
    setIDVar(name = "commodities", columns = 3) \%>\%
    setObsVar(name = "harvested",
              factor = 1, columns = 4) \%>\%
    setObsVar(name = "production",
              factor = 1, columns = 5)

  regTable(nation = "Estonia",
           subset = "barleyMaize",
           dSeries = "madeUp",
           gSeries = "gadm",
           level = 1,
           begin = 1990,
           end = 2017,
           schema = schema_madeUp,
           archive = "example_table.7z|example_table1.csv",
           archiveLink = "...",
           nextUpdate = "2019-10-01",
           updateFrequency = "quarterly",
           metadataLink = "...",
           metadataPath = "my/local/path",
           update = TRUE)
}
}
\seealso{
Other register functions: 
\code{\link{regDataseries}()},
\code{\link{regGeometry}()}
}
\concept{register functions}
