context("Predict Serve Model")

test_serve_predict <- function(instances, model) {
  results <- predict_savedmodel(
    instances = instances,
    model = model,
    type = "serve_test"
  )

  expect_true(!is.null(results$predictions))
  expect_true(!is.null(results$predictions[[1]]))
}

test_that("can predict tensorflow mnist model in local serve", {
  test_serve_predict(
    instances = list(
      list(images = rep(0, 784))
    ),
    model = system.file("models/tensorflow-mnist", package = "tfdeploy")
  )
})

test_that("can predict keras mnist model in local serve", {
  test_serve_predict(
    instances = list(
      list(image_input = rep(0, 784))
    ),
    model = "models/keras-mnist"
  )
})

test_that("can predict tensorflow with multiple tensors model in local serve", {
  test_serve_predict(
    instances = list(
      list(i1 = "One", i2 = "Two"),
      list(i1 = "One", i2 = "Two")
    ),
    model = "models/tensorflow-multiple"
  )
})

test_that("can predict keras with multiple tensors model in local serve", {
  test_serve_predict(
    instances = list(
      list(input1 = 1, input2 = 2),
      list(input1 = 3, input2 = 4)
    ),
    model = "models/keras-multiple"
  )
})
