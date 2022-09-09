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

# R Memory Issues

If R is being slow by constantly loading the previous workspace and despite clearing the environment, R is taking up all of the working memory on your device: delete the .RData file in the root directory

```bash
rm .RData
```

# More Error Handling: "image not found"

```bash
dyld: Library not loaded: @rpath/libicuuc.54.dylib
  Referenced from: /Users/claflamm/miniconda3/lib/R/lib/libR.dylib
  Reason: image not found
Abort trap: 6
```

## Must remove default conda base initialization: run this once to remove the default

```bash
conda config --set changeps1 false
```

## If problem persists, set auto activate base

```bash
conda config --set auto_activate_base false 
``` 








