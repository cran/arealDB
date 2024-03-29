% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/normTable.R
\name{normTable}
\alias{normTable}
\title{Normalise data tables}
\usage{
normTable(
  input = NULL,
  pattern = NULL,
  ontoMatch = NULL,
  outType = "rds",
  beep = NULL,
  update = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{input}{[\code{character(1)}]\cr path of the file to normalise. If this
is left empty, all files at stage two as subset by \code{pattern} are
chosen.}

\item{pattern}{[\code{character(1)}]\cr an optional regular expression. Only
dataset names which match the regular expression will be processed.}

\item{ontoMatch}{[\code{character(.)}]\cr name of the column(s) that shall be
matched with an ontology (defined in \code{\link{start_arealDB}}).}

\item{outType}{[\code{logical(1)}]\cr the output file-type, currently
implemented options are either \emph{*.csv} (more exchangeable for a
workflow based on several programs) or \emph{*.rds} (smaller and less
error-prone data-format but can only be read by R efficiently).}

\item{beep}{[\code{integerish(1)}]\cr Number specifying what sound to be
played to signal the user that a point of interaction is reached by the
program, see \code{\link[beepr]{beep}}.}

\item{update}{[\code{logical(1)}]\cr whether or not the physical files should
be updated (\code{TRUE}) or the function should merely return the new
object (\code{FALSE}, default). This is helpful to check whether the
metadata specification and the provided file(s) (translation and ID tables)
are properly specified.}

\item{verbose}{[\code{logical(1)}]\cr be verbose about translating terms
(default \code{FALSE}). Furthermore, you can use
\code{\link{suppressMessages}} to make this function completely silent.}
}
\value{
This function harmonises and integrates so far unprocessed data
  tables at stage two into stage three of the areal database. It produces for
  each main polygon (e.g. nation) in the registered data tables a file that
  includes all thematic areal data.
}
\description{
Harmonise and integrate data tables into standardised format
}
\details{
To normalise data tables, this function proceeds as follows:
  \enumerate{ \item Read in \code{input} and extract initial metadata from
  the file name. \item Employ the function
  \code{tabshiftr::\link{reorganise}} to reshape \code{input} according to
  the respective schema description. \item The territorial names are matched
  with the gazetteer to harmonise new territorial names (at this step, the
  function might ask the user to edit the file 'matching.csv' to align new
  names with already harmonised names). \item Harmonise territorial unit
  names. \item If \code{update = TRUE}, store the processed data table at
  stage three.}
}
\examples{
if(dev.interactive()){
  # build the example database
  makeExampleDB(until = "normGeometry", path = tempdir())

  # normalise all available data tables ...
  normTable(update = TRUE)

  # ... and check the result
  output <- readRDS(paste0(tempdir(), "/adb_tables/stage3/Estonia.rds"))
}
}
\seealso{
Other normalise functions: 
\code{\link{normGeometry}()}
}
\concept{normalise functions}
