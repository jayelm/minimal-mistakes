#!/bin/bash

set -e

JEKYLL_ENV=production jekyll build

cp cv.pdf _site/

cd _site
rm -f site.zip

zip -r site.zip *
scp site.zip jacob:~/www/

ssh -t jacob 'cd ~/www/ && unzip -o site.zip && rm site.zip && rm update.sh'

cd ..
