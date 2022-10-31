set fish_greeting ""

set -gx TERM xterm-256color

# proxy
function proxy
  set -xg ALL_PROXY http://localhost:7890
end

function noproxy
  set -e ALL_PROXY
end
# 第一次开启Iterm2时执行的命令，当做问候语的同时开启ALL_PROXY
function activate-proxy 
  set -xg ALL_PROXY http://localhost:7890
end

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias c code
alias gc "git commit -m"
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/tonymarsh/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


# Setting PATH for Python 3.10
# The original version is saved in /Users/tonymarsh/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# mysql
set -x PATH "/usr/local/mysql/bin" "$PATH"

# startship
starship init fish | source
