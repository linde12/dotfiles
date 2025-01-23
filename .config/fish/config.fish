# Command line utility aliases
alias t  "tree --dirsfirst"
alias ll "eza -lah"
alias l "eza"
alias ls "eza"
alias cat "bat"
alias g "git"
alias gs "git status"
alias gb "git branch"
alias gch "git checkout"
alias gc "git commit"
alias gd "git diff"
alias gf "git fetch --all"
alias gl "git l"
alias pr "gh pr"
alias wtc 'curl -Ss http://whatthecommit.com/index.txt | xargs -0 git commit -m '
alias vim nvim

# Link binaries w/ stow to ~/.local/bin
function lnbin
  stow -t $HOME/.local/bin/ $argv;
end

# Upload file & copies URL to clipboard
function up
  set file $argv[1]
  set id $(uuidgen)
  ssh nasa mkdir -p ./www/papper/$id
  scp $file nasa:/home/www/papper/$id/$file
  set result "https://skithuset.sparvnet.website/papper/$id/$file"
  echo "Copied '$result' to clipboard"
  echo $result | tr -d '\n' | wl-copy
end

function pkgsync
  pacman -Qen | sed -r 's,(.*) .*,\1,g' > $HOME/pkgs
  pacman -Qem | sed -r 's,(.*) .*,\1,g' > $HOME/pkgs-extra
end

function pkgupdate
  cat $HOME/pkgs | grep "^[a-zA-Z0-9]" | xargs sudo xbps-install -Sy | grep -v "already installed"
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
  #calendar | grep (date "+%b %d")
end
function fish_title
  echo "fish @ "(pwd)
end

# Allow fish to print out unicode characters
set -x LANG en_US.UTF-8

# Editor config
set -U EDITOR nvim

# Rust bin
set -x PATH $PATH $HOME/.cargo/bin

# Node bin
# $HOME/.local/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.local/share/npm/bin

# XDG_USER_DIRS
set -x XDG_DATA_DIRS "/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:/home/linde/.local/share/flatpak/exports/share"

starship init fish | source
wal -Renq
