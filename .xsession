# Start git server
#sudo -u git /home/git/daemon.sh

xset led 3

# Clipboard sync
if [ -x /usr/bin/autocutsel ]; then 
    #this will keep the clipboard in sync 
    #   with the primary buffer 
    autocutsel -selection CLIPBOARD -fork
    #this will keep the primary in sync 
    #   with the clipboard buffer 
    autocutsel -selection PRIMARY -fork 
fi


