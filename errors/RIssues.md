# Using R/Rstudio on the HPC

## Installing packages

  Method 1: 
    Install packages using an interactive R studio image
    Set R_LIBS_USER (technically optional) in .bashrc 
    If set, will be prepended to the library path (which is displayed by .libPaths()).
    
```bash
export R_LIBS_USER=/path/to/library
```
 
  Method 2:
    Install packages using the terminal interactive R and set R_LIBS_USER in .bashrc

# R Memory Issues

If R is being slow by constantly loading the previous workspace and despite clearing the environment, R is taking up all of the working memory on your device: delete the .RData file in the root directory

```bash
rm ~/.RData
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
# R installation on ubuntu

Check the file ‘/etc/apt/sources.list’, and look for the line:

>deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/

If line does not exist, run the following in a terminal session to use the R CRAN version:

```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/' 
```

## Remove lines that do not align with correct version of ubuntu

```
sudo vi /etc/apt/sources.list 
```

## Install R

```bash
sudo apt install r-base
```

## Check R version

```bash
R --version 
```

## Troubleshooting for R studio singularity 
If having issues with the session, try deletion some finals (advice originally came from Jared Andrews)

```bash
rm -r ~/.local/share/rstudio/sessions
rm -r ~/rstudio-tmp
```






