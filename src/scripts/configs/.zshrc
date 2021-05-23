# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache


### Export
export EDITOR=/usr/bin/micro
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

#### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


### Aliases
alias cat='bat'
alias nano='micro'
alias cl='clear'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'



alias ll='exa -lah --color=always --group-directories-first'  # long format
alias ls='exa -al --color=always --group-directories-first'   # my preferred listing
alias la='exa -a --color=always --group-directories-first'    # all files and dirs
alias lt='exa -aT --color=always --group-directories-first'   # tree listing
alias l.='exa -a | egrep "^\."'								  # list all dot files



#### pacman, yay, paru
alias upall='paru -Syyu --noconfirm'             # update only standard pkgs
alias up='paru -Syu --noconfirm'                 # update (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

#### get fastest mirrors
alias mirror="sudo pacman-mirrors --fasttrack  && sudo pacman -Syyu"
alias mirrorreset="sudo pacman-mirrors --country all --api --protocols all --set-branch stable && sudo pacman -Syyu"


#### Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#### git
alias gaa='git add .'
alias glog='git log --graph --decorate --oneline' # this one is just pure terminal beauty 
alias gs='git status'  # 'status' is protected
alias gst='git stash'
alias gitu='git add . && git commit && git push'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull'
alias push='git push'
alias pushf='git push --force'
alias remote='git remote'
alias remotev='git remote -vv'
alias tag='git tag'
alias newtag='git tag -a'

#### youtube-dl
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias ytv-best="youtube-dl -f bestvideo+bestaudio"

#### rsync
alias rsync='rsync --info=progress2' ## Copy things with progress bar 

 ### BASH INSULTER ###
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
 

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export DOWNGRADE_FROM_ALA=1
