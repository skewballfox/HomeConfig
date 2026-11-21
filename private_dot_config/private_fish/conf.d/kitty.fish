if status is-interactive
    if test "$TERM" = xterm-kitty
        abbr -a ssh kitten ssh
    end
end
