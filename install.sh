#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Linking config files"

mkdir -p "${HOME}/.config/mise"
mkdir -p "${HOME}/.config/fish/conf.d"

ln -snf "${DOTFILES_DIR}/mise/config.toml" "${HOME}/.config/mise/config.toml"
ln -snf "${DOTFILES_DIR}/fish/config.fish" "${HOME}/.config/fish/config.fish"
ln -snf "${DOTFILES_DIR}/fish/conf.d/10-mise.fish" "${HOME}/.config/fish/conf.d/10-mise.fish"
echo "==> Installing Homebrew packages (if brew exists)"
if command -v brew >/dev/null 2>&1; then
	brew bundle --file "${DOTFILES_DIR}/Brewfile"
else
	echo "brew not found, skipping"
fi

echo "==> Installing tools via mise (if mise exists)"
if command -v mise >/dev/null 2>&1; then
	mise up
else
	echo "mise not found, skipping"
fi

echo "==> Done"
# shellcheck disable=SC2016
echo 'Restart shell: exec $SHELL -l'
