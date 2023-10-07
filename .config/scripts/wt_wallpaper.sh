#!/bin/env bash

interval=$1
[ -z "$1" ] && interval=5m

SETTINGS_DIR='C:\Users\Prashanth T P\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState'
SETTINGS_JSON="settings.json"

wallpapers=(
"D:/wallpapers/minimalistic/Pinterest/batman-01-v3.png"
"D:/wallpapers/minimalistic/Samurai/MinimalWallpaper_Samurai_07.png"
"D:/wallpapers/minimalistic/Pinterest/naruto-v2.png"
"D:/wallpapers/minimalistic/Pinterest/starlord-v2.png"
)
for wallpaper in "${wallpapers[@]}";do
    python D:/Studies/Programming/LearnPython/wt-util/wt-util.py --settings="${SETTINGS_DIR}/${SETTINGS_JSON}"\
        --profile="GitBash" \
        --key="backgroundImage"\
        --value="${wallpaper}" &> ~/.config/scripts/wt_wallpaper_stdouterr.txt
    sleep ${interval}
done

