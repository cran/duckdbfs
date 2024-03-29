% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/to_sf.R
\name{to_sf}
\alias{to_sf}
\title{Convert output to sf object}
\usage{
to_sf(x, crs = NA, conn = cached_connection())
}
\arguments{
\item{x}{a remote duckdb \code{tbl} (from \code{open_dataset}) or dplyr-pipeline thereof.}

\item{crs}{The coordinate reference system, any format understood by \code{sf::st_crs}.}

\item{conn}{the connection object from the tbl.
Takes a duckdb table (from \code{open_dataset}) or a dataset or dplyr
pipline and returns an sf object. \strong{Important}: the table must have
a \code{geometry} column, which you will almost always have to create
first.

Note: \code{to_sf()} triggers collection into R.  This function is suitable
to use at the end of a dplyr pipeline that will subset the data.
Using this function on a large dataset without filtering first may
exceed available memory.}
}
\value{
an \code{sf} class object (in memory).
}
\description{
Convert output to sf object
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

library(dplyr)
csv_file <- system.file("extdata/spatial-test.csv", package="duckdbfs")

# Note that we almost always must first create a `geometry` column, e.g.
# from lat/long columns using the `st_point` method.
sf <-
  open_dataset(csv_file, format = "csv") |>
  mutate(geom = ST_Point(longitude, latitude)) |>
  to_sf()

# We can use the full space of spatial operations, including spatial
# and normal dplyr filters.  All operations are translated into a
# spatial SQL query by `to_sf`:
open_dataset(csv_file, format = "csv") |>
  mutate(geom = ST_Point(longitude, latitude)) |>
  mutate(dist = ST_Distance(geom, ST_Point(0,0))) |>
  filter(site \%in\% c("a", "b", "e")) |>
  to_sf()

\dontshow{\}) # examplesIf}
}
