### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/yutaro.suzuki/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

if status is-interactive
    # macOS: Homebrew
    if test (uname) = "Darwin"
        if test -x /opt/homebrew/bin/brew
            eval (/opt/homebrew/bin/brew shellenv)
        end
    end

    # ~/.local/bin
    if test -d "$HOME/.local/bin"
        fish_add_path -m "$HOME/.local/bin"
    end

    # fzf
    if type -q fzf
        fzf --fish | source
    end

    # kiro
    if set -q TERM_PROGRAM; and string match -q "kiro" "$TERM_PROGRAM"; and type -q kiro
        . (kiro --locate-shell-integration-path fish)
    end
end

