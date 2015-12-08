# Thoughts towards a paper about the living data package

To compile the paper we use [remake](https://github.com/traitecoevo/remake).  The easiest way to install remake is via [drat](https://github.com/eddelbuettel/drat):

```r
drat:::add("traitecoevo")
install.packages("remake")
```

(install drat itself with `install.packages("drat")`)

Compilation requires a reasonably complete LaTeX installation (e.g. MacTeX).

We use the non-CRAN packages [callr](https://github.com/traitecoevo/callr).  This can be installed by remake:

```r
remake::install_missing_packages()
```

To compile everything, run

```r
remake::make()
```
