#!/bin/env bash
#
pid_file="$HOME/.config/scripts/wt_wallpaper.pid"

[ ! -f ] && echo "Pid file not found : ${pid_file}" && exit 1
echo "pid file : ${pid_file}"
pid=$(cat "${pid_file}")
echo "pid : ${pid}"
if [[ -z  "$(ps aux | grep -e "${pid}.*sleep")" ]];then
    echo "Somethings fishy..."
    echo "Please check for the process with pid ${pid}"
    ps aux | grep ${pid}
    exit
else
    echo "Everythings looks good"
fi
echo "killing process with pid ${pid}"
kill -9 ${pid}
echo "Killed process with pid ${pid}"
