# A paper about Versioned Data Delivery and the datastorr package

We think delivering versioned data to users in a simple and easy way will help science a lot.  For more details check out:

Falster DS, FitzJohn RG, Pennell MW, Cornwell WK (2019) **Datastorr: a workflow and package for delivering successive versions of 'evolving data' directly into R**. *GigaScience* 8: 1–8. doi: [10.1093/gigascience/giz035]( https://doi.org/10.1093/gigascience/giz035) 

and/or the preprint: 

Falster DS, FitzJohn RG, Pennell MW, Cornwell WK (2017) **Versioned data: why it is needed and how it can be achieved (easily and cheaply)**. doi [10.7287/peerj.preprints.3401v1](http://doi.org/10.7287/peerj.preprints.3401v1)

This repository contains code needed to reproduce the analysis in the above article.

## Instructions

All analyses were done in `R`. To reproduce this paper, run the code contained in the `analysis.R` file. 

If reproducing these results on your own machine, you must first install the required packages, listed under `Depends` in the `DESCRIPTION` file. 

Alternatively, you can use an interactive RStudio session to run the `analysis.R` file with the required software pre-installed. This session is hosted by binder and can be accessed by clicking on the following:

[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/smwindecker/data_versioning/master?urlpath=rstudio)

