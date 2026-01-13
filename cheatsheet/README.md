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

Detach: `Ctrl-b-d`
Next window/tab: `Ctrl-b-n`
Specific window/tab: `Ctrl-b-#`
Enter copy mode (can scroll up and down as normal): `Ctrl-b-[`
Exit copy mode: `q`
List sessions: `tmux list-sessions`
Kill session: `tmux kill-session`


# slurm
Cancel a job:
```
scancel
```

# Installing executables to utilize software tools
First, download the linux executable file
```
wget <link_address>
```

Then, decompress it:
```
tar -xvf <file.tar.gz>
```


Then, navigate into the unzipped folder, find the executable, `md5sum` check, and move it into the install location in PATH (/mmfs1/gscratch/stergachislab/claflamm/bin).
Finally, check the install: 
```
app_name -h
```





