# Data versioning in R

## The problem:

In recent years the idea of the data publication has become established across many different scientific disciplines.  Researchers can publish the data associated with a publication (or even not associated with a publication) in one of a number of open access locations.  These stable data then are freely and easily available to the research community.  Researchers get credit for the production (or assemble) of that data, and the model facilitates future creative uses by the research community.  As this new model has taken hold, one new problem that has emerged is the fact that datasets are often not as static as we once throught they were.  The static model works very well for reproducing a *particular* analysis.  However, that is only one use of a dataset.  Many, although not all, of the most useful datasets are snapshots of existing quantitative knowledge at a given time.  For example, all meta-analyses are like this--they are built on the existing data for a given question at a given time.  When a new study is published the static dataset from the last meta-analysis immediately becomes potentiall obsolete.  However, if the dataset is organized and distributed with a versioning system there can be a way to add new information, correct small errors, and keep the most useful datasets in our fields available to the reseach community in an up-to-date way.  

Almost all useful databases are living--they get better through time either by the addition of new data or by improving the quality of existing data.  For example a dataset on plant characteristics might become obsolete as taxonomic changes occur. This might only require a small amount of work and a minor change, but if there is no way to distribute that new dataset, then that work has to be re-done by every user of that dataset.  Moreover, those required changes adds steps between the canonical dataset and the new analysis (and publication), making reproducibility of the new analysis more difficult than it needs to be.  If the canonical dataset is versioned--and versions are accessible--the up-to-date data can be distibuted and used.  

This goal is laudable, but implementing it is difficult.  There are a few different problems: one is "big data"--this requires a seperate set of hardware and software tools (see AMAZON); examples include genetic data, species observation data (GBIF), and remote sensing (data).  This size of data is bigger than individual research groups and often requires a specialized governmental or non-governmental instituation with full-time staff to curate and maintain those research resources.  

We were particularly interested in smaller, more specialized problems--the type that a given research group might specialize in.  These are the types of research questions that lend themselves to periodic analysis (or meta-analyses):
- does chocolate consumption correlate with obesity?
- does the rate of spread of epidemics correlate with transmission rateS?
- how do plants partition resources in different conditions?
- does the body size of animals correlate with range size? 
- which birds have been observed in an annual survey

Each of those questions might be the captured in a dataset that could be one lab's or NGO's work--or more commonly a compendium of work by many different groups, harvested from the original researchers or from the literature.  Those datasets will not be "big data"--they'll be small to possibly medium sized.  And the questions may drive a given research line, but are not in most cases general enough to establish infra-structure for.  But crucially the data themselves will change over time.  And currently there is no infrastructure for organizing and distributing these types of "living datasets".  

So what we need in this case is a low-cost (both money and time) way of making versions of a dataset and delivering it to potential users, along with notes on what has changed and why since the previous version.  Periodically versions can be desposited and given a digital obeject identifier (DOI) at a major research archive, but in between major versions, small changes can be made, errors can be corrected, and the most recent version can be distributed to users.  

## How do you provide data to R users?

There are a number of high-setup-cost options (stand-alone packages, APIs), which have advantages if you have the resources to develop and maintain them.  We wanted a relatively low cost way (both in money and time).  Our approach builds on the theory of "semantic versioning" developed for software distribution.   It uses github releases, semantic versioning, and local caching.

The data is downloaded only once per computer, available for offline access, easy to port to other platforms, and can get a doi when desired (i.e. when it's used for a publication).

## Some worked examples

So far we have three:

1. `Biomass And Allometry Database`
2. `taxonlookup`
3. `plantgrowthform`

Each of these is a versioned dataset, designed for a particular research goal, and also explicitly flexible such that they can grow in the future.  In all three cases, the user needs to install a few `R` packages.  The data versions themselve is stored as a Github Releases (as well as if desired on DataDryad or FigShare), then any of the versions of the data can be downloaded and used with one line of `R` code.  

## Conclusion

Because it builds on existing infra-structure for distributing software, this system requires very little (or no) money to set up and only a small amount of programming expertise.  It will not work for big or continually updated data (e.g. weather stations or satelite downloads), but for a set of problems that need "living" small-to-medium sized data, this might be a useful approach.  
