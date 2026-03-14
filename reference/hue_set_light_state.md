# Change state of Hue lights

Change state of Hue lights

## Usage

``` r
hue_set_light_state(id, params)
```

## Arguments

- id:

  If numeric, numeric id of light. If character, name of light. You can
  check id and names with
  [`hue_get_lights_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_lights_names.md)

- params:

  A named list. For a full list of available parameters, check
  https://developers.meethue.com/develop/hue-api/lights-api/
