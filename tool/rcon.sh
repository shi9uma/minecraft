#!/usr/bin/zsh

work_dir=$(dirname $0)
venv_activate="$work_dir/venv/bin/activate"

source $venv_activate

if [ "$#" -eq 0 ]; then
	cmd="list"
else
	cmd="$1"
fi

python "$work_dir/rcon.py" "$cmd"
