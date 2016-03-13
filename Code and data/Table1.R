library(xlsx) # Writing a table in xlsx format

source("datasets.R")

##### Subsetting by species in order to get single datasets for each one and picking only measurement variables #####
joropo <- corrected[which(corrected$Species == "Chaetostoma joropo"),]
joropo <- joropo[, -c(1:4, 40:54)]
milesi <- corrected[which(corrected$Species == "Chaetostoma milesi"),]
milesi <- milesi[, -c(1:4, 40:54)]
mwData <- corrected[, -c(2:4, 40:54)]

##### Table with measurements #####
joropoStats <- rbind(round(apply(joropo, 2, FUN = mean), 1), round(apply(joropo, 2, FUN = sd), 1), 
                     round(apply(joropo, 2, FUN = min), 1), round(apply(joropo, 2, FUN = max), 1))
joropoStats <- t(joropoStats)
joropoStats <- data.frame(joropoStats, paste(joropoStats[, 3], joropoStats[, 4], sep = " - "))
joropoStats <- joropoStats[, -c(3, 4)]
joropoStats <- cbind(rownames(joropoStats), joropoStats)
colnames(joropoStats) <- c("Measurement", "Mean", "SD", "Range")
rownames(joropoStats) <- NULL

milesiStats <- rbind(round(apply(milesi, 2, FUN = mean, na.rm  = TRUE), 1), 
                     round(apply(milesi, 2, FUN = sd, na.rm  = TRUE), 1), 
                     round(apply(milesi, 2, FUN = min, na.rm  = TRUE), 1), 
                     round(apply(milesi, 2, FUN = max, na.rm  = TRUE), 1))
milesiStats <- t(milesiStats)
milesiStats <- data.frame(milesiStats, paste(milesiStats[, 3], milesiStats[, 4], sep = " - "))
milesiStats <- milesiStats[, -c(3, 4)]
milesiStats <- cbind(rownames(milesiStats), milesiStats)
colnames(milesiStats) <- c("Measurement", "Mean", "SD", "Range")
rownames(milesiStats) <- NULL

# In Table 1 the first three stats columns are for joropo, the last three for milesi
Table1 <- cbind(joropoStats, milesiStats[, c(2:4)])

# Write the xls file Table 1
write.xlsx(Table1, "Table 1.xls", col.names = TRUE, row.names = FALSE, showNA = TRUE)
