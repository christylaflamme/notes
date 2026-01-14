Welcome to the niftyLinuxCommands wiki!

# Basic Useful Commands

Go back to your last location without having to re-type the path or navigate with ../
```
cd -
```

Use grep recursively to find all files of certain type and count them
```
grep -r --include "*.bam" . | wc -l
```