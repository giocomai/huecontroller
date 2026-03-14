# Set temperature of group

Set temperature of group

## Usage

``` r
hue_set_group_temperature(id, temperature, by = 10)
```

## Arguments

- id:

  If numeric, numeric id of group. If character, name of group. You can
  check id and names with
  [`hue_get_groups_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_groups_names.md)

- temperature:

  A numeric value, or one of either "warmer" (or "+") or "colder" (or
  "-"). The warmest value available is usually 500, the coldest 153.

- by:

  Numeric, defaults to 10. Ignored if temperature is numeric. Otherwise
  determines the size of the increment/decrement.

## Value

Silently returns http response from the bridge, but mostly used for its
side effects.
