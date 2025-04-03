#!/usr/bin/zsh

init_name="S3iUqaO7iUwlzKu" # 不要改这个
package_name=""
action=""

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case "$1" in
        --package_name)
            package_name="$2"
            shift 2 # 移过参数名和参数值
            ;;
        --action)
            action="$2"
            shift 2 # 移过参数名和参数值
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# 替换文件内容的函数
replace_contents() {
    target_dir=$1
    init_name=$2
    package_name=$3
    find $target_dir -type f -exec sed -i "s/$init_name/$package_name/g" {} +
}

# 根据action执行相应操作
if [ "$action" = "show" ]; then
    echo "cp -r /home/games/minecraft/tools/init/* /home/games/minecraft/servers/$package_name"
    echo "cd /home/games/minecraft/servers/$package_name"
    echo "find . -name \"*$init_name*\" -exec rename 's/$init_name/$package_name/' {} +"
    echo "find /home/games/minecraft/servers/$package_name -type f -name \"*.txt\" -exec sed 's/$init_name/$package_name/g' {} +"
    exit
elif [ "$action" = "run" ]; then
    target_dir=/home/games/minecraft/servers/$package_name
    if [ ! -d "$target_dir" ]; then
        mkdir -p $target_dir
    fi
    cp -r /home/games/minecraft/tools/init/* $target_dir
    cd $target_dir
    find . -name "*$init_name*" -exec rename "s/$init_name/$package_name/" {} +
    replace_contents "$target_dir" "$init_name" "$package_name"
    exec /home/games/minecraft/tools/statics.sh $package_name
else
    echo "Usage: ./init.sh --package_name a_minecraft_server --action [show/run]"
    exit
fi