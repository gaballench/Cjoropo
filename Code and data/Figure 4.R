library(Rfit)

source("datasets.R")
source("analyses.R")


png("Figure 4.png", width = 1500, height = 1500, pointsize = 24)

split.screen(c(2, 2))

screen(1)
plot(Dorsal.pectoral.D. ~ SL, data=dataset, main = "Dorsal-pectoral distance vs. SL", 
     xlab = "SL (mm)", ylab = "Dorsal-pectoral D. (mm)")
points(dataset$Dorsal.pectoral.D.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Dorsal.pectoral.D.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Dorsal.pectoral.D.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    SL[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Dorsal.pectoral.D.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    SL[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)


screen(2)
plot(Caudal.peduncle.Dp. ~ SL, data=dataset, main = "Caudal peduncle depth vs. SL", 
     xlab = "SL (mm)", ylab = "Caudal peduncle Dp. (mm)")
points(dataset$Caudal.peduncle.Dp.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Caudal.peduncle.Dp.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Caudal.peduncle.Dp.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    SL[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Caudal.peduncle.Dp.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    SL[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)


screen(3)
plot(Pelvic.dorsal.D. ~ SL, data=dataset, main = "Pelvic-dorsal distance vs. SL", 
     xlab = "SL (mm)", ylab = "Pelvic-dorsal D. (mm)")
points(dataset$Pelvic.dorsal.D.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Pelvic.dorsal.D.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Pelvic.dorsal.D.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    SL[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Pelvic.dorsal.D.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    SL[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)

screen(4)
plot(Head.eye.L. ~ Head.L., data=dataset, main = "Head-eye length vs. Head length", 
     xlab = "HL (mm)", ylab = "Head-eye L. (mm)")
points(dataset$Head.eye.L.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$Head.L.[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Head.eye.L.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$Head.L.[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Head.eye.L.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    Head.L.[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Head.eye.L.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    Head.L.[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)

dev.off()
