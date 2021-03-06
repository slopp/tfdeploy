% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_export.R
\name{predict_savedmodel.export_prediction}
\alias{predict_savedmodel.export_prediction}
\title{Predict using an Exported SavedModel}
\usage{
\method{predict_savedmodel}{export_prediction}(instances, model,
  signature_name = "serving_default", ...)
}
\arguments{
\item{instances}{A list of prediction instances to be passed as input tensors
to the service. Even for single predictions, a list with one entry is expected.}

\item{model}{The model as a local path, a REST url, CloudML name or graph object.

A local path can be exported using \code{export_savedmodel()}, a REST URL
can be created using \code{serve_savedmodel()}, a CloudML model can be deployed
usin \code{cloudml::cloudml_deploy()} and a graph object loaded using
\code{load_savedmodel()}.

Notice that predicting over a CloudML model requires a \code{version}
parameter to identify the model.

A \code{type} parameter can be specified to explicitly choose the type model
performing the prediction. Valid values are \code{cloudml}, \code{export},
\code{webapi} and \code{graph}.}

\item{signature_name}{The named entry point to use in the model for prediction.}

\item{...}{See \code{\link[=predict_savedmodel.export_prediction]{predict_savedmodel.export_prediction()}},
\code{\link[=predict_savedmodel.graph_prediction]{predict_savedmodel.graph_prediction()}},
\code{\link[=predict_savedmodel.webapi_prediction]{predict_savedmodel.webapi_prediction()}}
and \code{\link[=predict_savedmodel.cloudml_prediction]{predict_savedmodel.cloudml_prediction()}} for additional options.

#' @section Implementations:
\itemize{
\item \code{\link[=predict_savedmodel.export_prediction]{predict_savedmodel.export_prediction()}}
\item \code{\link[=predict_savedmodel.graph_prediction]{predict_savedmodel.graph_prediction()}}
\item \code{\link[=predict_savedmodel.webapi_prediction]{predict_savedmodel.webapi_prediction()}}]
\item \code{\link[=predict_savedmodel.cloudml_prediction]{predict_savedmodel.cloudml_prediction()}}
}}
}
\description{
Performs a prediction using a locally exported SavedModel.
}
