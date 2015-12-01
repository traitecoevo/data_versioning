# Using R packages to distribute dynamic and versioned data

## The problem:

In recent years the idea of the data publication has become established across many different scientific disciplines.  Researchers can publish the data associated with a publication (or even not associated with a publication) in one of a number of open access locations, such as the Dryad Data Repository, Figshare, or (less ideally) as supplementary files to the original publication.  These stable data then are freely and easily available.  Researchers get credit for the production (or assembly) of that data, and the model facilitates future, creative uses by the research community.  As this new model has taken hold, one new problem that has emerged: many of the most useful datasets are often not as static as we once throught they were.  The static model works very well for reproducing a *particular* analysis in a *particular* paper, which is crucial and important for reproducibility. [**MWP**: I think we should highlight the fact that there is a range of types of data from one-off studies of a single population at a single time (where Dryad is a perfectly suitable option) to large databases (think GenBank) that require expert database management, good APIs, etc. I think this approach fills a niche somewhere in the middle. I realize this is mentioned below but think this would perhaps be useful upfront to set the scope of the problem we want to address.]

From a scientific discovery perspective, however, this is not the most useful model.  Many, although not all, of the most useful datasets are snapshots of existing quantitative knowledge at a given time.  For example, meta-analyses are built on the existing data for a given question at a given time.  When a new study is published the static dataset from the last meta-analysis immediately becomes obsolete--to keep up-to-date that new study should be added.  However, if we have a static data distribution system, this is impossible.  Another problem with the static model is the discovery of small errors.  For any much medium-sized database that is repeatedly used, errors will be found, and there needs to be some organized way to correct them.  

## Versioning data

Almost all useful databases are living--they *should* get better through time either by the addition of new data or by improving the quality of existing data.  For example a dataset on plant characteristics might become obsolete as taxonomic changes occur. This might only require a small amount of work and a minor change, but if there is no way to distribute that new dataset, then that work has to be re-done by every user of that dataset.  Moreover, those required changes adds steps between the canonical dataset and the new analysis (and publication), making reproducibility of the new analysis more difficult than it needs to be.  If the canonical dataset is versioned--and versions are accessible--the up-to-date data can be distributed, used, and analyses based on these data can be reproduced.  

## One solution for small-to-medium sized datasets

Versioned data is laudable goal, but implemention is difficult.  

For finding the right tool to version data, the size of the dataset is an important consideration.   "Big data" requires a separate set of hardware and software tools (see Amazon web services); examples of big data include genetic datasets, global datasets species observations, and remote sensing data.  This size of this data is bigger than individual research groups and often requires a specialized governmental or non-governmental institution with full-time staff to curate and maintain those research resources.  

We were particularly interested in smaller and more specialized problems--the type of datasets that a given research group might specialize in.  These are the types of research questions that lend themselves to periodic analysis (or meta-analyses):
- does chocolate consumption correlate with obesity?
- does the rate of spread of epidemics correlate with transmission rates?
- how do plants partition resources in different conditions?
- does the body size of animals correlate with range size? 
- which birds have been observed in an annual survey in a given place?

[**MWP:** I think the focus on questions is perhaps misplaced. We should instead focus on the qualities of the data that we are interested in.]

Each of those questions might be the captured in a dataset that could be one lab's or NGO's expertise--or more commonly a compendium of work by many different groups, harvested from the original researchers or from the literature.  In many cases, the key data for these questions will not be "big data"--they'll be small to possibly medium sized.  And the questions may drive a given research line, but are not in most cases general enough to establish infra-structure for.  But crucially the data themselves will change over time.  And currently there is no infrastructure for organizing and distributing these types of "living datasets".  

So what we need in this case is a low-cost (both money and time) way of making versions of a dataset and delivering it to potential users, along with notes on what has changed and why since the previous version.  Ideally periodically versions can be deposited and given a digital object identifier (DOI) at a major research archive, but in between major versions, small changes can be made, errors can be corrected, and the most recent version can be distributed to users.  Idealy there would also be a way for users to easily flag errors for the currator to then correct in the next release.  As many of the users of small-to-medium sized datasets use the open source language R, we also prioritized easy of use from within R.

For small datasets, it is possible to use the same tools developed for big data: there are a number of high-setup-cost options (stand-alone websites, APIs), which have advantages if you have the resources to develop and maintain them.  We wanted a relatively low cost way (both in money and time).  

## Our system

Our approach builds on the theory of "semantic versioning" developed for software distribution; this system uses the familiar 1.0.0 notation.  We argue that data versioning is a similar problem, and we are not the first to make this argument (INSERT LINKS HERE). Applying sematic versioning to data, a change from 1.0.0 to 1.0.1 implies a tiny changes, for example a minor error correction.  A change from 1.0.0 to 1.1.0 implies a major change, for example adding a new study to a meta-anlysis dataset.  A change from 1.0.0 to 2.0.0 implies a very major revision, for example improving the entire structure of the dataset and adding new columns.  

One of the key problems in switching from a static to a dynamic data world, is that it's currently hard to set up and maintain a system like this.  Ideally using a versioned database should be easy for both the user and the data maintainer.  This is especially crucial is the data maintainers are busy.  Moreover, old versions need to be preserved in a stable and accessible way.

To try and achieve to above goals, we built a system to destribute versions of our datasets.  We think that with this infrastructure, it is relatively easy to set up and maintain a versioned system with any small-to-medium sized dataset.

In our system, the data is downloaded only once per computer, available for offline access, easy to port to other platforms, and can get a doi when desired (i.e. when it's used for a publication).  All old versions are accessible.  

## Some worked examples

So far we have three:

1. `Biomass And Allometry Database`
2. `taxonlookup`
3. `plantgrowthform`

Each of these is a versioned dataset, designed for a particular research goal, and also explicitly flexible such that they can grow in the future.  In all three cases, the user needs to install a few R packages.  The data versions themselves are stored as Github Releases (as well as if desired on DataDryad or FigShare), then any of the versions of the data can be downloaded and used with only one of `R` code.  

## How much expertise is needed to use a versioned dataset?

Very very basic `R`.  With 4 lines of `R` code, you can have the data downloaded and loaded into R and ready for use.  

## How much expertise is needed to set a system like this up?

Basically there are two general skills required: 1) understanding version control via ``git`` and 2) writing a very simple R package.  From the prolific Hadley Wickham there is a [very clear introduction to git](http://r-pkgs.had.co.nz/git.html) and [an instruction to the basics of R packages](http://r-pkgs.had.co.nz/intro.html).  

With those two skills the rest should be relatively easy.  To set up a living dataset you need to provide:
1. a github repository name (e.g. wcornwell/taxonlookup, traitecoevo/baad.data).  
2. A single file that will be the versioned dataset (e.g. `plant_lookup.csv` or `baad_data.zip`).  
3. A function to load that data into R: (e.g. a simple wrapper around `read.csv`).  

Then as the data changes (hopefully improves) with time, update the data file and create a github release with a new version number (preferably using [semantic versioning](http://semver.org/)).  All the versions will be available to the user.  And versions can be given a unique DOI when appropriate, e.g. when they are used in a publication.  

## Conclusion

Because it builds on existing infra-structure for distributing software, this system requires very little (or no) money to set up and only a small amount of programming expertise.  The current infrastructure will not work for big or continually updated data (e.g. weather stations or satellite downloads).   For a set of problems that need periodically updated small-to-medium sized data (e.g. most meta-analysis problems), this might be a useful approach.  

