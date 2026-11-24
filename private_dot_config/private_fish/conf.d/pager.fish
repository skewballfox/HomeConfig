# No -X and no --mouse: less stays in the alternate screen, where the terminal
# turns wheel ticks into arrow keys (same behaviour as up/down).
# Mirrors dot_bashrc.d/pager and nushell autoload/pager.nu
set -gx LESS "-R -F --redraw-on-quit"
