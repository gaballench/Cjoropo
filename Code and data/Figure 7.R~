library(Rfit)

source("datasets.R")
source("analyses.R")

png("Figure 5.png", width = 1500, height = 1500*2, pointsize = 48)

split.screen(c(2, 1))

screen(1)
plot(Mouth.W. ~ Head.L., data=dataset, main = "Mouth width vs. Head length", 
     xlab = "HL (mm)", ylab = "Mouth W. (mm)")
points(dataset$Mouth.W.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$Head.L.[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Mouth.W.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$Head.L.[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Mouth.W.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    Head.L.[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Mouth.W.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    Head.L.[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)

screen(2)
plot(Dorsal.pelvic.D. ~ SL, data=dataset, main = "Dorsal-pelvic distance vs SL", 
     xlab = "SL (mm)", ylab = "Dorsal-pelvic D. (mm)")
points(dataset$Dorsal.pelvic.D.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Dorsal.pelvic.D.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Dorsal.pelvic.D.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    SL[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Dorsal.pelvic.D.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    SL[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)
dev.off()
