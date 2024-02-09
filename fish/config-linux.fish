set fish_greeting ""

set -gx TERM xterm-256color

# use vim keybindings
set -g fish_key_bindings fish_vi_key_bindings
# override some keys
# fish_user_key_bindings

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias cls clear

alias g git
alias gc "git commit -m"
alias ga "git add ."

alias t tmux
alias c code

alias cat bat
alias top btop


command -qv nvim && alias vim nvim


# -----------------------------
# ENV
set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# Rust
set -gx PATH $PATH $HOME/.cargo/bin

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

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
end
# <<< conda initialize <<<

# auto start ssh-agent
set -x SSH_AUTH_SOCK (ssh-agent -c; and echo $SSH_AUTH_SOCK)

# atuin
set -gx ATUIN_NOBIND true
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search
