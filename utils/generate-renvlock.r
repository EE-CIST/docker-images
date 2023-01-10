
library("renv")

repos <- c(CRAN = "https://cloud.r-project.org")

options(renv.settings.r.version = "4.2.2", repos = repos)

renv::init()
renv::snapshot()
renv::record("proj4@1.0-12")
renv::record("rgdal@1.6-3")
renv::record("sp@1.5-1")
renv::record("rgeos@0.6-1")
renv::record("RColorBrewer@1.1-3")
renv::record("sf@1.0-9")
renv::record("raster@3.6-13")
renv::record("Rcpp@1.0.9")
renv::record("terra@1.6-47")
renv::record("proxy@0.4-27")
renv::record("e1071@1.7-12")
renv::record("classInt@0.4-8")
renv::record("DBI@1.1.3")
renv::record("magrittr@2.0.3")
renv::record("wk@0.7.1")
renv::record("s2@1.1.1")
renv::record("units@0.8-1")
renv::record("knitr@1.31")
renv::record("rmarkdown@2.19")
renv::record("quarto@1.2")


#lock <- lockfile(file = NA, project = NULL)

#lock$repos(CRAN = "https://cran.r-project.org")

#lock$add(digest = "digest@0.6.22")

#lock$write("renv.lock")
