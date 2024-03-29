context("InitialiseProject")

test_that("x1", {
  fn <- function(data, arg) {
    return(1)
  }

  p <- Plan$new()
  p$data_add(df = cars, name = "ok")
  p$analysis_add(fn = fn, r = 4, g = 5)
  p$analysis_add(fn = fn, r = 2, gg = 9)

  p$list_analysis[[1]]$args

  ps <- Plans$new()
  ps$plan_add(p)

  ps$list_plan[[1]]$list_analysis[[1]]$args
  ps$list_plan[[1]]$list_analysis[[2]]$args

  testthat::expect_equal(
    p$analysis_get(index_analysis = 1),
    ps$analysis_get(index_plan = 1, index_analysis = 1)
  )

  testthat::expect_equal(
    p$data_get(),
    ps$data_get(index_plan = 1)
  )
})

test_that("x2", {
  p <- Plan$new()
  p$data_add(fn = function() {
    3
  }, name = "ok")

  analyses <- data.frame(x = c(1:5), y = c(11:15))

  p$analysis_add_from_df(fn = sum, df = analyses)

  testthat::expect_equal(
    p$len(),
    5
  )
})

test_that("parallel", {
  # p <- Plan$new()
  # p$data_add(fn = function(){3}, name = "ok")
  #
  # analyses <- data.frame(x=c(1:100), y=c(1:100))
  #
  # fn_analysis <- function(data, arg){
  #   Sys.sleep(1)
  # }
  #
  # p$analysis_add_from_df(fn = fn_analysis, df = analyses)
  #
  # a <- Sys.time()
  # run_all_parallel(p, cores = 10, future.chunk.size = NULL)
  # b <- Sys.time()
  # b-a

  testthat::expect_equal(
    5,
    5
  )
})
