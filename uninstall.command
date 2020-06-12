#!/usr/bin/env python3

import os
import sys

current_file = os.path.join(os.getcwd(), sys.argv[0])
path = '/'.join(current_file.split('/')[:-1]) + '/src'

plist_path = os.path.expanduser('~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist')

print('正在取消定时任务...')
os.system('launchctl stop "%s"' % plist_path)
os.system('launchctl unload -w "%s"' % plist_path)

print('正在删除临时文件...')
os.remove(plist_path)
os.remove(path + '/wallpaper.command')

print('卸载成功')