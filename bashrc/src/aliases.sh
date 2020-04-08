#!/usr/bin/fish

if test -x /usr/bin/dircolors
  if test -r ~/.dircolors
    eval (dircolors -b ~/.dircolors) || eval (dircolors -b)
  end

  alias ls="ls --color=auto"
end

alias b-source="source ~/.bashrc"

##
#
# Utilities & command improvement
#
##

  alias mkdir="mkdir -p"

  # Dir info
  alias ll='ls -Flh --group-directories-first'

  # System Info
  alias df='df -h'                             # human-readable sizes
  alias freem='free -m'                        # show sizes in MB

  # Applications
  alias g="git"

##
# 
# Printing
#
##

  # print multiple in path
  # alias printmp="find -type f -not -path '*.git/*' | fzf -m | sed -s 's/\(^'|'\$\)//g' | sed -s 's/\s/\\\ /g' | while read line; lp $line; end"

##
#
# Dir navigation
#
##

  alias    .='cd ~/.dotfiles'
  alias   ..="cd .."
  alias  ...="cd ../.."
  alias ....="cd ../../.."

  alias     d="cd ~/development/dhis2 && cd (ls -A1 | fzf)"
  alias     x="cd ~/development/private && cd (ls -A1 | fzf)"
  alias   dev="cd ~/development/private"
  alias dhis2="cd ~/development/dhis2"

  alias    xb="cd ~/development/private/market-maker"
  alias   d2i="dhis2 && cd ./import-export-app"
  alias   d2m="dhis2 && cd ./maintenance-app"
  alias   d2n="dhis2 && cd ./notes"
  alias  d2pt="dhis2 && cd ./prop-types"
  alias   d2r="dhis2 && cd ./reports-app"
  alias  d2uc="dhis2 && cd ./ui-core"
  alias  d2uf="dhis2 && cd ./ui-forms"
  alias  d2ui="dhis2 && cd ./ui"
  alias  d2uw="dhis2 && cd ./ui-widgets"
  alias d2mar="dhis2 && cd ./project-doom"

# Dot files

  alias dot=". && nvim (find . -type f -not -path '*.git/*' | fzf)"

# Wallpaper
alias setwp="feh --bg-scale $HOME/.dotfiles/i3wm/wallpapers/flat-hexagon-wallpaper.jpg"

alias tmux-source="tmux source ~/.tmux.conf"

# Helpers
alias wrep="grep -Iwrm 1 --color"

# Displays
set MAIN_SCREEN "eDP1"

alias h1onr="sudo xrandr --output HDMI1 --auto --right-of $MAIN_SCREEN && setwp"
alias h1onl="sudo xrandr --output HDMI1 --auto --left-of $MAIN_SCREEN && setwp"
alias h1off="sudo xrandr --output HDMI1 --off"

function monleft
  set MAIN "HDMI-0"
  set MONITOR (xrandr | sed -n -e 's/^\(\S*\) connected.*$/\1/p' | fzf)
  echo $MONITOR
  sudo xrandr --output $MONITOR --auto --left-of $MAIN
end

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
