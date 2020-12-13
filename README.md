
<!-- README.md is generated from README.Rmd. Please edit that file -->

# huecontroller

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

`huecontroller` allows to easily control Philips Hue lights from R.

It has intuitive commands that make it easy to make common tasks such as
turning lights on or off and changing brightness or light temperature.

It is functional and can be used to adjust lights at home.

It does not yet have a Shiny app, but it probably will.

It can already be used for making video data visualisations, but sooner
or later it will probably have a dedicated vignette and some more
functions to make this easier.

## Installation

You can install `huecontroller` with:

``` r
remotes::install_github("giocomai/huecontroller")
```

## Basic use

First, you’ll need to get you username for the API’s [detailed on the
official
website](https://developers.meethue.com/develop/get-started-2/).

At the beginning of each session, set up parameters: actual ip of your
bridge, and actual username as retrived via the instructions above.

``` r
library("huecontroller")


hue_settings(ip = "192.168.0.111",
             username = "actual_username_from_API")
```

With the following command, you will see all the names of your lights.

``` r
hue_get_lights_names()
```

In all `huecontroller` functions you will be able to refer to light
indifferently using either their numeric id or their *exact* name.

Turn on and off.

``` r
hue_turn_on("Living Room 1")
hue_turn_off("Living Room 1")
```

Make light a bit brighter.

``` r
hue_set_light_brightness(id = "Living Room 1",
                         brightness = "+",
                         by = 10)
```

Set it to arbitrary birghtness (max = 254)

``` r
hue_set_light_brightness(id = "Living Room 1",
                         brightness = 254)
```

Make it warmer:

``` r
hue_set_light_temperature(id = "Living Room 1",
                          temperature = "+",
                          by = 10)
```

or colder:

``` r
hue_set_light_temperature(id = "Living Room 1",
                          temperature = "-",
                          by = 10)
```

## Get and set anything available in the API for specific lights

The following command will output a list object with all available
details shared by the APIs.

``` r
hue_get_light_status(id = "Living Room 1")
```

Details on the exact format of the lights API are [available on the
official website](https://developers.meethue.com/develop/hue-api/).

You can set any of them giving them as a list to `hue_set_state()`,
e.g. like this:

``` r
hue_set_state(id = "Living Room 1",
              params = list(on = TRUE,
                            sat = 250, 
                            bri = 250, 
                            hue = 2000))
```

Keep in mind that if you want to identify lights by their numeric id,
you should pass the argument as a numeric, not a character, e.g.

``` r
hue_set_state(id = 11, # not `id = "11"`
              params = list(on = TRUE,
                            sat = 250, 
                            bri = 250, 
                            hue = 2000))
```
