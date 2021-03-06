#' Predict using a Web API
#'
#' Performs a prediction using a Web API providing a SavedModel.
#'
#' @inheritParams predict_savedmodel
#'
#' @export
predict_savedmodel.webapi_prediction <- function(
  instances,
  model,
  ...) {

  httr::POST(
    url = model,
    body = list(
      instances = instances
    ),
    encode = "json"
  ) %>% httr::content(as = "text") %>%
    jsonlite::fromJSON(simplifyDataFrame = FALSE) %>%
    append_predictions_class()

}
