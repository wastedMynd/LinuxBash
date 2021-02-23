#!/bin/bash

echo 'Geany Theme Downloader'

base_url='https://raw.githubusercontent.com/geany/geany-themes/master/colorschemes/'

dark_themes='zenburn vibrant tinge tango spyder-dark steampunk solarized-dark retro sleepy-pastel railcasts2 bespin monokai oblivion2 inkpot himbeere delt-dark kugel dark-colors darcula darkdark-fruit-salad black-scheme'
light_themes=' ubuntu tango-light solarized-light slush-and-poppies epislon fluffy gedit github metallic notepad-plus-plus pygments '
themes=$dark_themes$light_themes

file_type='.conf'
folder=~/.config/geany/colorschemes/

echo ''

echo 'Downloading themes...'

echo ''

pushd ~/.config/geany/colorschemes

for theme in $themes; do

filename=$theme$file_type

url=$base_url$filename

[ -f $filename 2>/dev/null ] || $(axel -n 8 $url  2>/dev/null) 2>/dev/null

done

popd

echo ''

echo 'done...'
