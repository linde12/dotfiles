# Common aliases
alias l='ls --color=auto'
alias la='ls -la'
alias ..='cd ..'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias subl="/usr/bin/sublime"
export EDITOR="subl"
alias ~="cd ~"                              # ~:            Go Home
alias dwm-backup='zip -r linde.zip bin/ dwm/ pictures/ .xinitrc .bashrc .bash_aliases .bash_profile .gitconfig .Xdefaults'

#   extract:  Extract most know archives with one command 
#   --------------------------------------------------------- 
    extract () { 
        if [ -f $1 ] ; then 
          case $1 in 
            *.tar.bz2)   tar xjf $1     ;; 
            *.tar.gz)    tar xzf $1     ;; 
            *.bz2)       bunzip2 $1     ;; 
            *.rar)       unrar e $1     ;; 
            *.gz)        gunzip $1      ;; 
            *.tar)       tar xf $1      ;; 
            *.tbz2)      tar xjf $1     ;; 
            *.tgz)       tar xzf $1     ;; 
            *.zip)       unzip $1       ;; 
            *.Z)         uncompress $1  ;; 
            *.7z)        7z x $1        ;; 
            *)     echo "'$1' cannot be extracted via extract()" ;; 
             esac 
         else 
             echo "'$1' is not a valid file" 
         fi 
    } 
 
 
# Networking aliases 
alias myip='curl https://wtfismyip.com/text'        # myip:         Public facing IP Address 
alias privateip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2' 
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets 
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache 
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets 
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets 
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets 
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0 
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1 
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections 
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs 
 
# Git aliases
alias gits='git status'
 
# IP Information 
ii() { 
    echo "Public facing IP Address :$NC " ;myip 
    echo "Private facing IP Address :$NC " ;privateip 
    echo 
} 
