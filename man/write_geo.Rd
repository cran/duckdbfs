% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_dataset.R
\name{write_geo}
\alias{write_geo}
\title{Write H3 hexagon data out as an h3j-compliant JSON file
NOTE: the column containing H3 hashes must be named \code{hexid}}
\usage{
write_geo(dataset, path, conn = cached_connection())
}
\arguments{
\item{dataset}{a remote tbl object from \code{open_dataset},
or an in-memory data.frame.}

\item{path}{a local file path or S3 path with write credentials}

\item{conn}{duckdbfs database connection}
}
\description{
Write H3 hexagon data out as an h3j-compliant JSON file
NOTE: the column containing H3 hashes must be named \code{hexid}
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# example code
\dontshow{\}) # examplesIf}
}
