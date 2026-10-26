# Translated from ~/.config/fish/completions/skx.fish
def "nu-complete skx tool" [] {
    [
        [value description];
        [skills "installer to wrap"]
        [skillfish "installer to wrap"]
        [completions "print a shell completion script"]
    ]
}

export extern "skx" [
    tool?: string@"nu-complete skx tool"
]

# `skx completions` only supports fish
export extern "skx completions" [
    shell?: string@["fish"]
]

# scan-only flags are forwarded to skill-scan/skillspector, stripped before install
export extern "skx skills add" [
    --no-llm                        # static analysis only, skip LLM pass
    --transitive                    # also scan external references the skill points to
    --transitive-depth: int         # max depth for --transitive (default 1)
    --fail-on-incomplete            # treat an incomplete/partial scan as unsafe
    --verbose(-V)                   # show detailed scan progress
    --skill(-s): string             # skill name within the repo
    --path: string                  # explicit path to the skill within the repo
    ...args: string
]

export extern "skx skillfish add" [
    --no-llm                        # static analysis only, skip LLM pass
    --transitive                    # also scan external references the skill points to
    --transitive-depth: int         # max depth for --transitive (default 1)
    --fail-on-incomplete            # treat an incomplete/partial scan as unsafe
    --verbose(-V)                   # show detailed scan progress
    --skill(-s): string             # skill name within the repo
    --path: string                  # explicit path to the skill within the repo
    ...args: string
]
