
# Packages --------------------
library(tinytex)

# source function scripts -----------
source("R/build.R")

# Documents ---------------
pdflatex("ms/manuscript.tex", pdf_file = 'ms/manuscript.pdf')
