complete -c swww -n "__fish_use_subcommand" -s h -l help -d 'Print help information (use `--help` for more detail)'
complete -c swww -n "__fish_use_subcommand" -s V -l version -d 'Print version information'
complete -c swww -n "__fish_use_subcommand" -f -a "clear" -d 'Fills the specified outputs with the given color'
complete -c swww -n "__fish_use_subcommand" -f -a "img" -d 'Send an image (or animated gif) for the daemon to display'
complete -c swww -n "__fish_use_subcommand" -f -a "init" -d 'Initialize the daemon'
complete -c swww -n "__fish_use_subcommand" -f -a "kill" -d 'Kills the daemon'
complete -c swww -n "__fish_use_subcommand" -f -a "query" -d 'Asks the daemon to print output information (names and dimensions)'
complete -c swww -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c swww -n "__fish_seen_subcommand_from clear" -s o -l outputs -d 'Comma separated list of outputs to display the image at' -r
complete -c swww -n "__fish_seen_subcommand_from clear" -s h -l help -d 'Print help information (use `--help` for more detail)'
complete -c swww -n "__fish_seen_subcommand_from img" -s o -l outputs -d 'Comma separated list of outputs to display the image at' -r
complete -c swww -n "__fish_seen_subcommand_from img" -s f -l filter -d 'Filter to use when scaling images (run swww img --help to see options)' -r
complete -c swww -n "__fish_seen_subcommand_from img" -s t -l transition-type -d 'Sets the type of transition. Default is \'simple\', that fades into the new image' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-step -d 'How fast the transition approaches the new image' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-duration -d 'How long the transition takes to complete in seconds' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-fps -d 'Frame rate for the transition effect' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-angle -d 'This is only used for the \'wipe\' transition. It controls the angle of the wipe (default is \'0\')' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-pos -d 'This is only used for the \'grow\',\'outer\' transitions. It controls the center of circle (default is \'center\')' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-bezier -d 'bezier curve to use for the transition https://cubic-bezier.com is a good website to get these values from' -r
complete -c swww -n "__fish_seen_subcommand_from img" -s h -l help -d 'Print help information (use `--help` for more detail)'
complete -c swww -n "__fish_seen_subcommand_from init" -l no-daemon -d 'Don\'t fork the daemon. This will keep it running in the current terminal'
complete -c swww -n "__fish_seen_subcommand_from init" -s h -l help -d 'Print help information (use `--help` for more detail)'
complete -c swww -n "__fish_seen_subcommand_from kill" -s h -l help -d 'Print help information'
complete -c swww -n "__fish_seen_subcommand_from query" -s h -l help -d 'Print help information (use `--help` for more detail)'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "clear" -d 'Fills the specified outputs with the given color'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "img" -d 'Send an image (or animated gif) for the daemon to display'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "init" -d 'Initialize the daemon'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "kill" -d 'Kills the daemon'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "query" -d 'Asks the daemon to print output information (names and dimensions)'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
