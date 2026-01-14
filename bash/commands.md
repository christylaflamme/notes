Welcome to the niftyLinuxCommands wiki!

# Basic Useful Commands

Go back to your last location without having to re-type the path or navigate with ../
```
cd -
```

How to zip a list of files together
zip = command
files.zip = names of zipped files document
-@ = argument to take a file list
zip.lst = list of files
```
zip files.zip -@ < zip.lst
```

Use grep recursively to find all files of certain type and count them
```
grep -r --include "*.bam" . | wc -l
```

# What does {} \; mean?
https://superuser.com/questions/638375/what-does-mean-in-find-in-linux

 