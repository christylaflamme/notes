# VS Code
VS Code setup

Install VS Code: https://code.visualstudio.com/download

Make sure that homebrew is already installed: https://brew.sh/

Add `code` to your PATH

Open VS Code → Cmd+Shift+P → run: Shell Command: Install "code" command in PATH

Check that `code` is working in the terminal:

```
which code
```
```
code --version
```

Launch VS Code from terminal so that environmental configurations and filesystem is intact:
```
code .
```

How to default to bash instead zsh:
```
Terminal: Select Default Profile
```

To search using a command, use the `>` character.

Important extensions: R, python, Remote - SSH.

To access VSCode IDE while on ssh, installed Remote - ssh extension, and then use the >< icon on the bottom left to connect to the host.

# tmux
tmux commonly used keyboard commands

Detach: `Ctrl-b-d

Next window/tab: `Ctrl-b-n`

Specific window/tab: `Ctrl-b-#`

Enter copy mode (can scroll up and down as normal): `Ctrl-b-[`

Exit copy mode: `q`

List sessions: `tmux list-sessions`

Kill session: `tmux kill-session`


# slurm
List queue (alias):
```
myq
```

Cancel a job:
```
scancel
```
Check memory usage:
```
hyakstorage -u
```

Check allocations/partitions:
```
hyakalloc
```
Resource allocation:


Group: `stergachislab`


Partitions for lab: `cpu-g2` (newer) `compute-ultramem` (older)


Partitions for department that can be used if lab resources are already allocated: `ckpt`

# R
Installed R on klone/hyak using miniconda: `/mmfs1/gscratch/stergachislab/claflamm/bin/miniconda3/`


This R environment is named: `renv`


The packages for OnDemand: `/mmfs1/gscratch/stergachislab/claflamm/bin/miniconda3/envs/renv/lib`


The packages for renv: `/mmfs1/gscratch/stergachislab/claflamm/bin/miniconda3/envs/renv/lib/R/library`


# Installing executables to utilize software tools
First, download the linux executable file
```
wget <link_address>
```
Note: make sure you copy the link address from "raw," not the HTML link from the browser.

Then, decompress it:
```
tar -xvf <file.tar.gz>
```


Then, navigate into the unzipped folder, find the executable, `md5sum` check, and move it into the install location in PATH (/mmfs1/gscratch/stergachislab/claflamm/bin).
Finally, check the install: 
```
app_name -h
```





