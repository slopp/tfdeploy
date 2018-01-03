tfdeploy: Deploys TensorFlow Models
================

[![Build Status](https://travis-ci.org/rstudio/tfdeploy.svg?branch=master)](https://travis-ci.org/rstudio/tfdeploy)

`tfdeploy` provies tools for deploying TensorFlow SavedModels into local and remove services.

SavedModels can be trained using `tensorflow`, `keras` or `tfestimators` and exported using `export_savedmodel()`; or using any other TensorFlow tool that exports them using then [tf.train.Saver](https://www.tensorflow.org/api_docs/python/tf/train/Saver) interface.

To get started, you can also use one of the pretrained models included in this package:

``` r
library(tfdeploy)
model_path <- system.file("models/tensorflow-mnist/", package = "tfdeploy")
```

### Local Deployment

`tfdeploy` provides a [GoogleML](https://cloud.google.com/ml-engine/docs/prediction-overview) compatible local R server that provides a web API to the the SavedModel using `serve_savedmodel()`:

``` r
serve_savedmodel(model_path)
```

<img src="tools/readme/swagger.png" width=500 />

This local webapi can be accessed with `curl`, `httr`, `jsonlite`, etc. or using the `predict_savedmodel()` deployment client.

### Deployment Client

`tfdeploy` provides a client capable of performing predictions over a SavedModel for local or remote models. A prediction over a local model can be performed using `predict_savedmodel()` as follows:

``` r
predict_savedmodel(rep(0, 784), model_path)
```

    ## $predictions
    ##                                                                           scores
    ## 1 0.0546, 0.1139, 0.0884, 0.0610, 0.0807, 0.2974, 0.0721, 0.1485, 0.0189, 0.0645

We can make use of the `pixels` HTMLWidget to manually collect a vector of pixels and perform a prediction over the model:

``` r
predict_savedmodel(pixels::get_pixels(), model_path)
```

To run a prediction against a service running `serve_savedmodel()` or a compatible webapi we run:

``` r
predict_savedmodel(
  pixels::get_pixels(),
  url = "<service-url>",
  type = "webapi"
)
```

Predictions over CloudML models are accessed using:

``` r
predict_savedmodel(
  pixels::get_pixels(),
  model = "<model>",
  version = "<version>",
  type = "cloudml"
)
```

<img src="tools/readme/mnist-digits.gif" width=400 />
