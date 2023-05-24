#!/usr/bin/env bash

DATAFILE='03-data.txt'
IMAGEN='images/03.png'

R --vanilla --slave <<RSCRIPT
cat("Plotting $DATAFILE to $IMAGEN\n")
input <- read.table("$DATAFILE")
png("$IMAGEN")
plot(as.numeric(input[1,]))
garbage <- dev.off()
RSCRIPT

