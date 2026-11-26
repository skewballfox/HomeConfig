# ctrl-a: attach to (or start) the background Claude session for this
# directory; ctrl-a again detaches. Logic: ~/.local/libexec/chat-here.
# Replaces the preset beginning-of-line; use Home for that.
if status is-interactive
    # leading space keeps it out of history
    bind ctrl-a 'commandline -r " ~/.local/libexec/chat-here"; commandline -f execute'
end
