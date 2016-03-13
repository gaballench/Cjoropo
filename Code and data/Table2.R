library(xlsx)

source("analyses.R")

write.xlsx(finalAncova, "Table 2.xls", col.names = TRUE, row.names = FALSE, showNA = TRUE)
