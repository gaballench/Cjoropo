##### Load packages needed #####
library(randtests) # Tests of randomness
library(xlsx) # Writing a table in xlsx format
library(extremevalues) # Outliers
library(npsm) # Nonparametric tests (ancovas)
library(FactoMineR) # PCA the easy way
library(factoextra) # Additional functions for plotting factominer PCAs

source("datasets.R")


joropoRaw <- dataset[which(dataset$Species == "Chaetostoma joropo"),]
joropoRaw <- joropoRaw[, -c(1:4, 40:54)]
milesiRaw <- dataset[which(dataset$Species == "Chaetostoma milesi"),]
milesiRaw <- milesiRaw[, -c(1:4, 40:54)]


##### Nonparametric statistics #####


# Automatic Bartels test using the reduced datasets for milesi and joropo separately
bartelsPvalues <- function(x) {
        output <- data.frame()
        bartelsValues <- vector("numeric")
        cnames <- colnames(x)
        for(i in seq_along(cnames)) {
                bartels <- bartels.rank.test(x[,i], alternative = "two.sided")
                bartelsValues <- c(bartelsValues, bartels$p.value)
        }
        output <- data.frame(cbind(cnames, bartelsValues))
        colnames(output) <- c("Variable", "p.value")
        output[, 2] <- as.numeric(levels(output[, 2]))[output[, 2]]
        print(output)
}

# Results for the Bartels test and report of variables showing p-values below the 
# significance level
joropoBartels <- bartelsPvalues(joropoRaw)
joropoNonrandom <- as.character(joropoBartels[which(joropoBartels$p.value < 0.01), 1])

milesiBartels <- bartelsPvalues(milesiRaw)
milesiNonrandom <- as.character(milesiBartels[which(milesiBartels$p.value < 0.01), 1])

# Total cases where nonrandomness was detected, concatenating joropo and milesi 
# instances.
totalnonrandom <- c(joropoNonrandom, milesiNonrandom)

# Reducing to single variable names, that is, removing duplicates
totalnonrandom <- levels(as.factor(totalnonrandom))


######## PCA for the species #########

### PCA for raw data
meas <- dataset[, -c(2:4, 40:length(dataset))]
species <- meas$Species
meas <- meas[, -1]
outs <- list()
for(i in seq_along(meas)) {
        out <- getOutliers(meas[, i])
        outs <- c(outs, list(out))
}

for(i in seq_along(meas)) {
        meas[c(outs[[i]][["iLeft"]], outs[[i]][["iRight"]]), i] <- NA
}

meas <- cbind(species, meas)
colnames(meas)
chaetoPCAraw <- PCA(meas, ncp = 35, quali.sup = 1, graph = FALSE)

## Variable selection

selPCs <- which(chaetoPCAraw$eig[,1] > 0.7)
PCArawContrib <- chaetoPCAraw$var$contrib
PCnames <- colnames(PCArawContrib)[-selPCs]
rmVars <- vector()
length(rmVars) <- length(PCnames)
for(i in seq_along(PCnames)) {
        maxvar <- which(max(abs(chaetoPCAraw$var$contrib[, PCnames[i]])) == 
                      chaetoPCAraw$var$contrib[, PCnames[i]])
        rmVars[i] <- names(maxvar)
}
rmVars <- unique(rmVars)
AncovaVars <- setdiff(colnames(meas), rmVars)
AncovaVars <- AncovaVars[-c(1:2)]


######## ANCOVA ##########

### Ancova with selected variables

# First remove variables failing randomness as obtained through the Bartels test
AncovaVars <- AncovaVars[-which(AncovaVars %in% totalnonrandom)]

# Subset vars with SL covariate
SLvars <- AncovaVars[c(1, 3, 4, 5, 6, 7)]

# Subset vars with HL covariate
HLvars <- AncovaVars[c(2, 8, 9)]

# Ancova for vars with SL covariate
SLheterList <- list()
for(i in seq_along(SLvars)) {
        result <- onecovaheter(2, dataset[, c(SLvars[i], "Species")], dataset$SL)
        SLheterList <- c(SLheterList, list(result))
}
names(SLheterList) <- SLvars

SLhomoList <- list()
for(i in seq_along(SLvars)) {
        result <- onecovahomog(2, dataset[, c(SLvars[i], "Species")], dataset$SL)
        SLhomoList <- c(SLhomoList, list(result))
}
names(SLhomoList) <- SLvars


# Ancova for vars with HL covariate
HLheterList <- list()
for(i in seq_along(HLvars)) {
        result <- onecovaheter(2, dataset[, c(HLvars[i], "Species")], dataset$Head.L.)
        HLheterList <- c(HLheterList, list(result))
}
names(HLheterList) <- HLvars

HLhomoList <- list()
for(i in seq_along(HLvars)) {
        result <- onecovahomog(2, dataset[, c(HLvars[i], "Species")], dataset$Head.L.)
        HLhomoList <- c(HLhomoList, list(result))
}
names(HLhomoList) <- HLvars

# Summary tables for ancovas
pvalues <- vector()
slopes <- vector()
Fvalues <- vector()

for(i in seq_along(SLheterList)) {
        p <- SLheterList[[i]][[1]][[9]]
        F <-  SLheterList[[i]][[1]][[7]]
        slope <- SLheterList[[i]][[1]][[10]]
        names(p) <- names(SLheterList[i])
        pvalues <- c(pvalues, p)
        Fvalues <- c(Fvalues, F)
        slopes <- c(slopes, slope)
}

for(i in seq_along(HLheterList)) {
        p <- HLheterList[[i]][[1]][[9]]
        F <-  HLheterList[[i]][[1]][[7]]
        slope <- HLheterList[[i]][[1]][[10]]
        names(p) <- names(HLheterList[i])
        pvalues <- c(pvalues, p)
        Fvalues <- c(Fvalues, F)
        slopes <- c(slopes, slope)
}

tabsHeter <- data.frame(pvalues, Fvalues, slopes)

pvalues <- vector()
slopes <- vector()
Fvalues <- vector()

for(i in seq_along(SLhomoList)) {
        p <- SLhomoList[[i]][[1]][[9]]
        F <-  SLhomoList[[i]][[1]][[7]]
        slope <- SLhomoList[[i]][[1]][[10]]
        names(p) <- names(SLhomoList[i])
        pvalues <- c(pvalues, p)
        Fvalues <- c(Fvalues, F)
        slopes <- c(slopes, slope)
}

for(i in seq_along(HLhomoList)) {
        p <- HLhomoList[[i]][[1]][[9]]
        F <-  HLhomoList[[i]][[1]][[7]]
        slope <- HLhomoList[[i]][[1]][[10]]
        names(p) <- names(HLhomoList[i])
        pvalues <- c(pvalues, p)
        Fvalues <- c(Fvalues, F)
        slopes <- c(slopes, slope)
}

tabsHomo <- data.frame(pvalues, Fvalues, slopes)


finalAncova <- tabsHomo
finalAncova[rownames(tabsHeter)[which(tabsHeter$slopes < 0.05)], ] <- 
        tabsHeter[rownames(tabsHeter)[which(tabsHeter$slopes < 0.05)], ]
SlopeHom <- rep("homogeneous", times = length(rownames(finalAncova)))
finalAncova <- cbind(finalAncova, SlopeHom)
finalAncova$SlopeHom <- as.character(finalAncova$SlopeHom)
finalAncova[which(tabsHeter$slopes < 0.05), "SlopeHom"] <- "heterogeneous"
rownames(finalAncova)[which(finalAncova$pvalues < 0.05)]
varNames <- c("Head-dorsal L.",
              "Dorsal-pectoral D.",
              "Dorsal spine L.",
              "Dorsal-pelvic D.",
              "Caudal peduncle Dp.",
              "Pelvic-dorsal D.",
              "Head-eye L.",
              "Mouth L.",
              "Mouth W.")
finalAncova <- cbind(Variables = varNames, finalAncova)
finalAncova <- finalAncova[, -4]
rownames(finalAncova) <- NULL
