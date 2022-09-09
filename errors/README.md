# Using R/Rstudio on the HPC

## Installing packages

  Method 1: 
    Install packages using an interactive R studio image
    Set R_LIBS_USER in .bashrc 
    
```bash
export R_LIBS_USER=/path/to/library
```
 
  Method 2:
    Install packages using the terminal interactive R and set R_LIBS_USER in .bashrc

# More Error Handling: "image not found"

> R

dyld: Library not loaded: @rpath/libicuuc.54.dylib
  Referenced from: /Users/claflamm/miniconda3/lib/R/lib/libR.dylib
  Reason: image not found
Abort trap: 6

> conda deactivate

R version 4.0.2 (2020-06-22) -- "Taking Off Again"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin17.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

## Must remove default conda base initialization: run this once to remove the default

```bash
conda config --set changeps1 false
```

## If problem persists, set auto activate base

```bash
conda config --set auto_activate_base false 
``` 


