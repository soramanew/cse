# cse

This is a helper script for UNSW CSE students for working on their labs/assignments locally.
The script provides commands for syncing a local directory with a remote directory on
the CSE machines via `rsync`. It also provides an easy way to execute commands on the
remote machine through `ssh`.

## Installation

Dependencies:

-   [`fish`](https://fishshell.com/)
-   [`rsync`](https://rsync.samba.org/)
-   `ssh`

Clone this repo and run the `install.fish` script in the root of the repo.

`$HOME/.local/bin` must be in your path for the `cse` command to show up, otherwise you
need to put the path to the `cse` script (i.e. `<PATH/TO/REPO>/cse`) when executing it.

> [!NOTE]
> Includes completions for `fish`!

## Usage

On first usage, the script will ask for your zID and if you have not created a `ssh` key,
your CSE password. Your zID will be stored in `$XDG_CONFIG_HOME/cse/zid.txt` for future
runs.

```
$ cse help
Usage: cse [command]

Commands:
    help      Print this help message
    update    Update this script
    local     Print the local directory
    remote    Print the remote directory
    pull      Pull changes from the CSE server to the local machine
    push      Push changes from the local machine to the CSE server
    test      Autotest assignments against self-made test cases
    style     Check for style issues within a program

If no command is specified, SSH into the CSE server.
If an unrecognised command is specified, SSH into the CSE server and execute the command.
```

> [!TIP]
> The script can execute arbitrary commands on the remote machine.
> You can use this to run commands available only on the remote.
> e.g.
>
> ```
> cse 1511 autotest test.c
> ```
