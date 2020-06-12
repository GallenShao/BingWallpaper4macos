#!/usr/bin/env python3

import re
import urllib.request
import time

def get_bing_bg():
    url = 'https://cn.bing.com'
    r = urllib.request.urlopen(url)
    result = r.read().decode('utf-8')

    pattern = '<link id="bgLink" rel="preload" href="(.*?)" as="image" />'
    match = re.findall(pattern, result)
    if len(match) == 0:
        return None

    return url + match[0].replace('&amp;', '&')


def download_image(url, target):
    urllib.request.urlretrieve(url, target)


if __name__ == '__main__':
    image_url = get_bing_bg()
    target = 'tmp/bing_image.png'
    if image_url is not None:
        download_image(image_url, target)
        print('[%s] Download Success!' % time.asctime(time.localtime(time.time())))
    else:
        print('[%s] Download Failed!' % time.asctime(time.localtime(time.time())))

