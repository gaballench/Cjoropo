How to replicate the analyses
===============================

The materials provided are intended to allow reproducibility of the results found for the description of Chaetostoma joropo (Ballen et al., in press). The folder `,Code and Data` have several scripts as well as their outputs, i.e., tables and figures. Basically you should first run the script interactively with the function `source` and the script name as argument (see help("source") for further details). Scripts that depend on other scripts read automatically every script needed in order to complete, for instance, scripts writing tables will source the script in charge of cleaning and formating data, as well as carrying out analyses (`datasets.R` and `analyses.R` respectively).

# First steps

In order to run as smoothly as possible, the contents of this repository should be kept as currently organized. Ideally, you could obtain the whole repo (i.e., including the `Taxonomy` folder with companion figures for a better understanding of the key to species) by cloning the repository using [git](https://git-scm.com/):

```{bash}
git clone https://github.com/gaballench/Cjoropo
```

Or, by clicking "Download zip". Alternatively, clicking [here](https://github.com/gaballench/Cjoropo/archive/master.zip).

After getting the repo contents open R and set the working directory at "Cjoropo/Code and Data"

```{R}
setwd("Cjoropo/Code and Data")
```

The scripts sould be read in this order:

1. `datasets.R`
2. `analyses.R`
3. `Figure 4.R` or `Figure 5.R` or `Table1.R` or `Table2.R` irrespectively.

The file `AncovaFigures.R` is provided just in cases where the user needs a particular subplot for a given pair of variables. This script does not play any particular role in the reproducibility of the results as the pieces of code needed in order to replicate figures are found in each script respectively.

Finally, the dataset is present in the `joropomilesi.csv` file.