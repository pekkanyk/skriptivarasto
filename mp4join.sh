#!/bin/bash
for name in "$@"; do
echo file \'"$name".temp.ts\' >> files.txt
ffmpeg -i "$name" -c copy -bsf:v h264_mp4toannexb -f mpegts "$name".temp.ts
done
ffmpeg -f concat -i files.txt -c copy -bsf:a aac_adtstoasc "$1".combined.MP4
touch "$1".combined.MP4 -r "$1"
rm *.temp.ts
rm files.txt
