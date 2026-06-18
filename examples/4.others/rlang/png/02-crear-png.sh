#!/usr/bin/env bash

IMAGEN='images/02.png'

R --vanilla --slave <<RSCRIPT
cat("[INFO] Plotting...\n")
png("$IMAGEN")
 
edades <- c(20, 33, 40, 12, 50, 26, 18, 79, 47, 23, 8)
plot(edades, main = "Edades", xlab = "Nº de orden", ylab = "Años")
 
garbage <- dev.off()
RSCRIPT
