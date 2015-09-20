# Set the greeting
# Command line utility aliases
alias t  "tree --dirsfirst"
alias ll "ls -alGh"
alias l "ls"
alias wtc 'curl -Ss http://whatthecommit.com/index.txt'

# Git aliases
alias gs  "git status -sb"
alias ga  "git add"
alias gb "git branch"
alias gc  "git commit"
alias gcm "git commit -m"
alias gd  "git diff"
alias gco "git checkout"

# Colors
set fish_color_error ff8a00

set -g c0 (set_color 005284)
set -g c1 (set_color 0075cd)
set -g c2 (set_color 009eff)
set -g c3 (set_color 6dc7ff)
set -g c4 (set_color ffffff)
set -g ce (set_color $fish_color_error)

# Greeting
function fish_greeting
  echo "$ce$USER$c2@$c4"(uname -n)$c2" - $c0"(uptime -p)" $c3~~~ ><(((º>"
  calendar | grep (date "+%b %d")
end
function fish_title
  echo "fish @ "(pwd)
end


# Allow fish to print out unicode characters
set -x LANG en_US.UTF-8

# Editor config
set -U EDITOR vim

# Path
set -x PATH $PATH /home/linde/.bin
set -x PATH $PATH /sbin
set -x PATH $PATH /home/linde/work/git/newbiz
set -x PATH $PATH /usr/sbin
set -x PATH $PATH /home/linde/.npm-packages/bin
set -x PATH $PATH /usr/share/atom/atom
