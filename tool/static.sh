#!/usr/bin/zsh

# package_name=""
package_name=$1

if [[ $1 == "" ]]; then
    exit
fi

minecraft_path=/home/wkyuu/cargo/game/minecraft
statics_path=$minecraft_path/tool/static
target_path=$minecraft_path/server/$package_name

ln -s $statics_path/* $target_path