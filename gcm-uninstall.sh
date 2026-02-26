#!/bin/bash

INSTALL_DIR="$HOME/gcm"
SHELL_RC=""

# shell detection
CURRENT_SHELL=$(basename "$SHELL")
if [[ "$CURRENT_SHELL" == "zsh" ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ "$CURRENT_SHELL" == "bash" ]]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

echo "[!] This will remove GCM CLI from your system."

read -p "Are you sure you want to uninstall GCM? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo "[*] Uninstall cancelled."
    exit 0
fi

# remove install dir
if [[ -d "$INSTALL_DIR" ]]; then
    rm -rf "$INSTALL_DIR"
    echo "[OK] Removed $INSTALL_DIR"
else
    echo "[!] Install directory not found: $INSTALL_DIR"
fi

# remove from path -- if needed
if grep -q 'export PATH="$HOME/gcm:$PATH"' "$SHELL_RC"; then
    sed -i.bak '/export PATH="\$HOME\/gcm:\$PATH"/d' "$SHELL_RC"
    echo "[OK] Removed PATH entry from $SHELL_RC"
    echo "[i] A backup was created at $SHELL_RC.bak"
else
    echo "[!] No PATH entry found in $SHELL_RC"
fi

# finish uninstall
echo ""
echo "[OK] GCM has been uninstalled."
echo "[i] To apply changes, run:"
echo "     source $SHELL_RC"
echo ""