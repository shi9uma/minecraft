#!/usr/bin/zsh

# package_name=""
package_name=$1

minecraft_path=/home/games/minecraft
statics_path=$minecraft_path/tools/statics
target_path=$minecraft_path/servers/$package_name

ln -s $statics_path/* $target_path