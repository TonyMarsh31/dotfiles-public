function my_fish_greeting
    # Get a list of cow files, excluding the header line
    set cowfiles (cowsay -l | tail -n +2 | tr ' ' '\n')

    # Select a random cow file
    set random_cow (random choice $cowfiles)

    # Run fortune, pipe to cowsay with a random cow, then to lolcat
    fortune | cowsay -f $random_cow | lolcat
end