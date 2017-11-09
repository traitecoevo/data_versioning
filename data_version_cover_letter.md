


To whom it may concern:

In recent years the idea of the data publication has become established across many different scientific disciplines.  Researchers can publish the data associated with a publication in one of a number of open access locations.  These stable data then are freely and easily available to the research community.  Researchers get credit for the production (or assembly) of that data, and the model facilitates future, creative uses by the research community.  As this new model has taken hold, a new problem has emerged: many very useful datasets are not static.  The static repository model works very well for reproducing a *particular* analysis in a *particular* paper, which is crucial and important for reproducibility.  However really interesting datasets are rarely static.
 
Almost all useful databases are living--they *should* get better through time either by the addition of new data or by improving the quality of existing data. A common example is a meta-analysis which goes out of date as soon as a new study is published.  Another example is a widely used database where a users flag errors.  Large data collector/distributers like GenBank, GBIF, or NASA have faced this problem for years and have built large dynamic databases to solve this problem.  However, there are also a large number of much smaller datasets that should also be dynamic.  
  
At present changes to useful small datasets are rarely distributed to potential users because it is difficult to do so.  Most lab groups do not have dedicated programmers and as such cannot allocate the time to programming a advanced web database like used by NASA.  The current situation is that one version might go to a web repository like dataDrayd, but any error corrections or updates are not distributed, and as such many users have to find and correct the same errors and add the recent updates.  **We propose that we need an easy-to-use system to organize and distribute versions of small useful datasets.**  Because this is will be used primarily by scientists who are not database experts, this system needs to be easy to use for data currators and even easier for users.

We have built a package in R to allow lab groups to do this.  It is easy to use and integrated with DOI's such that specific versions will remain stable into the future.  Our package is called datastorr and is available here: www.github.com/richfitz/datastorr.  We also have two worked examples, which are currently being used and updated.  

We're interested in introducing this new data versioning system to the readership of Scientific Data in a short paper.  Since this is a very general tool, and potentially useful for any field that generates small dynamic datasets, we think that the readership of your journal would be very interested.  As data science emerges as a field, we will need more sophisticated tools to organize small dynamic datasets.  We think datastorr can play a useful role.

Yours sincerely,

Daniel Falster, Rich FitzJohn, Matt Pennell, and Will Cornwell

