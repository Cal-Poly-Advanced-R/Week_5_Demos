#' Add two column
#'
#' @param dat A dataframe
#' @param col_1 A quoted column name
#' @param col_2 A quoted column name
#'
#' @return A number which is the sum of the two inputs
#'
#' @export
simple_addition <- function(dat, col_1, col_2) {
  dat[["new_col"]] <- dat[[col_1]] + dat[[col_2]]

  return(dat)
}


#' Find means by group
#'
#' @param dat A dataframe
#' @param col_1 A unquoted column name
#' @param col_2 A unquoted column name
#'
#' @return A summarized dataset with group means
#'
#' @import dplyr
#'
#' @export
grouped_mean_tidy <- function(dat, col_1, col_2) {

  dat <- dat %>%
    group_by({{col_1}}) %>%
    summarize(mean({{col_2}})) %>%
    arrange({{col_2}})

  return(dat)
}


#' Add two column
#'
#' @param dat A dataframe
#' @param col_1 A unquoted column name
#' @param col_2 A unquoted column name
#'
#' @return A dataset with new column summing the input cols
#'
#' @export
simple_addition_tidy <- function(dat, col_1, col_2) {

  dat <- dat %>%
    mutate(
      new_col = !!enquo(col_1) + !!enquo(col_2)
    )

  return(dat)
}
