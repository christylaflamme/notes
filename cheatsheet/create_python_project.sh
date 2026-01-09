#!/usr/bin/env bash                                                                                                                                                                                            

mkdir -p python-sample/tests python-sample/.vscode
cat > python-sample/main.py <<'PY'
def greet(name: str) -> str:
    return f"Hello, {name}!"

def main():
    print(greet("World"))

if __name__ == "__main__":
    main()
PY

cat > python-sample/tests/test_main.py <<'PY'
from main import greet

def test_greet():
    assert greet("Alice") == "Hello, Alice!"
PY

cat > python-sample/requirements.txt <<'TXT'
pytest
TXT

cat > python-sample/.gitignore <<'TXT'
.venv/
__pycache__/
*.pyc
.vscode/
TXT

cat > python-sample/.vscode/launch.json <<'JSON'
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python: Current File",
      "type": "python",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal"
    },
    {
      "name": "Python: Run main.py",
      "type": "python",
      "request": "launch",
      "program": "${workspaceFolder}/main.py",
      "console": "integratedTerminal"
    }
  ]
}
JSON

cat > python-sample/README.md <<'MD'
# Python Sample

Setup:
1. Install Python (Homebrew): `brew install python`
2. Open folder in VS Code: `code python-sample`

Create & activate virtualenv:
```bash
cd python-sample
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
