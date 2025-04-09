#!/usr/bin/env bash

# First load the default .bashrc if exists
if [ -f /etc/skel/.bashrc ]; then
    . /etc/skel/.bashrc
fi

# Recursively search for this script's path (handling symbolic links...)
source=${BASH_SOURCE[0]}
while [ -L "$source" ]; do # resolve $source until the file is no longer a symlink
    dir=$( cd -P "$( dirname "$source" )" >/dev/null 2>&1 && pwd )
    source=$(readlink "$source")
    [[ $source != /* ]] && source=$dir/$source # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
toplevel_path=$( cd -P "$( dirname "$source" )" >/dev/null 2>&1 && pwd )

# Add the /bin to the PATH if exists
if [ -d "$toplevel_path/bin" ]; then
    export PATH="$PATH:$toplevel_path/bin"
fi

# Import all the individual bashrc files
# shellcheck disable=SC1090
for bashrc_script in "$toplevel_path"/bashrc.d/*; do
    if [ -f "$bashrc_script" ]; then
        . "$bashrc_script"
    fi
done
