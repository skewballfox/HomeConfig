
if command -q carapace
	set -x CARAPACE_BRIDGES 'cobra,click,clap,kingpin,argcomplete,yargs'
    carapace _carapace fish | source
end
if command -q atuin
	atuin init fish | source
end
