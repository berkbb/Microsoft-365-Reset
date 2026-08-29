#!/bin/zsh

####################################################################################################
#
# Microsoft 365 Reset Launcher
#
# Double-clickable macOS .command wrapper to run Microsoft-365-Reset.zsh with sudo.
#
####################################################################################################

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
TARGET_SCRIPT="${SCRIPT_DIR}/Microsoft-365-Reset.zsh"

if [[ ! -f "${TARGET_SCRIPT}" ]]; then
    print -r -- "Error: Target script '${TARGET_SCRIPT}' not found." >&2
    exit 1
fi

# Request administrator (sudo) privileges if not already root
if [[ $(id -u) -ne 0 ]]; then
    print -r -- "Administrator privileges required. Please enter your password when prompted:"
    sudo -v || { print -r -- "Error: Failed to obtain administrator (sudo) privileges." >&2; exit 1; }
fi

print -r -- "Launching Microsoft 365 Reset..."
sudo "${TARGET_SCRIPT}" "$@"
