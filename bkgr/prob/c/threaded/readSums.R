results <- read.csv("addNoiseResults.csv")
N <- 45000


results$sx <- results$sx/N
results$sy <- results$sy/N
results$sx2 <- (results$sx2-N*results$sx*results$sx)/(N-1)
results$sy2 <- (results$sy2-N*results$sy*results$sy)/(N-1)

library(lattice)

## Plot a contour plot of the means for x for different values of
## gamma and delta.
print("making a contour plot for the x means")
png("sampleMeanXAdditiveNoise.png")
levelplot(results$sx ~ results$gamma*results$delta,contour=TRUE,
          xlab=expression(gamma),ylab=expression(delta),
          col.regions = colorRampPalette(c("blue","white")),
          main="Sample Mean of X (Additive Noise)")
dev.off()

## Plot a contour plot of the means for y for different values of
## gamma and delta.
print("making a contour plot for the y means")
png("sampleMeanYAdditiveNoise.png")
levelplot(results$sy ~ results$gamma*results$delta,contour=TRUE,
          xlab=expression(gamma),ylab=expression(delta),
          col.regions = colorRampPalette(c("blue","white")),
          main="Sample Mean of Y (Additive Noise)")
dev.off()

## Plot a contour plot of the means for x for different values of
## gamma and delta.
print("making a contour plot for the x variance")
png("sampleVarianceXAdditiveNoise.png")
levelplot(results$sx2 ~ results$gamma*results$delta,contour=TRUE,
          xlab=expression(gamma),ylab=expression(delta),
          col.regions = colorRampPalette(c("blue","white")),
          main="Sample Variance of X (Additive Noise)")
dev.off()

## Plot a contour plot of the means for y for different values of
## gamma and delta.
print("making a contour plot for the y variance")
png("sampleVarianceYAdditiveNoise.png")
levelplot(results$sy2 ~ results$gamma*results$delta,contour=TRUE,
          xlab=expression(gamma),ylab=expression(delta),
          col.regions = colorRampPalette(c("blue","white")),
          main="Sample Variance of Y (Additive Noise)")
dev.off()

