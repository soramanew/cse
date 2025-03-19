#!/bin/fish

set -q XDG_CONFIG_HOME && set -l config $XDG_CONFIG_HOME || set -l config $HOME/.config
set -l src (dirname (realpath (status filename)))

mkdir -p $HOME/.local/bin
mkdir -p $config/fish/completions

ln -sf $src/cse $HOME/.local/bin/cse
cp $src/completions/cse.fish $config/fish/completions/cse.fish
