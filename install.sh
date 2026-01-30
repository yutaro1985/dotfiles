#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Link configs"
mkdir -p "${HOME}/.config/mise"
mkdir -p "${HOME}/.config/fish/conf.d"

ln -snf "${DOTFILES_DIR}/mise/config.toml" "${HOME}/.config/mise/config.toml"
ln -snf "${DOTFILES_DIR}/fish/config.fish" "${HOME}/.config/fish/config.fish"
ln -snf "${DOTFILES_DIR}/fish/conf.d/10-mise.fish" "${HOME}/.config/fish/conf.d/10-mise.fish"

echo "==> Brew bundle (if brew exists)"
if command -v brew >/dev/null 2>&1; then
	brew bundle --file "${DOTFILES_DIR}/Brewfile"
else
	echo "brew not found, skip."
fi

echo "==> mise up (if mise exists)"
if command -v mise >/dev/null 2>&1; then
	mise up
else
	echo "mise not found, skip."
fi

echo "==> Done"
# trunk-ignore(shellcheck/SC2016)
echo 'Restart shell: exec $SHELL -l'
