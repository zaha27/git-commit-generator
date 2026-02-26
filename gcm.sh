#!/bin/bash

INSTALL_DIR="$HOME/gcm"
TARGET_PATH="$INSTALL_DIR/gcm"

echo "[*] Creating install directory at $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

echo "[*] Copying CLI files..."
cp -r gcm core config "$INSTALL_DIR"
chmod +x "$TARGET_PATH"

# shell detection
CURRENT_SHELL=$(basename "$SHELL")
if [[ "$CURRENT_SHELL" == "zsh" ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ "$CURRENT_SHELL" == "bash" ]]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

echo "[*] Using shell config file: $SHELL_RC"

# if needed -- then put in path
if ! grep -q 'export PATH="$HOME/gcm:$PATH"' "$SHELL_RC"; then
    echo "" >> "$SHELL_RC"
    echo "# GCM Enhance CLI" >> "$SHELL_RC"
    echo 'export PATH="$HOME/gcm:$PATH"' >> "$SHELL_RC"
    echo "[+] Added GCM to PATH in $SHELL_RC"
else
    echo "[OK] PATH already contains GCM"
fi

# check ollama
echo ""
echo "[*] Checking for Ollama..."

if ! command -v ollama &> /dev/null; then
    echo "[!] Ollama is not installed."

    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "[*] Attempting to install Ollama using Homebrew..."
        if command -v brew &> /dev/null; then
            brew install ollama
            echo "[OK] Ollama installed. You must run it once: open -a Ollama"
        else
            echo "[ERROR] Homebrew not found. Please install Ollama manually from https://ollama.com"
        fi
    else
        echo "[ERROR] Automatic install not supported on this OS. Please install manually from: https://ollama.com"
    fi
else
    echo "[OK] Ollama is already installed."

    echo "[*] Checking for codellama model..."
    if ! ollama list | grep -q codellama; then
        echo "[*] Downloading codellama model..."
        ollama pull codellama
    else
        echo "[OK] codellama model already available."
    fi
fi

# finish install
echo ""
echo "[OK] GCM installation complete!"
echo ""
echo "[i] Run this command to finalize setup:"
echo "     source $SHELL_RC"
echo ""
echo "[i] Then launch with:"
echo "     gcm           # run commit generator"
echo ""