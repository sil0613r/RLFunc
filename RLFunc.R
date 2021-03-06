# reads x1 (x) and x2 (y)
x <- readline(prompt='x1 = ')
y <- readline(prompt='x2 = ')

# reads the equation
fexpr <- readline(prompt='f(x) = ')

# replaces the 'x' in the equation with x1 and x2
fxunsolved <- gsub('x', x, fexpr, ignore.case = TRUE)
fyunsolved <- gsub('x', y, fexpr, ignore.case = TRUE)

# converts from string to expression
fxsolved <- parse(text = fxunsolved)
fysolved <- parse(text = fyunsolved)

# solves the equation
fxresult <- eval(fxsolved)
fyresult <- eval(fysolved)

# prints the results
print(paste('{x1 , f(x1)} = {',x,',',fxresult,'}'))
print(paste('{x2 , f(x2)} = {',y,',',fyresult,'}'))

# converts x and y to int
xint <- as.integer(x)
yint <- as.integer(y)

# creates a empty variable
xysize <- NULL

# choose auto size or custom
seglenghtopt <- readline(prompt = 'Choose X axis and Y axis size (1 auto , 2 custom): ')

# checks if seglenghtopt is '1' or '2' 
if(seglenghtopt == '1') {
  xysize <- max(abs(xint),abs(fxresult),abs(yint),abs(fyresult))
} else if(seglenghtopt == '2'){
  xysize <- readline(prompt = 'Enter X axis and Y axis size: ')
} else{
  print('invalid option')
}

# converts string to integer
xysize = as.integer(xysize)

# 'transforms' from positive number to negative
xysizeneg <- xysize*-1
xysizepos <- xysize

# just to be sure that the segments are long enough
flineneg <- xysizeneg
flinepos <- xysizepos

# converts some strings to integers
x = as.integer(x)
y = as.integer(y)
xysizenegint = as.integer(xysizeneg)
xysizeposint = as.integer(xysizepos)

# creates plot, adds grid, adds legend and adds points
plot(c(x,y,0), c(fxresult,fyresult,0), xlim=c(xysizeneg, xysizepos), ylim=c(xysizeneg, xysizepos), xlab = 'X', ylab = 'Y')
text(x=x, y=fxresult, cex = 1, pos = 3, 'A')
text(x=y, y=fyresult, cex = 1, pos = 3, 'B')
grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = TRUE)
par(xpd=TRUE)
legend("topleft", inset=c(0,-0.2), legend=c(paste('A = {',x,',',fxresult,'}'),paste('B = {',y,',',fyresult,'}')))

# creates the segment that  passes through the points
segments(x0 = x, y0 = fxresult, x1 = y, y1 = fyresult, col = "red", lwd = 2)

# creates the function lines (ox and oy)
segments(x0 = flinepos, y0 = 0, x1 = flineneg, y1 = 0, col = "black")
segments(x0 = 0, y0 = flineneg, x1 = 0, y1 = flinepos, col = "black")

# adds 4 segments (2 per point) that connects the point to ox and oy
segments(x0 = y, y0 = fyresult, x1 = 0, y1 = fyresult, col ="blue", lty = "dotted", lwd = 2)
segments(x0 = y, y0 = fyresult, x1 = y, y1 = 0, col ="blue", lty = "dotted", lwd = 2)

segments(x0 = x, y0 = fxresult, x1 = 0, y1 = fxresult, col ="blue", lty = "dotted", lwd = 2)
segments(x0 = x, y0 = fxresult, x1 = x, y1 = 0, col ="blue", lty = "dotted", lwd = 2)