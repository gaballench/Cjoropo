library(Rfit)

source("datasets.R")
source("measurements.R")


png("Dorsal-pectoral.png", 480, 480)
plot(Dorsal.pectoral.D. ~ SL, data=dataset, main = "Dorsal-pectoral distance vs. SL")
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
dev.off()

png("Caudal-peduncle.png", 480, 480)
plot(Caudal.peduncle.Dp. ~ SL, data=dataset, main = "Caudal peduncle depth vs. SL")
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
dev.off()

png("Pelvic-dorsal.png", 480, 480)
plot(Pelvic.dorsal.D. ~ SL, data=dataset, main = "Pelvic-dorsal distance vs. SL")
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
dev.off()

png("Head-eye.png", 480, 480)
plot(Head.eye.L. ~ Head.L., data=dataset, main = "Head-eye length vs. Head length")
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

png("Mouth-width.png", 480, 480)
plot(Mouth.W. ~ Head.L., data=dataset, main = "Mouth width vs. Head length")
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
dev.off()

# Heterogeneous and significant (var and p-value)

png("Dorsal-pelvic.png", 480, 480)
plot(Dorsal.pelvic.D. ~ SL, data=dataset, main = "Dorsal-pelvic distance vs SL")
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


# Heterogeneous and non-significant (var and p-value)

png("Head-dorsal.png", 480, 480)
plot(Head.dorsal.L. ~ SL, data=dataset, main = "Head-dorsal length vs. SL")
points(dataset$Head.dorsal.L.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Head.dorsal.L.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Head.dorsal.L.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    SL[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Head.dorsal.L.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    SL[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)
dev.off()

png("Dorsal-spine.png", 480, 480)
plot(Dorsal.spine.L. ~ SL, data=dataset, main = "Dorsal spine length vs. SL")
points(dataset$Dorsal.spine.L.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Dorsal.spine.L.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$SL[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Dorsal.spine.L.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    SL[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Dorsal.spine.L.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    SL[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)
dev.off()

png("Mouth-length.png", 480, 480)
plot(Mouth.L. ~ Head.L., data=dataset, main = "Mouth length vs. Head length")
points(dataset$Mouth.L.[which(dataset$Species == "Chaetostoma milesi")], 
       x = dataset$Head.L.[which(dataset$Species == "Chaetostoma milesi")], 
       col = "blue", pch = 16)
points(dataset$Mouth.L.[which(dataset$Species == "Chaetostoma joropo")], 
       x = dataset$Head.L.[which(dataset$Species == "Chaetostoma joropo")], 
       col = "red", pch = 16)
abline(rfit(Mouth.L.[which(dataset$Species == "Chaetostoma joropo")] ~ 
                    Head.L.[which(dataset$Species == "Chaetostoma joropo")], 
            data=dataset), lty = 1, col = "red")
abline(rfit(Mouth.L.[which(dataset$Species == "Chaetostoma milesi")] ~ 
                    Head.L.[which(dataset$Species == "Chaetostoma milesi")], 
            data=dataset), lty = 1, col = "blue")
legend(x = "topleft", legend = c(expression(italic("Chaetostoma joropo")), expression(italic("Chaetostoma milesi"))), 
       col = c("red", "blue"), lty = 1)
dev.off()
