#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# 1e9e 2c6f 2113 00d0 0506 a646 023b
# e639 0434 20ba 03d1 044f f129 e79b / e63c

icon1=
icon2=

#"2;0;43;54m"
#"2;7;54;66m"
#"2;88;110;117m"
#"2;101;123;131m"
#"2;131;148;150m"
#"2;147;161;161m"

#declare -a colors=(
#  "2;220;50;47m"
#  "2;203;75;22m"
#  "2;181;137;0m"
#  "2;133;153;0m"
#  "2;42;161;152m"
#  "2;38;139;210m"
#  "2;108;113;196m"
#  "2;211;54;130m"
#)
declare -a colors=(
  "2;133;153;0m"
  "2;108;113;196m"
  "2;42;161;152m"
  "2;220;50;47m"
  "2;181;137;0m"
  "2;203;75;22m"
  "2;211;54;130m"
  "2;38;139;210m"
)
LEN=${#colors[@]}
BG="\[\e[48;"
FG="\[\e[38;"
TRANSP="1m\]"
BASE2="2;238;232;213m\]"
BASE03="2;0;43;54m\]"

get_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setv(){
  RAND=$(($RANDOM % $LEN))
  COLOR1=${colors[$RAND]}
  COLOR2=${colors[($RAND + 1) % $LEN]}
  COLOR3=${colors[($RAND + 2) % $LEN]}
  COLOR4=${colors[($RAND + 3) % $LEN]}
}

PROMPT_COMMAND=setv

PS1="$BG$TRANSP$FG\$COLOR1\]$icon1$BG\$COLOR1\]$FG$TRANSP$BG\$COLOR1\]$FG$BASE2 д₺ϑя $BG\$COLOR2\]$FG\$COLOR1\]$icon2$BG\$COLOR2\]$FG$BASE03\$(get_branch) $BG\$COLOR3\]$FG\$COLOR2\]$icon2$BG\$COLOR3\]$FG$BASE2 \w $BG\$COLOR4\]$FG\$COLOR3\]$icon2$BG\$COLOR4\]$FG$BASE2     \[\e[0m\]$FG\$COLOR4\]$icon2\[\e[0m\] "

alias tvon='xrandr --output HDMI-1 --mode 1360x768 --pos 3x0'
alias tvoff='xrandr --output HDMI-1 --off'
alias ls="ls -A --color=auto"
alias ll="ls -Al --color=auto"
alias v="vim"
alias nv="nvim"
alias cfg='/usr/bin/git --git-dir=/home/baldric/.df/ --work-tree=/home/baldric'
alias kd="kitty +kitten themes --reload-in=all SolarizedDark"
alias kl="kitty +kitten themes --reload-in=all SolarizedLight"
alias q="qimgv"
alias z="zathura"
alias ab="(crontab -l > crontemp; sed -E 's/(.+nitrogen.+)/#\1/' crontemp | crontab > /dev/null; rm crontemp; xwinwrap -b -fs -sp -nf -ov -- glslideshow --duration 30 --pan 30 -root -window-id WID > /dev/null 2>&1 &)"
alias ba="(pkill glslideshow;crontab -l > crontemp; sed -E 's/#((\* ){5}nitrogen)/\1/' crontemp | crontab > /dev/null; rm crontemp)"
alias sshcc="kitty +kitten ssh cc"

zombies() {
    ps -eo pid,ppid,stat,cmd | awk '$3 ~ /^Z/'
}




# fnm
export PATH=/home/baldric/.local/bin:/home/baldric/.fnm:$PATH
eval "`fnm env`"
# nim
#export PATH=/home/baldric/.nimble/bin:$PATH

# animated background
export PATH=$PATH:/usr/lib/xscreensaver

complete -C /usr/bin/aws_completer aws

export CGO_ENABLED=0
export HISTSIZE=25000
export HISTFILESIZE=25000
export HISTCONTROL=ignoreboth
export EDITOR=vim
#-------------------------------------------------------------
export PASSWORD_STORE_CLIP_TIME=15
export PASSWORD_STORE_GENERATED_LENGTH=48
export PASSWORD_STORE_DIR=/var/tmp/pdub
alias op="~/Documents/overpass/src/password-store.sh"
#--------------------------------------------------------------
#export POLYBAR_SHELL=/bin/bash

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/baldric/.opam/opam-init/init.sh' && . '/home/baldric/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration
