#!/bin/bash
set -o pipefail

npm i

node express.js

wget -O s1.svg 'http://localhost:9000/api?username=ananthu-sk&theme=solarized-dark&show_icons=true&hide_border=true&count_private=true' &> /dev/null

wget -O s2.svg 'http://localhost:9000/api/top-langs/?username=ananthu-sk&theme=solarized-dark&show_icons=true&hide_border=true&layout=compact' &> /dev/null

brave s*.svg  

echo "update resume repository"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yYJj] ]] || exit 0

git clone git@github.com:ananthu-sk/ananthu-sk.git

mv s*.svg -t ananthu-sk/assets

cd ananthu-sk
