#!/usr/bin/env python3

import os
import sys

current_file = os.path.join(os.getcwd(), sys.argv[0])
path = '/'.join(current_file.split('/')[:-1]) + '/src'
os.chdir(path)
path = os.getcwd()

python3_path = os.popen('which python3').read().strip()


def generate_file(src, dst):

	i = open(src, 'r')
	o = open(dst, 'w')

	content = i.read()
	content = content.replace('{DIR}', path)
	content = content.replace('{PYTHON}', python3_path)
	o.write(content)

	i.close()
	o.close()


plist_path = os.path.expanduser('~/Library/LaunchAgents/io.github.gallenshao.bingbg.plist')
exec_file_path = path + '/wallpaper.command'

print('正在生成配置文件...')
generate_file(path + '/io.github.gallenshao.bingbg.plist.template', plist_path)
generate_file(path + '/wallpaper.command.template', exec_file_path)

os.system('chmod +x %s' % exec_file_path)

print('正在创建定时任务...')
os.system('launchctl load -w "%s"' % plist_path)
os.system('launchctl start "%s"' % plist_path)

print('启动成功')