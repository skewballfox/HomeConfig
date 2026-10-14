# ~/.local/bin/env.fish equivalent
let bin = ($env.HOME | path join .local bin)
if $bin not-in $env.PATH { $env.PATH = ($env.PATH | prepend $bin) }
