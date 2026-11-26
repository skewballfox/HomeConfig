# ctrl-a toggles between this shell and a background Claude Code session for the
# current directory, kept running between visits.
#
# At the prompt, ctrl-a attaches to the newest background session started in
# $PWD, starting one first (`claude --bg`, empty chat) if there is none.
# Inside the attached session, kitty turns ctrl+a into ctrl+z, which is how
# `claude attach` detaches; Claude has no rebindable detach action. Kitty only
# does that while the user var below is set (see kitty.conf).

function __claude_session_for_cwd
    claude agents --json --all --cwd "$PWD" 2>/dev/null \
        | jq -r --arg cwd "$PWD" \
            'map(select(.kind == "background" and .cwd == $cwd))
             | sort_by(.startedAt) | last | .id // empty'
end

function __kitty_user_var --argument-names name value
    set -q KITTY_WINDOW_ID; or return
    if test -n "$value"
        printf '\e]1337;SetUserVar=%s=%s\a' $name (printf %s $value | base64)
    else
        printf '\e]1337;SetUserVar=%s\a' $name
    end
end

function claude-here --description 'Attach to (or start) the background Claude session for $PWD'
    set -l id (__claude_session_for_cwd)
    if test -z "$id"
        claude --bg --name (path basename -- $PWD) >/dev/null; or return
        set id (__claude_session_for_cwd)
        test -n "$id"; or begin
            echo "claude-here: started a session but couldn't find it" >&2
            return 1
        end
    end
    __kitty_user_var claude_attached 1
    claude attach $id
    set -l rc $status
    __kitty_user_var claude_attached ''
    return $rc
end

if status is-interactive
    # replaces the preset beginning-of-line; use Home for that
    # leading space keeps it out of history
    bind ctrl-a 'commandline -r " claude-here"; commandline -f execute'
end
