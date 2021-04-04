# reads x1 (x) and x2 (y)
x <- readline(prompt='x1 = ')
y <- readline(prompt='x2 = ')

# reads the equation
fexpr <- readline(prompt='f(x) = ')

# replaces the 'x' in the equation with x1 and x2
fxunsolved <- gsub('x', x, fexpr)
fyunsolved <- gsub('x', y, fexpr)

# converts from string to expression
fxsolved <- parse(text = fxunsolved)
fysolved <- parse(text = fyunsolved)

# solves the equation
fxresult <- eval(fxsolved)
fyresult <- eval(fysolved)

# prints the results
print(paste('x1 , f(x1) = {',x,',',fxresult,'}'))
print(paste('x2 , f(x2) = {',y,',',fyresult,'}'))

# reads the size for x and y axis
xysize <- readline(prompt = 'X axis and Y axis size is: ')

# converts string to integer
xysize = as.integer(xysize)

# 'transforms' from positive number to negative
xysizeneg <- xysize*-1
xysizepos <- xysize

# just to be sure that the sgments are long enough
flineneg <- xysizeneg*100000
flinepos <- xysizepos*100000

# converts some strings to integers
x = as.integer(x)
y = as.integer(y)
xysizenegint = as.integer(xysizeneg)
xysizeposint = as.integer(xysizepos)

# creates plot, adds grid and points
plot(c(x,y,0), c(fxresult,fyresult,0), xlim=c(xysizeneg, xysizepos), ylim=c(xysizeneg, xysizepos), xlab = 'X', ylab = 'Y')
grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = TRUE)

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
