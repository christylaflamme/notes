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

# tmux
tmux commonly used keyboard commands

Detach: `Ctrl-b-d`
Next window/tab: `Ctrl-b-n`
Specific window/tab: `Ctrl-b-#`

