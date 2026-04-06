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

How to fix remote ssh faulty connectivity: https://stackoverflow.com/questions/60335069/vscode-remote-connection-error-the-process-tried-to-write-to-a-nonexistent-pipe

VScode on hyak via proxyjump: https://hyak.uw.edu/docs/tools/vsc-proxy-jump/ (recommended)

Shortcuts:
Command Palette
```
Cmd - Shift - P
```
Edit settings through command palette: <settings.json>

# tmux
tmux commonly used keyboard commands

Detach: `Ctrl-b-d` or `tmux detach`

Next window/tab: `Ctrl-b-n`

Specific window/tab: `Ctrl-b-#`

Enter copy mode (can scroll up and down as normal): `Ctrl-b-[`

Exit copy mode: `q`

List sessions: `tmux list-sessions`

Kill session: `tmux kill-session -t <session>`

*note: after pressing control and b, make sure you are releasing it before pressing the subsequent keys.

# slurm
List queue (alias):
```
myq
```
Submit a job:
```
job.sh < sbatch
```

Cancel a job:
```
scancel
```

Check the details about a job, including the original submission line:
```
scontrol show job <JOBID>
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

<sbatch.slurm> is a template batch job script for slurm.

<get-node.py> is a python script for submitting an interactive job request with customizable parameters and nifty capabilities.
You can proxy jump to the interactive node from local computer or from login node using: `ssh <node>`. Note: you put this script in PATH, so it is executable as `get-node.py` from any location.

# Bash/ssh

Secure copy documents:
```
scp claflamm@klone.hyak.uw.edu:/mmfs1/gscratch/stergachislab/claflamm/projects/mydocument .
scp  ./mydocument claflamm@klone.hyak.uw.edu:/mmfs1/gscratch/stergachislab/claflamm/projects/
```

For loops for quick tasks: (example cats zipped files, does a line count, and then prints the file and the line count to the screen)
```
for file in *gz; do zcat "$file" | wc -l | awk -v f="$file" '{print $1,f}'; done
```

Check if command is in your path
```
which <command>
```

# Conda and Mamba
Note: Mamba executable is located in: `/mmfs1/gscratch/stergachislab/claflamm/bin` and mamba root directory is here: `/mmfs1/gscratch/stergachislab/claflamm/micromamba`


Create env:
```
micromamba create -n env
```
Activate env:
```
micromamba activate env
```
List installations in env:
```
micromamba list -n env
```

# R

The packages for OnDemand (rocker/rstudio): `/mmfs1/gscratch/stergachislab/claflamm/bin/ondemand/R/library`


Installed R on klone/hyak using miniconda: `/mmfs1/gscratch/stergachislab/claflamm/bin/miniconda3/`


This R environment is named: `renv`

The packages for renv: `/mmfs1/gscratch/stergachislab/claflamm/bin/miniconda3/envs/renv/lib/R/library`

Note: in order to execute R from VS Code (with autofill via extensions), you need to update your r paths in the VS Code command palette via remote `settings.json` file [Preferences: Open Remote Settings (JSON)]:
```
"r.rpath.linux": "/path/to/R/executable/in/conda/env/R",
"r.rterm.linux": "/path/to/R/executable/in/conda/env/R"
```

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

Note: you can make your own scripts executable by using the shebang headers `#!/usr/bin/env python3` and chmod command `chmod +x <script>`

# Installing software built in python using environments

Create an environment with  micromamba, `pip install -e .` will look for a `pyproject.toml` that will correctly build the env to the specifications outlined in the file (i.e. dependencies, commands). Once the environment is activated, the ommands can be executed from anywhere using the `[project.scripts]` nomenclature.

# IGV
On local machine, set up credentials for stergachis_reader (kopah).

#1 Create ~/.aws/config with the following contents:

```
[default]
region = us-west-2
output = json
endpoint_url = https://s3.kopah.uw.edu
b) create ~/.aws/credentials with the following content:
(Two keys are the same as k_stergachis_reader in Configure rclone)
```

#2 Create ~/.aws/confidential with the following contents:

```
[default]
aws_access_key_id = <your stergachis_reader Access Key>
aws_secret_access_key = <your stergachis_reader Secret Key>
```

#3 Download igv session files (.igv.xml) from prod reporter (https://s3.kopah.uw.edu/prod-reporter/index.html). These can now be opened in IGV to load bams from server in a session.

# PATH
Note: only things that you want to be exectuable from everywhere at all times should be in PATH. Therefore, I have bin/ in path, and I have tools/commands/ in path. Whereas, I can install environment-specific software into tools/ and it won't interfere between my user PATH and env-specific PATHs.
```
bin (in PATH): /mmfs1/gscratch/stergachislab/claflamm/bin/
commands (in PATH): /mmfs1/gscratch/stergachislab/claflamm/tools/commands/
micromamba (in PATH): /mmfs1/gscratch/stergachislab/claflamm/micromamba/
tools (NOT in PATH): /mmfs1/gscratch/stergachislab/claflamm/tools/
note: I have set it up before where I am storing the software in tools and then linking the executable file in bin so that it is in my PATH.
```
# Tools
FiberHMM: installed from source and created micromamba env `fiberhmm` where commands are executable under their `pyproject.toml` names.

# Git
Note: added public ssh keys for both klone and local MacBook air to github in order to be able to clone repos via `git clone git@github.com:path/to.git`

# Local
Note: installed `micromamba` with `homebrew` for environment management.


Executable: /opt/homebrew/Cellar/micromamba/2.5.0_2/bin/mamba


Libs: /opt/homebrew/Cellar/micromamba/2.5.0_2


Environments: /Users/claflamm/.local/share/mamba/envs

# Pixi
Pixi is a package/env manager for python and other languages. Pixi is installed here: /mmfs1/gscratch/stergachislab/claflamm/.pixi


Pixi recognizes the configuration file the `pixi.toml` to set up the env/dependencies/commands/etc. After cloning the github repo, use `pixi install` in the folder with the configuration file to install dependencies. Then, use pixi commands as specified in the configuation file to use the installed software.

# Jupyter Notebook
To use jupyter notebook:
```
jup
```
This is an alias to submit a slurm job that starts jupyter notebook on the HPCF. A log file is deposited into ~/start_jupyter_output with local ssh command to tunnel and links for local browser to access the port running Jupyter. Hint: use the last link with the token.
