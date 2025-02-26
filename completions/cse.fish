# Disable file completions
complete -c cse -f

# Subcommands
set -l not_seen "not __fish_seen_subcommand_from help local remote pull push"
complete -c cse -n $not_seen -a 'help' -d 'Show help'
complete -c cse -n $not_seen -a 'local' -d 'Print local directory'
complete -c cse -n $not_seen -a 'remote' -d 'Print remote directory'
complete -c cse -n $not_seen -a 'pull' -d 'Pull changes from remote to local'
complete -c cse -n $not_seen -a 'push' -d 'Push changes from local to remote'
