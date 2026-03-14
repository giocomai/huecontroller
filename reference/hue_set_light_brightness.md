# Set brightness of light

Set brightness of light

## Usage

``` r
hue_set_light_brightness(id, brightness, by = 10)
```

## Arguments

- id:

  If numeric, numeric id of light. If character, name of light. You can
  check id and names with
  [`hue_get_lights_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_lights_names.md)

- brightness:

  A numeric value, or one of either "brighter" (or "+") or "darker" (or
  "-"). The highest value is 254, the lowest 1.

- by:

  Numeric, defaults to 10. Ignored if brightness is numeric. Otherwise
  determines the size of the increment/decrement.

## Value

Silently returns http response from the bridge, but mostly used for its
side effects.
