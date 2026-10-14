# The fish version checked `command -q qlty` before ~/.qlty/bin was on PATH, so it
# never fired. Check for the binary directly instead.
let qlty_install = ($env.HOME | path join .qlty)
if ($qlty_install | path join bin qlty | path exists) {
    $env.QLTY_INSTALL = $qlty_install
    let bin = ($qlty_install | path join bin)
    if $bin not-in $env.PATH { $env.PATH = ($env.PATH | append $bin) }
}
