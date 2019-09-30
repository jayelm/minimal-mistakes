#!/bin/bash

JEKYLL_ENV=production jekyll build

cd _site
rm site.zip

zip -r site.zip *
scp site.zip jacob:~/www/

ssh -t jacob 'cd ~/www/ && unzip -o site.zip && rm site.zip'

cd ..
