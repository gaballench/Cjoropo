library(dplyr) # Dataset manipulation


##### First set wd #####
#setwd("PATH TO WORKING")

##### Load the data declaring the classes a priori in order to avoid problems with factor class coercion #####
dataset <- read.csv(file = "joropomilesi.csv", header = TRUE, dec = ".", 
                    colClasses = c("character", "character", "character", "character", 
                                   "numeric", "numeric", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric", "numeric", 
                                   "integer", "integer", "integer", "integer", "integer", 
                                   "integer", "character", "character", "character", "character", 
                                   "character", "integer", "integer", "integer", "character"))

##### Verify classes in the dataset object. If true in identical(), everything is ok. #####
colClass <- c("character", "character", "character", "character", 
              "numeric", "numeric", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric", "numeric", "numeric", 
              "integer", "integer", "integer", "integer", "integer", 
              "integer", "character", "character", "character", "character", 
              "character", "integer", "integer", "integer", "character")

realClass <- vector("character")

for(i in seq_along(colnames(dataset))) {
        realClass <- c(realClass, class(dataset[, i]))
}

if (identical(colClass, realClass)) {
        rm(i, colClass, realClass)
        print("Column classes are correct.")
} else {
        message("Column classes as declared in read.csv() and in the lodaded dataset differ.")
}


##### Correction using SL and HL for the measures of interest #####
corrected <- data.frame()
corrected <- mutate(dataset, Head.eye.L. = (Head.eye.L./ Head.L.) * 100, 
                    Orbit.Dia. = (Orbit.Dia. / Head.L.) * 100, 
                    Snout.L. = (Snout.L. / Head.L.) * 100, 
                    Internares.W. = (Internares.W. / Head.L.) * 100, 
                    Interorbital.W. = (Interorbital.W. / Head.L.) * 100, 
                    Head.Dp. = (Head.Dp. / Head.L.) * 100, 
                    Mouth.L. = (Mouth.L. / Head.L.) * 100, 
                    Mouth.W. = (Mouth.W. / Head.L.) * 100, 
                    Barbel.L. = (Barbel.L. / Head.L.) * 100, 
                    Dentary.tooth.cup.L. = (Dentary.tooth.cup.L. / Head.L.) * 100, 
                    Premax..tooth.cup.L. = (Premax..tooth.cup.L. / Head.L.) * 100, 
                    Predorsal.L. = (Predorsal.L. / SL) * 100, 
                    Head.L. = (Head.L. / SL) * 100, 
                    Head.dorsal.L. = (Head.dorsal.L. / SL) * 100, 
                    Cleithral.W. = (Cleithral.W. / SL) * 100, 
                    Head.pectoral.L. = (Head.pectoral.L. / SL) * 100, 
                    Thorax.L. = (Thorax.L. / SL) * 100, 
                    Pectoral.spine.L. = (Pectoral.spine.L. / SL) * 100, 
                    Abdominal.L. = (Abdominal.L. / SL) * 100, 
                    Pelvic.spine.L. = (Pelvic.spine.L. / SL) * 100, 
                    Postanal.L. = (Postanal.L. / SL) * 100, 
                    Anal.fin.spine.L. = (Anal.fin.spine.L. / SL) * 100, 
                    Dorsal.pectoral.D. = (Dorsal.pectoral.D. / SL) * 100, 
                    Dorsal.spine.L. = (Dorsal.spine.L. / SL) * 100, 
                    Dorsal.pelvic.D. = (Dorsal.pelvic.D. / SL) * 100, 
                    Dorsal.fin.base.L. = (Dorsal.fin.base.L. / SL) * 100, 
                    Dorsal.adipose.D. = (Dorsal.adipose.D. / SL) * 100, 
                    Adipose.spine.L. = (Adipose.spine.L. / SL) * 100, 
                    Adipose.up..caudal.D. = (Adipose.up..caudal.D. / SL) * 100, 
                    Caudal.peduncle.Dp. = (Caudal.peduncle.Dp. / SL) * 100, 
                    Adipose.low..caudal.D. = (Adipose.low..caudal.D. / SL) * 100, 
                    Adipose.anal.D. = (Adipose.anal.D. / SL) * 100, 
                    Dorsal.anal.D. = (Pelvic.dorsal.D. / SL) * 100, 
                    Pelvic.dorsal.D. = (Pelvic.dorsal.D. / SL) * 100)

