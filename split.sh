#!/bin/bash
if [  $# != 1 ]
then
    echo -e "\nUsage:\n$0 /path/to/photos/ \n"
    exit 1
fi
dir=$1
cd $dir
mkdir -p split
for f in ./*.jpg; do
    filename=${f##*/}
    name=${filename%.*}
    width=$(convert $f -print "%w" /dev/null)
    height=$(convert $f -print "%h" /dev/null)
    crop_width=$(echo "$width/2+($width*0.01)" | bc)
    padding_width=$(echo "$width-$crop_width" | bc)
    crop_width=$(printf "%.0f" $crop_width)
    padding_width=$(printf "%.0f" $padding_width)
    #echo $padding_width
    #echo $crop_width
    #echo $height
    #echo "$crop_width"x$height+0+0
    convert -crop "$crop_width"x$height+0+0 $f ./split/"$name"_1.jpg
    convert -crop "$crop_width"x$height+$padding_width+0 $f ./split/"$name"_2.jpg
done
for f in ./split/*.jpg; do
    #mogrify -colorspace Gray $f
    #mogrify  -separate -average $f
    mogrify -modulate 100,0 $f
done
