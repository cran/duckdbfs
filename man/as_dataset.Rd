% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_dataset.R
\name{as_dataset}
\alias{as_dataset}
\title{as_dataset}
\usage{
as_dataset(df, conn = cached_connection())
}
\arguments{
\item{df}{a local data frame.  Otherwise will be passed back without side effects}

\item{conn}{A connection to a database.}
}
\value{
a remote \code{dplyr::tbl} connection to the table.
}
\description{
Push a local (in-memory) dataset into a the duckdb database as a table.
This enables it to share the connection source with other data.
This is equivalent to the behavior of copy=TRUE on many (but not all) of the two-table verbs in dplyr.
}
