#!/bin/bash
mkdir frames
ffmpeg -i $1 -r 50 'frames/frame-%03d.jpg'
cd frames
convert -delay 20 -loop 0 *.jpg $1.gif
mv $1.gif ../
cd ..
rm frames/*.jpg
echo 'This will leave an empty frames folder in your current directory.'
