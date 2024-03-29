# define global variables for internal use
globalVariables(c(
  ".",
  ".data",
  "amount",
  "al1",
  "al2",
  "broader",
  "col_name",
  "col_type",
  "description",
  "external",
  "gazClass",
  "gazID",
  "gazID2",
  "gazMatch",
  "gazName",
  "geoID",
  "geom",
  "has_broader",
  "has_exact_match",
  "has_source",
  "id",
  "intersect_area",
  "label",
  "lvl",
  "newName",
  "new_name",
  "outMatch",
  "outString",
  "ontoID",
  "ontoName",
  "prevChildren",
  "rn",
  "s2_area",
  "s2_geom",
  "s2_overlap",
  "s2_prop",
  "s3_area",
  "s3_geom",
  "s3_overlap",
  "s3_prop",
  "target",
  "tempID",
  "thisName",
  "siblings",
  "has_close_match",
  "has_broader_match",
  "has_narrower_match",
  "toExport",
  "externalID",
  "theColumn",
  "new_label",
  "parentID",
  "source_overlap",
  "target_overlap"
))

.onAttach <- function(libname, pkgname){
  options(adb_testing = FALSE)
}