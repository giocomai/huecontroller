# Set temperature of light

Set temperature of light

## Usage

``` r
hue_set_light_temperature(id, temperature, by = 10)
```

## Arguments

- id:

  If numeric, numeric id of light. If character, name of light. You can
  check id and names with
  [`hue_get_lights_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_lights_names.md)

- temperature:

  A numeric value, or one of either "warmer" (or "+") or "colder" (or
  "-"). The warmest value available is usually 500, the coldest 153.

- by:

  Numeric, defaults to 10. Ignored if temperature is numeric. Otherwise
  determines the size of the increment/decrement.

## Value

Silently returns http response from the bridge, but mostly used for its
side effects.
