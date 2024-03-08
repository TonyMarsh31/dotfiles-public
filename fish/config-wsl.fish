set fish_greeting ""
#my_fish_greeting

set -gx TERM xterm-256color

# wsl2
set -gx BROWSER /usr/bin/wslview

# use vim keybindings
set -g fish_key_bindings fish_vi_key_bindings
# override some keys
fish_user_key_bindings

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls exa
alias ll "exa -l -g --icons"
alias la "ls -a"
alias lla "ll -a"
alias tree "ls -T -L 1"
alias tree2 "ls -T -L 2"
alias tree3 "ls -T -L 3"

alias cls clear

alias g git
alias gc "git commit -m"
alias ga "git add ."

alias t tmux
alias cat bat
alias top btop

alias vim nvim
command -qv nvim

# rust
alias cg cargo



# -----------------------------
# ENV
set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.local/share/bob/nvim-bin $PATH

# DoomEmacs
set -gx PATH $HOME/.config/emacs/bin $PATH

# Rust
set -gx PATH $PATH $HOME/.cargo/bin

# Go
set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/Developments/go
set -gx PATH $GOROOT/bin $GOPATH/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

nvm use default --silent

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/tony/.ghcup/bin $PATH # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/tony/miniconda3/bin/conda
    eval /home/tony/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/tony/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/tony/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /home/tony/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# auto start ssh-agent
set -x SSH_AUTH_SOCK (ssh-agent -c; and echo $SSH_AUTH_SOCK)

# atuin
set -gx ATUIN_NOBIND true
atuin init fish | source
# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cf _atuin_search
bind -M insert \cf _atuin_search

# zoxide
zoxide init fish | source
