#!/bin/bash
for name in "$@"; do
ffmpeg -y -i "$name" -c:v libx265 -b:v 2048k -x265-params pass=1 -an -f mp4 /dev/null && \
ffmpeg -i "$name" -c:v libx265 -b:v 2048k -x265-params pass=2 -an "$name.reEncoded.mkv"
touch "$name.reEncoded.mkv" -r "$name"
rm x265_2pass.log
rm x265_2pass.log.cutree
done
