# Turn off light

Turn off light

## Usage

``` r
hue_turn_light_off(id)
```

## Arguments

- id:

  If numeric, numeric id of light. If character, name of light. You can
  check id and names with
  [`hue_get_lights_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_lights_names.md)

## Value

Silently returns http response from the bridge, but mostly used for its
side effects.
