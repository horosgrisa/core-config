#!/usr/bin/env zsh

DEPENDENCES_ZSH+=( zpm-zsh/helpers zpm-zsh/colors )

if (( $+functions[zpm] )) >/dev/null; then
  zpm zpm-zsh/helpers,inline zpm-zsh/colors,inline
fi

WORDCHARS='*?_[]~=&;!#$%^(){}<>:.-'

export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"


setopt braceccl
setopt interactive_comments
setopt nohup
setopt nobeep
setopt numericglobsort
setopt nocaseglob
setopt nocheckjobs
setopt multios              
setopt extendedglob        
setopt combining_chars

setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history

setopt correct
setopt autocd

unsetopt clobber            
unsetopt extended_history
unsetopt bg_nice


zstyle ':completion:*:processes' command 'NOCOLORS=1 ps -U $USER|sed "/ps/d"'
zstyle ':completion:*:processes' insert-ids menu yes select
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"'
zstyle ':completion:*:processes' sort false

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle '*' single-ignored show
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true

zstyle ':completion:*:messages' format '%d'

zstyle ':completion:*' list-colors ''

zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

if [[ "$CLICOLOR" != '0' ]]; then
  zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
  zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
  zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==36=36}:${(s.:.)LS_COLORS}")';
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 'ma=7;33'
else
  zstyle ':completion:*:warnings' format $'No matches for: %d'
fi

zstyle ":completion::complete:*" use-cache 1
zstyle ":completion::complete:*" cache-path "$HOME/.cache/zsh"

zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs \
  colord dnsmasq geoclue git gluster haveged lightdm polkitd \
  rtkit sddm usbmux uuidd \
  'deepin*' 'systemd-*' '_*'



zmodload zsh/complist

bindkey -e

bindkey '^R' history-incremental-search-backward

bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

bindkey "^[OH" beginning-of-line
bindkey "^[[H" beginning-of-line

bindkey "^[OF"  end-of-line
bindkey "^[[F"  end-of-line

bindkey '^[[1;5C' forward-word
bindkey '^[[C' forward-word

bindkey '^[[1;5D' backward-word
bindkey '^[[D' backward-word

bindkey '^[[C' forward-char
bindkey '^[[D' backward-char

bindkey '^?' backward-delete-char

bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

bindkey '^[[3;5~' delete-word

bindkey '^H' backward-delete-word

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

bindkey -M menuselect " " accept-and-menu-complete




alias tmp='cd $(mktemp -d)'
alias cdo='cd -'
alias -- -='cd -'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'



appendpath ~/.bin
appendpath ~/.local/bin
