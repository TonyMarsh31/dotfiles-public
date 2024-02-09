function fish_user_key_bindings
    # using vim-mode keybindings , so the following keybindings should specify the mode
    # fzf
    bind -M insert \cf fzf_change_directory

    # vim-like
    bind -M insert \cl forward-char

    # prevent iterm2 from closing when typing Ctrl-D (EOF)
    bind -M insert \cd delete-char
end

# fzf plugin
fzf_configure_bindings --directory=\co
