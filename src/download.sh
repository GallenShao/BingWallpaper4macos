#!/bin/sh

IMAGE_URL_SUFFIX=$(curl https://cn.bing.com 2>/dev/null | grep -Eo '<link id="bgLink" rel="preload" href=".*?" as="image" />' | cut -d"\"" -f 6 | sed -e "s/\&amp;/\&/g")
if [ -z $IMAGE_URL_SUFFIX ]
then
	echo "[$(date)] Download Failed!"
	exit
fi

IMAGE_URL=https://cn.bing.com$IMAGE_URL_SUFFIX

chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890
FILE_NAME=.png
for i in {1..8} ; do
    FILE_NAME="${chars:RANDOM%${#chars}:1}"$FILE_NAME
done

curl $IMAGE_URL 2>/dev/null > tmp/$FILE_NAME
echo "[$(date)] Download Success!"