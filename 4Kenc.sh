#!/bin/bash
for name in "$@"; do
nice -n 19 ffmpeg -y -i "$name" -c:v libx265 -b:v 8192k -x265-params pass=1 -an -f mp4 /dev/null && \
nice -n 19 ffmpeg -i "$name" -c:v libx265 -b:v 8192k -x265-params pass=2 -an "$name.x265.mkv"
touch "$name.x265.mkv" -r "$name"
rm x265_2pass.log.cutree
rm x265_2pass.log
done
