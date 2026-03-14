# Convert hex colour to

Convert hex colour to

## Usage

``` r
hue_convert_to_hue_sat(colour)
```

## Arguments

- colour:

  A colour name as listed by
  [`colours()`](https://rdrr.io/r/grDevices/colors.html) or a
  hexadecimal colour string.

## Value

A named list with two elements: `hue` and `sat`

## Examples

``` r
hue_convert_to_hue_sat("red")
#> $hue
#> [1] 0
#> 
#> $sat
#> [1] 255
#> 
hue_convert_to_hue_sat("#E414FF")
#> $hue
#> [1] 53358
#> 
#> $sat
#> [1] 235
#> 
if (interactive()) {
  hue_convert_to_hue_sat(colourpicker::colourPicker(numCols = 1))
}
```
