# Mouse wheel in pagers (less >= 551). Mirrors dot_bashrc.d/pager and nushell autoload/pager.nu
set -gx LESS "-R -F -X --mouse --wheel-lines=3"
set -gx BAT_PAGER "less -R --mouse"
