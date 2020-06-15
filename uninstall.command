#!/bin/sh

SRC_PATH=$(cd "$(dirname "$0")";pwd)/src

echo "正在取消定时任务..."
launchctl stop ~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist
launchctl unload -w ~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist

echo "正在删除临时文件..."
rm ~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist
rm ${SRC_PATH}/wallpaper.command

echo "卸载成功"