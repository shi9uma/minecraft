#!/usr/bin/zsh

user_uuid="42707e75-d524-48ea-881c-8cf5ef92c658"
package_name="cisco_fantasy_medieval_rpg_ultimate"

fd_bin=/usr/bin/fdfind
src_dir=/home/games/minecraft/servers/$package_name/world
tmp_dir=/home/games/minecraft/tmp/$user_uuid

if [[ ! -d $tmp_dir ]]; then
    mkdir -p $tmp_dir
fi

cd $src_dir

while IFS= read -r file; do
    file=$(echo $file | tr -d '\n')
    relative_path=${file#$src_dir/}
    echo "Processing $relative_path"
    rsync -av --relative "$relative_path" "$tmp_dir"
done < <($fd_bin $user_uuid $src_dir)

# 恢复的话就是将 src_dir 和 tmp_dir 对换即可