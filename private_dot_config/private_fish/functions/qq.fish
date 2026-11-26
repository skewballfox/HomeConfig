function qq --description 'Quick one-off question to Claude Haiku 4.5'
    # Typed at its own `qq>` prompt, read verbatim: no fish parsing (quotes,
    # $, *, ;, # stay literal) and no syntax highlighting. Arguments, if any,
    # are used as-is instead, for questions that are already shell-safe.
    set -l question "$argv"
    if test -z "$question"
        # no -l: that would scope it to this if-block
        read -P 'qq> ' question; or return
    end
    test -n "$question"; or return

    # No tools or MCP servers to start, and nothing saved to the /resume list.
    claude -p --model claude-haiku-4-5 \
        --tools '' --strict-mcp-config --no-session-persistence \
        --append-system-prompt 'This is a one-off question from a terminal. Answer briefly and directly.' \
        -- $question
end
