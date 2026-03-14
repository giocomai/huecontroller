# Get state of given group

Get state of given group

## Usage

``` r
hue_get_group_lights(id)
```

## Arguments

- id:

  If numeric, numeric id of group. If character, name of group. You can
  check id and names with
  [`hue_get_groups_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_groups_names.md)

## Value

An integer vector with id of lights included in a group.
