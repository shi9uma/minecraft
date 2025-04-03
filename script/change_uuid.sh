#!/bin/bash

root_dir="/home/games/minecraft/servers"
package_dir="master-blacksmith"
work_dir="$root_dir/$package_dir/world"

old_uuid="1ceb5460-dfbe-39e0-a834-9474a060fb7e"
new_uuid=""

find $work_dir \
    -depth \
    -name "*$old_uuid*" \
    -execdir rename "s/$old_uuid/$new_uuid/" "{}" \;

find $work_dir \
    -type f \
    -exec grep -l "$old_uuid" {} \; | while read -r file
do
  sed -i "s/$old_uuid/$new_uuid/g" "$file"
done