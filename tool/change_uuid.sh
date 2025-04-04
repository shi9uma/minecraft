#!/bin/bash

root_dir="/home/wkyuu/cargo/games/minecraft/servers"
package_dir="earth3"
work_dir="$root_dir/$package_dir/world"

# old_uuid="bc65d34b-6cca-4f69-8a7a-28532ef0c4d2"
# new_uuid="f0a84fca-4c1c-4b3f-9029-e71b32ca0acb"

# old_uuid="7a9af1ec-dca9-4b84-b42d-ecfe2b482f45"
# new_uuid="53e3184f-f1f6-44ef-bdbe-1c6017963aa2"

old_uuid="53e3184f-f1f6-44ef-bdbe-1c6017963aa2"
new_uuid="7a9af1ec-dca9-4b84-b42d-ecfe2b482f45"

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