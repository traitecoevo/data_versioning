## TODO: move this into remake TODO: options for saying what command is being
## run

latex_build_clean <- function(...) {
  latex_build(..., clean=TRUE)
}

latex_build <- function(filename, bibliography = NULL, chdir = TRUE, interaction = "nonstopmode",
  max_attempts = 5L, clean = FALSE, engine = "pdflatex") {
  if (chdir && dirname(filename) != "") {
    owd <- setwd(dirname(filename))
    on.exit(setwd(owd))
    filename <- basename(filename)
  }

  res <- run_latex(filename, interaction, engine)
  if (engine == "xelatex") {
    res <- run_latex(filename, interaction, engine)
  }
  if (!is.null(bibliography)) {
    run_bibtex(filename)
    res <- run_latex(filename, interaction, engine)
  }

  pat <- c("Rerun to get cross-references right", "Rerun to get citations correct",
    "Rerun to get outlines right")
  isin <- function(p, x) {
    any(grepl(p, x))
  }
  for (i in seq_len(max_attempts)) {
    if (any(vapply(pat, isin, logical(1), res))) {
      res <- run_latex(filename, interaction, engine)
    } else {
      break
    }
  }

  if (clean) {
    latex_clean(filename)
  }

  invisible(NULL)
}

latex_clean <- function(filename) {
  filebase <- sub(".tex$", "", filename)
  exts <- c(".log", ".aux", ".bbl", ".blg", ".fls", ".out", ".snm", ".nav", ".tdo",
    ".toc")
  aux <- paste0(filebase, exts)
  file.remove(aux[file.exists(aux)])
}

run_latex <- function(filename, interaction = "nonstopmode", engine = "pdflatex") {
  args <- c(paste0("-interaction=", interaction), "-halt-on-error", filename)
  call_system(Sys_which(engine), args)
}

run_bibtex <- function(filename) {
  call_system(Sys_which("bibtex"), sub(".tex$", "", filename))
}

Sys_which <- function(x) {
  ret <- Sys.which(x)
  if (ret == "") {
    stop(sprintf("%s not found in $PATH", x))
  }
  ret
}
