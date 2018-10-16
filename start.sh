#!/usr/bin/env bash
set -x
export LD_LIBRARY_PATH=/home/vcap/deps/0/apt/usr/lib/x86_64-linux-gnu/mesa/:$LD_LIBRARY_PATH
# patch Xvfb to use /app/.. paths instead of hardcoded wrong values
sed -i.bak s/usr\\/bin/app\\/ubi/g /home/vcap/deps/0/bin/Xvfb
# create symlinks for Xvfb to use /app/. instead of hard coded values
ln -s /home/vcap/deps/0/bin /app/ubi

xvfb-run -e /dev/stdout npm start
