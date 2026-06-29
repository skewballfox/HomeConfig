if status is-interactive
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
end

if status is-login
    set -gx RUST_BACKTRACE 1
    # https://github.com/mozilla/grcov/#usage
    # set -gx RUSTFLAGS -Cinstrument-coverage
    set -gx XCURSOR_SIZE 16
    set -gx EDITOR /usr/bin/hx
    set -gx KANI_HOME ~/.local/kani
    set -gx SDKMAN_DIR ~/.local/sdkman
    # pnpm
    set -gx PNPM_HOME "/home/skewballfox/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end

end
