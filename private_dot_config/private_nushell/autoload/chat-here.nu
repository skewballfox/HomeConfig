# ctrl-a: attach to (or start) the background Claude session for this
# directory; ctrl-a again detaches. Logic: ~/.local/libexec/chat-here.
# Mirrors fish conf.d/chat-here.fish and bashrc.d/chat-here.
# Replaces move-to-line-start; use Home for that.
$env.config.keybindings ++= [{
    name: chat_here
    modifier: control
    keycode: char_a
    mode: [emacs vi_normal vi_insert]
    event: { send: executehostcommand cmd: $"^($env.HOME)/.local/libexec/chat-here" }
}]
