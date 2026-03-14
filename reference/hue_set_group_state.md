# Change state of Hue groups

Change state of Hue groups

## Usage

``` r
hue_set_group_state(id, params)
```

## Arguments

- id:

  If numeric, numeric id of group. If character, name of group. You can
  check id and names with
  [`hue_get_groups_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_groups_names.md)

- params:

  A named list. For a full list of available parameters, check
  https://developers.meethue.com/develop/hue-api/groupds-api/
