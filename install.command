#!/bin/sh

SRC_PATH=$(cd "$(dirname "$0")";pwd)/src

cd $SRC_PATH

[ -d tmp ] || mkdir tmp

SRC_PATH_ENCODED=${SRC_PATH//\//\\\/}

echo "正在生成配置文件..."
sed -e "s/{DIR}/${SRC_PATH_ENCODED}/g" wallpaper.command.template > wallpaper.command
sed -e "s/{DIR}/${SRC_PATH_ENCODED}/g" io.github.gallenshao.bingbg.plist.template > ~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist
chmod +x wallpaper.command

echo "正在创建定时任务..."
launchctl load -w ~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist
launchctl start ~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist
echo "定时任务启动成功"

echo "正在尝试第一次修改壁纸，请在弹窗中选择允许"
./wallpaper.command