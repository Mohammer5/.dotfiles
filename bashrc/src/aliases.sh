#!/usr/bin/fish

if test -x /usr/bin/dircolors
  if test -r ~/.dircolors
    eval (dircolors -b ~/.dircolors) || eval (dircolors -b)
  end

  alias ls="ls --color=auto"
end

alias b-source="source ~/.bashrc"

# Dir navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias .='cd ~/.dotfiles'
alias x="cd ~/development"
alias xm="cd $DEV_DIR/market-maker-bot"
alias xmc="cd $DEV_DIR/market-maker-client"
alias xml="cd $DEV_DIR/market-maker-lib"
 
alias xd="cd ~/development/dhis2"
alias xdi="cd ~/development/dhis2/import-export-app"
alias xdm="cd ~/development/dhis2/maintenance-app"
alias xdn="cd ~/development/dhis2_notes"
alias xdpt="cd ~/development/dhis2/prop-types"
alias xdr="cd ~/development/dhis2/reports-app"
alias xduc="cd ~/development/dhis2/ui-core"
alias xduw="cd ~/development/dhis2/ui-widgets"
alias xduf="cd ~/development/dhis2/ui-forms"
alias xdoom="cd ~/development/dhis2/project-doom"

# Dir creation
alias mkdir="mkdir -p"

# Wallpaper
alias setwp="feh --bg-scale $HOME/.dotfiles/i3wm/wallpapers/flat-hexagon-wallpaper.jpg"

# Dir info
alias ll='ls -Flh --group-directories-first'

# System Info
alias df='df -h'                             # human-readable sizes
alias freem='free -m'                        # show sizes in MB

# Applications
alias g="git"
alias tmux-source="tmux source ~/.tmux.conf"

# Helpers
alias wrep="grep -Iwrm 1 --color"

# Displays
set MAIN_SCREEN "eDP1"
alias h1onr="sudo xrandr --output HDMI1 --auto --right-of $MAIN_SCREEN && setwp"
alias h1onl="sudo xrandr --output HDMI1 --auto --left-of $MAIN_SCREEN && setwp"
alias h1off="sudo xrandr --output HDMI1 --off"

# DHIS2 start

#**
#* @prarm {string} $1 - dhis2 base url
#* @prarm {string} $2 - verion path
#* @param {string} $3 - DHIS2_HOME config folder
#**
function dhis2start
  set DHIS2_BASE_URL $argv[1]
  set VERSION_PATH $argv[2]
  set CONFIG_DIR $argv[3]

  env BROWER=$BROWSER_DEFAULT \
    env DHIS2_HOME=$CONFIG_DIR \
    env REACT_APP_DHIS2_BASE_URL=$DHIS2_BASE_URL/$VERSION_PATH \
    bash -c 'yarn start'
end

#**
#* @prarm {string} $1 - verion path
#* @param {string} $2 - DHIS2_HOME config folder
#**
function dhis2debug
  dhis2start $DHIS2_DEBUG_BASE_URL $argv[1] $argv[2]
end

#**
#* @prarm {string} $1 - verion path
#* @param {string} $2 - DHIS2_HOME config folder
#**
function dhis2play
  dhis2start $DHIS2_PLAY_BASE_URL $argv[1] $argv[2]
end

function debugdev
  dhis2debug $DEBUG_DEV_PATH $DHIS2_HOME_DEBUG_DEV
end

function debug33
  dhis2debug $DEBUG_33_PATH $DHIS2_HOME_DEBUG_33
end

function debug32
  dhis2debug $DEBUG_32_PATH $DHIS2_HOME_DEBUG_32
end

function debug31
  dhis2debug $DEBUG_31_PATH $DHIS2_HOME_DEBUG_31
end

function debug30
  dhis2debug $DEBUG_30_PATH $DHIS2_HOME_DEBUG_30
end

function debug29
  dhis2debug $DEBUG_29_PATH $DHIS2_HOME_DEBUG_29
end

function playdev
  dhis2play $PLAY_DEV_PATH $DHIS2_HOME_PLAY_DEV
end

function play33
  dhis2play $PLAY_33_PATH $DHIS2_HOME_PLAY_33
end

function play32
  dhis2play $PLAY_32_PATH $DHIS2_HOME_PLAY_32
end

function play31
  dhis2play $PLAY_31_PATH $DHIS2_HOME_PLAY_31
end

function play30
  dhis2play $PLAY_30_PATH $DHIS2_HOME_PLAY_30
end

function play29
  dhis2play $PLAY_29_PATH $DHIS2_HOME_PLAY_29
end

function yarnfpn
  env BROWER=$BROWSER_DEFAULT \
    env DHIS2_HOME=$DHIS2_HOME_FPN \
    env REACT_APP_DHIS2_BASE_URL=https://functionalprogramming.ninja/dhis \
    bash -c 'yarn start'
end

# connect to functionalprogramming.ninja
# @param $1 username
function sshfpn
  ssh $1@87.230.14.248
end

# copy to functionalprogramming.ninja
# @param $1 username
# @param $2 client-file
# @param $3 target-location
function scpfpn
  ssh $2 $1@87.230.14.248:$3;
end

function reverse_history_search
  history | fzf --no-sort | read -l command
  if test $command
    commandline -rb $command
  end
end

function fish_user_key_bindings
  bind \cr reverse_history_search
end

# #
# # # ex - archive extractor
# # # usage: ex <file>
# ex ()
# {
#   if [ -f $1 ] ; then
#     case $1 in
#       *.tar.bz2)   tar xjf $1   ;;
#       *.tar.gz)    tar xzf $1   ;;
#       *.bz2)       bunzip2 $1   ;;
#       *.rar)       unrar x $1     ;;
#       *.gz)        gunzip $1    ;;
#       *.tar)       tar xf $1    ;;
#       *.tbz2)      tar xjf $1   ;;
#       *.tgz)       tar xzf $1   ;;
#       *.zip)       unzip $1     ;;
#       *.Z)         uncompress $1;;
#       *.7z)        7z x $1      ;;
#       *)           echo "'$1' cannot be extracted via ex()" ;;
#     esac
#   else
#     echo "'$1' is not a valid file"
#   fi
# }
