# github-commit-generator

A simple CLI tool that writes your Git commit messages for you.

`github-commit-generator` reads your staged changes (`git diff`) and uses a local AI model (via Ollama) to generate a clear, concise, and meaningful commit message automatically.

Everything runs locally on your machine—no API keys, no cloud, complete privacy. Perfect for when you're out of inspiration and about to just type `git commit -m "fix stuff"` for the 10th time today.

## Features

* Local AI: Powered by Ollama (uses CodeLlama by default).
* Private: Your code never leaves your machine.
* Fast & Simple: One command to analyze changes and commit.

## Installation

1. Clone the repository and navigate into it:
   ```bash
   git clone [https://github.com/zaha27/github-commit-generator.git](https://github.com/zaha27/github-commit-generator.git)
   cd github-commit-generator
   ```

2. Make the scripts executable:
   ```bash
   chmod +x gcm.sh gcm-uninstall.sh gcm
   ```

3. Run the installation script:
   ```bash
   ./gcm.sh
   ```

4. Reload your shell configuration:
   ```bash
   source ~/.bashrc
   ```
   *(Note: use `source ~/.zshrc` if you are using Zsh)*

> Note: Make sure you have Ollama installed and running (`ollama serve`) on your system before using the tool.

## Usage

1. Stage the files you want to commit:
   ```bash
   git add <your-file>
   ```

2. Run the generator:
   ```bash
   gcm
   ```

3. Accept or cancel:
   The tool will suggest a message. You can either accept it to auto-commit or cancel.