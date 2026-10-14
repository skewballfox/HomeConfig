# env.nu — runs before config.nu/login.nu/autoload.
# Fish equivalents: fish_variables (fish_user_paths) + the top of config.fish.

# Add a directory to $env.PATH unless it's already there.
def --env path-add [dir: string, --append] {
    if $dir in $env.PATH { return }
    $env.PATH = if $append { $env.PATH | append $dir } else { $env.PATH | prepend $dir }
}

# fish_user_paths
path-add /opt/homebrew/bin

# Added by Docker Desktop
path-add ($env.HOME | path join .docker bin) --append

# Generate integration scripts into the vendor autoload dir. Autoload runs after
# env.nu/config.nu, so these load on the same startup that generates them.
# (Fish equivalent: `atuin init fish | source` in conf.d/shell.fish)
if $nu.is-interactive {
    let vendor = ($nu.data-dir | path join vendor autoload)
    mkdir $vendor
    if (which atuin | is-not-empty) {
        atuin init nu | save --force ($vendor | path join atuin.nu)
    }
}
