test_that("Passtimes are found for SLO", {
  my_result <- get_passtimes(35.28, -120)

  expect_equal(names(my_result), c("start", "tca", "end"))
  expect_equal(class(my_result), "data.frame")

})

test_that("Dataframe is correct size", {
  my_result <- get_passtimes(35.28, -120)

  expect_equal(nrow(my_result), 1)
})

test_that("Non-numeric input breaks it", {

  expect_error(get_passtimes("a", -120))

})
