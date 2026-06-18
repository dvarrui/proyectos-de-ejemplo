#!/usr/bin/env ruby

imagen='images/11.png'
edades = [ 20, 33, 40, 12, 50, 26, 18, 79, 47, 23, 8 ]
data = edades.join(', ')

rscript = <<RSCRIPT
png("#{imagen}")
edades <- c(#{data})
plot(edades, main = "Edades", xlab = "Nº de orden", ylab = "Años")
garbage <- dev.off()
RSCRIPT

cmd = "R --vanilla --slave <<RPROGRAM\n#{rscript}\nRPROGRAM"
system(cmd)
