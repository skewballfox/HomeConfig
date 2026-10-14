# config.nu — interactive shell configuration.
# Fish equivalent: the `status is-interactive` block in config.fish.
# Login-only setup is in login.nu; the conf.d equivalents are in autoload/.

if $nu.is-interactive {
    # GPG agent doubling as the SSH agent
    try { $env.GPG_TTY = (^tty | str trim) }
    if (which gpgconf | is-not-empty) {
        $env.SSH_AUTH_SOCK = (^gpgconf --list-dirs agent-ssh-socket | str trim)
        # backgrounded: the launch alone costs ~380ms
        job spawn { ^gpgconf --launch gpg-agent } | ignore
    }
}
