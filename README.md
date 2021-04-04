# RLFunc
A script made in R that solves linear functions with 2 points.

## How to use:
### Example:
![text_ex](/images/text_input_and_output.PNG)
![plot_ex](/images/plot_output.png)

## Error examples:
### In math `x3` == `x*3` but in this case x3 == 2 digits number
![error1](/images/error1.PNG)

### `:` == division but in this case it's an array
![error2](/images/error2.PNG)

### It needs to be a lowercase `x`, not an uppercase `X`
![error3](/images/error3.PNG)


## Here's a list with all the known "unwanted features"
- X != x
- `:` != `/`
- ex: x = 2 | 3x is `32`, not `3*2`

## To do:
- Add legend to plot
- Auto size plot 
- Custom x axis and y axis size
- Fix **all** the bugs
