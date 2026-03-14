# Set brightness of group

Set brightness of group

## Usage

``` r
hue_set_group_brightness(id, brightness, by = 10)
```

## Arguments

- id:

  If numeric, numeric id of group. If character, name of group. You can
  check id and names with
  [`hue_get_groups_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_groups_names.md)

- brightness:

  A numeric value, or one of either "brighter" (or "+") or "darker" (or
  "-"). The highest value is 254, the lowest 1.

- by:

  Numeric, defaults to 10. Ignored if brightness is numeric. Otherwise
  determines the size of the increment/decrement.

## Value

Silently returns http response from the bridge, but mostly used for its
side effects.
