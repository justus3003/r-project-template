test_that("greet returns a greeting", {
  expect_equal(greet("World"), "Hello, World!")
})

test_that("greet validates its input", {
  expect_error(greet(1))
  expect_error(greet(""))
})
