# ~/.cargo/env.fish equivalent
let bin = ($env.HOME | path join .cargo bin)
if $bin not-in $env.PATH { $env.PATH = ($env.PATH | prepend $bin) }
