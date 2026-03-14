# Set colour of a group of lights with relevant capabilities

N.B. Colour accuracy may not be perfect. See the official documentation
for details, and consider using custom parameters with
[`hue_set_group_state()`](https://giocomai.github.io/huecontroller/reference/hue_set_group_state.md)
if this function does not achieve what you expect.
https://developers.meethue.com/develop/application-design-guidance/color-conversion-formulas-rgb-to-xy-and-back/

## Usage

``` r
hue_set_group_colour(id, colour, transition_time = 0.4)
```

## Arguments

- id:

  If numeric, numeric id of light. If character, name of light. You can
  check id and names with
  [`hue_get_groups_names()`](https://giocomai.github.io/huecontroller/reference/hue_get_groups_names.md)

- colour:

  A colour name as listed by
  [`colours()`](https://rdrr.io/r/grDevices/colors.html) or a
  hexadecimal colour string.

- transition_time:

  Duration of the transition in seconds. Defaults to 0.4 seconds.

## Examples

``` r
if (interactive()) {
  hue_set_group_colour(id = 11, colour = "green")
}
```
