#' Gets ISS passtimes from API
#'
#' @param lat
#'
#' @return A data frame
#'
#' @export
get_passtimes <- function(lat,
                          long,
                          elevation = 70,
                          hours = 12) {

  # stopifnot("Need numeric inputs" = is.numeric(lat) & is.numeric(long))

  if (!is.numeric(lat) | !is.numeric(long)) {
    stop("Inputs must be numeric")
  }

  lat <- round(lat, digits = 1)
  long <- round(long, digits = 1)


  url <- glue::glue("https://api.g7vrd.co.uk/v1/satellite-passes/25544/{lat}/{long}.json?minelevation={elevation}&hours={hours}")

  json_text <- httr::GET(url)

  data <- jsonlite::fromJSON(rawToChar(json_text$content))

  if (is.list(data)) {
    data <- data.frame(data$passes)

  }

  if (nrow(data) == 0) {
    data <- data.frame(start = NA,
                       tca = NA,
                       end = NA)
  }

  return(data)

}
