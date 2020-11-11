##1. Plot a cheat-sheet with values of color and point type (col = , and pch = ) from 1 to 25, and export it as a jpeg of 15 cm wide, 6 cm high and resolution 100 points per cm.
jpeg(filename = "cheatsheet2.jpeg", width = 15, height = 6,
     res = 100, units = "cm", bg = "transparent")
plot(0, 0, xlim = c(0, 26), ylim = c(0.5, 1.5), ylab = "", xlab = "", yaxt = "n")
axis(2,1, labels = c("pch"))
for (i in 1:25) {
  points(i, 1, pch = i, col = i, cex = 3)
}
dev.off()
##2. Plot into a graph ten Poisson distributions with lambda ranging from 1 to 10. Put legend and title. Export it as a .tiff file with size of 15x15 cm.
tiff(filename = "10-Poisson-dist.tiff", width = 15, height = 15, units = "cm", bg = "transparent", res = 100)

x <- seq(0, 25, 1)
y <-  dpois(x, lambda = 1) 
plot(x, y, type = "n")
for (i in 1:10) {          
  y <- dpois(x, lambda = i)   
  lines(x, y, col = i)                       
}
legend("topright", legend = paste("lambda =", 1:10)
       , lty = 1, col = 1:10)
title(main = "Poisson distributions, lambda= 1:10")
dev.off()
##3. Import data from this article: https://peerj.com/articles/328/
#With these data, using for(), plot graphs to represent the effect of all the numerical variables, from "richness" to "mean_quality" on "yield". Choose the type of graph that you think better represents this effect for the different species. Create only one pdf with all the graphs inside.
webcsv <- "https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"
CropData <- read.csv(webcsv, skip = 2, sep = ",")  #Importing data

pdf(file = "rplot3.pdf")

CropNames <- as.factor(CropData$crop)
a <- "Relationship between"                        #Creating vectors for the title
c <- "and mean yields"
for(i in names(CropData)[6:12]){
  plot(CropData$mean_yield ~ CropData[[i]], ylab = "Mean Yield", xlab = i,
       col = CropNames)
  legend("topright", legend = levels(as.factor(CropData$crop)),
         pch = T, col = (1:4))
  b <- c(a,i,c)
  title(b)
}

dev.off()
