#!/bin/bash
for name in "$@"; do
ffmpeg -i "$name" -c:v libx265 -preset ultrafast -x265-params crf=22:qcomp=0.8:aq_strength=1.0:qg-size=16:psy-rd=0.7:psy-rdoq=5.0:rdoq-level=1:merange=44 "$name.x265.mkv"
touch "$name.x265.mkv" -r "$name"
done
