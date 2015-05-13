# .zshrc
#

export LANG=ja.JP.UTF-8

autoload -Uz compinit
compinit


PROMPT="%F{magenta}%n%f@%F{blue}%m%f %# "
RPROMPT="(:3[%F{green}%~%f]"
PROMPT2=">> "
SPROMPT="Correct: %R -> %r ?"


HISTSIZE=1000000
SAVEHIST=1000000

bindkey -v

setopt print_eight_bit

setopt no_beep

setopt ignore_eof
