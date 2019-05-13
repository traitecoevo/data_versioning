# A paper about Versioned Data Delivery and the datastorr package

This repository contains code needed to reproduce the article:

Falster DS, FitzJohn RG, Pennell MW, Cornwell W (2019) **Datastorr: a workflow and package for delivering successive versions of 'evolving data' directly into R**. *GigaScience* 8: 1–8. doi: [10.1093/gigascience/giz035]( https://doi.org/10.1093/gigascience/giz035) 

and the preprint: 

Falster DS, FitzJOhn RG, Pennell MW, Cornwell W (2017) **Versioned data: why it is needed and how it can be achieved (easily and cheaply)**. doi [10.7287/peerj.preprints.3401v1](http://doi.org/10.7287/peerj.preprints.3401v1)


## Instructions

### Install relevant software

All analyses were done in `R`. You need to [download this repository](https://github.com/traitecoevo/data_versioning/archive/master.zip), and then open an R session with working directory set to the root of the project.

To compile the paper, we use the [remake](https://github.com/richfitz/remake) package for R. You can install remake using the `devtools` package (run `install.packages("devtools")` to install devtools if needed):

```r
devtools::install_github("richfitz/storr", dependencies=TRUE)
devtools::install_github("richfitz/remake", dependencies=TRUE)
```

Compiling the paper also requires a reasonably complete LaTeX installation (e.g. [MacTeX](https://tug.org/mactex/) for OSX or [MikTex](http://miktex.org/) for windows). The LaTeX compilation will depend on a few packages from CTAN, make sure to allow automatic package installation by your LaTeX distribution.

### Recreating the figures and paper

To generate all figures, analyses, and manuscript (PDF, using LaTeX), simply do:

```r
remake::make()
```

