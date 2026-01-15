# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias la="ls -la"
alias hx="helix"
alias ww="ssh -L5999:/tmp/dcs-tmp.u5690426/.vnc-socket u5690426@remote-26.dcs.warwick.ac.uk"
alias music="~/launch_music.sh"

[ -f "/home/ryan/.ghcup/env" ] && . "/home/ryan/.ghcup/env" # ghcup-env