# login.nu — only runs for login shells.
# Fish equivalent: the `status is-login` block in config.fish.

# https://github.com/mozilla/grcov/#usage
# $env.RUSTFLAGS = "-Cinstrument-coverage"
$env.XCURSOR_SIZE = "16"
if (which hx | is-not-empty) {
    $env.EDITOR = (which hx | first | get path)
}
$env.KANI_HOME = ($env.HOME | path join .local kani)
$env.SDKMAN_DIR = ($env.HOME | path join .local sdkman)

# pnpm
$env.PNPM_HOME = ($env.HOME | path join .local share pnpm)
if $env.PNPM_HOME not-in $env.PATH {
    $env.PATH = ($env.PATH | prepend $env.PNPM_HOME)
}
