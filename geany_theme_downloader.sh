#!/bin/bash

echo 'Geany Theme Downloader'

base_url='https://raw.githubusercontent.com/geany/geany-themes/master/colorschemes/'

dark_themes='zenburn vibrant tinge tango spyder-dark steampunk solarized-dark retro sleepy-pastel railcasts2 bespin monokai oblivion2 inkpot himbeere delt-dark kugel dark-colors darcula darkdark-fruit-salad black-scheme'
light_themes=' ubuntu tango-light solarized-light slush-and-poppies epislon fluffy gedit github metallic notepad-plus-plus pygments '


file_type='.conf'
folder=~/.config/geany/colorschemes/


color_schemes='Dark Mode\nLight Mode\nAll'
prompt='Which Color Scheme(s), You Prefer; to Download?'
scheme=$(echo -e "$color_schemes" | dmenu -i -p "$prompt")
themes=''

case "$scheme" in
'Dark Mode')themes=$dark_themes;;
'Light Mode')themes=$light_themes;;
'All')themes=$dark_themes$light_themes;;
esac

echo ''

echo -e 'Downloading, '"$scheme"' Themes...'

echo -e '\nYour Themes, will be Downloaded to.. '"$folder"'\n'

pushd "$folder"

for theme in $themes; do

filename=$theme$file_type

url=$base_url$filename

[ -f $filename  ] || $(axel -n 8 $url ) 2>/dev/null

done

popd

echo ''

echo -e '\nDone...\n'
