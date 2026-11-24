# Mouse wheel in pagers (less >= 551). Mirrors fish conf.d/pager.fish and bashrc.d/pager
$env.LESS = "-R -F -X --mouse --wheel-lines=3"
$env.BAT_PAGER = "less -R --mouse"
