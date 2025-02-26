function __fish_cse_no_args
    set -l cmd_len (commandline -cp | string split -n ' ' | count)
    test $cmd_len = 1 -o \( $cmd_len = 2 -a (commandline -cp | string sub -s -1) != ' ' \)
end

set -l not_seen "__fish_cse_no_args"
complete -c cse -n $not_seen -a 'help' -d 'Show help' -f
complete -c cse -n $not_seen -a 'local' -d 'Print local directory' -f
complete -c cse -n $not_seen -a 'remote' -d 'Print remote directory' -f
complete -c cse -n $not_seen -a 'pull' -d 'Pull changes from remote to local' -f
complete -c cse -n $not_seen -a 'push' -d 'Push changes from local to remote' -f
