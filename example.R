# This is a simple R script to test your environment

# Print a message
print("Hello, R Development Container!")

# Create a simple plot
x <- 1:10
y <- x^2
plot(x, y, main="Simple Square Function Plot", xlab="x", ylab="y")

# List installed packages
installed.packages()[, c("Package", "Version")]
