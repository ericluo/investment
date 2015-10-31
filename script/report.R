rpt.dates <- function(rpt.years = format(Sys.Date(), "%Y"), rpt.quarters = c("0331", "0630", "0930", "1231")) {
  unlist(lapply(rpt.years, paste0, rpt.quarters))
}

