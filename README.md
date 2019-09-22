# A paper about Versioned Data Delivery and the datastorr package

This repository contains code needed to reproduce the article:

Falster DS, FitzJohn RG, Pennell MW, Cornwell WK (2019) **Datastorr: a workflow and package for delivering successive versions of 'evolving data' directly into R**. *GigaScience* 8: 1–8. doi: [10.1093/gigascience/giz035]( https://doi.org/10.1093/gigascience/giz035)

and/or the preprint: 

Falster DS, FitzJohn RG, Pennell MW, Cornwell WK (2017) **Versioned data: why it is needed and how it can be achieved (easily and cheaply)**. doi [10.7287/peerj.preprints.3401v1](http://doi.org/10.7287/peerj.preprints.3401v1)

We think delivering versioned data to users in a simple and easy way will help science a lot. 

## Running the code

All analyses were done in `R`, and the paper is written in LaTeX. All code needed to reproduce the submitted products is included in this repository. To reproduce this paper, run the code contained in the `analysis.R` file. The paper will be produced in the directory `ms`.

If you are reproducing this manuscript on your own machine, first download the code and then install the `tinytex` package. 

You can access an interactive RStudio session with the required software pre-installed by opening a container hosted by [Binder](http://mybinder.org): 

[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/traitecoevo/data_versioning/master?urlpath=rstudio)

To ensure long-term [computational reproducibility](https://www.britishecologicalsociety.org/wp-content/uploads/2017/12/guide-to-reproducible-code.pdf) of this work, we have created a [Docker](http://dockerhub.com) image to enable others to reproduce these results on their local machines using the same software and versions we used to conduct the original analysis. Instructions for reproducing this work using the docker image are available at the bottom of the page. 

## Material included in the repository include:

- `R/`: directory containing functions used in analysis
- `ms/`: directory containing manuscript in LaTeX and accompanying style files 
- `figures/`: directory containing figures for the manuscript
- `DESCRIPTION`: A machine-readable [compendium]() file containing key metadata and dependencies 
- `LICENSE`: License for the materials
- `Dockerfile` & `.binder/Dockerfile`: files used to generate docker containers for long-term reproducibility

## Running via Docker

If you have Docker installed, you can recreate the computing environment as follows in the terminal. 

From the directory you'd like this repo saved in, clone the repository:

```
git clone https://github.com/traitecoevo/data_versioning.git
```

Then fetch the container:

```
docker pull traitecoevo/data_versioning
```

Navigate to the downloaded repo, then launch the container using the following code (it will map your current working directory inside the docker container): 

```
docker run --user root -v $(pwd):/home/rstudio/ -p 8787:8787 -e DISABLE_AUTH=true traitecoevo/data_versioning
```

The code above initialises a docker container, which runs an RStudio session accessed by pointing your browser to [localhost:8787](http://localhost:8787). For more instructions on running docker, see the info from [rocker](https://hub.docker.com/r/rocker/rstudio).

### NOTE: Building the docker image

For posterity, the docker image was built off [`rocker/verse:3.6.1` container](https://hub.docker.com/r/rocker/verse) via the following command, in a terminal contained within the downloaded repo:

```
docker build -t traitecoevo/data_versioning .
```

and was then pushed to [dockerhub](https://cloud.docker.com/u/traitecoevo/repository/docker/traitecoevo/data_versioning). The image used by binder builds off this container, adding extra features needed by binder, as described in [rocker/binder](https://hub.docker.com/r/rocker/binder/dockerfile).
