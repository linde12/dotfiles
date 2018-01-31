# Set the greeting
# Command line utility aliases
alias t  "tree --dirsfirst"
alias ll "ls -alGh"
alias l "ls"
alias wtc 'curl -Ss http://whatthecommit.com/index.txt'

# Link binaries w/ stow to ~/.local/bin
function lnbin
  stow -t $HOME/.local/bin/ $argv;
end

# Upload file under 100MiB & copies URL to clipboard, removed in 24h
function up
  set result (curl -sF name=$argv -F file=@$argv 'https://uguu.se/api.php?d=upload-tool')
  echo "Copied '$result' to clipboard"
  echo $result | tr -d '\n' | xsel -bspi
end

# Git aliases
alias gs  "git status -sb"
alias ga  "git add"
alias gb "git branch"
alias gc  "git commit"
alias gcm "git commit -m"
alias gd  "git diff"
alias gco "git checkout"

# Colors
set fish_color_cwd 268bd2
set fish_color_error ff8a00
set -x LS_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

#set -g c0 (set_color red)
#set -g c0 (set_color 005284)
#set -g c1 (set_color 0075cd)
#set -g c2 (set_color 009eff)
#set -g c3 (set_color 6dc7ff)
#set -g c4 (set_color ffffff)
#set -g ce (set_color $fish_color_error)

# Greeting
function fish_greeting
  #echo "$ce$USER$c2@$c4"(uname -n)$c2" - $c0"(uptime)" $c3~~~ ><(((º>"
  calendar | grep (date "+%b %d")
end
function fish_title
  echo "fish @ "(pwd)
end


# Allow fish to print out unicode characters
set -x LANG en_US.UTF-8

# Editor config
#set -U EDITOR vim
set -x ATOM_NODE_URL http://gh-contractor-zcbenz.s3.amazonaws.com/atom-shell/dist

# Terminal config
#set -x TERM xterm-256color

# Path
set -x PATH $PATH /sbin
set -x PATH $PATH /home/ocalinde/work/git/newbiz
set -x PATH $PATH /usr/sbin
set -x PATH $PATH /home/ocalinde/.npm-packages/bin

# Go
set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH /home/ocalinde/go/bin
set -x GOPATH /home/ocalinde/go

# Android
set -x ANDROID_HOME ~/Android/Sdk

# Proxy
set -x http_proxy http://wwwproxy.se.axis.com:3128
set -x https_proxy http://wwwproxy.se.axis.com:3128

# Rust
set -x PATH $PATH $HOME/.cargo/bin
set -x RUST_SRC_PATH="(rustc --print sysroot)/lib/rustlib/src/rust/src"

# $HOME/.local/bin
set -x PATH $PATH $HOME/.local/bin
