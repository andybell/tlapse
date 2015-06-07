# Create a directory and copy the original images there for manipulation:
# folder with source images should be parameter $1, output move $2

mkdir temp
cp $1/*.JPG temp/
# Resize the images:
mogrify -resize 800x800  temp/*.JPG
# Create the morph images
convert temp/*.JPG -delay 3 -morph 3 temp/%05d.jpg
# Stitch them together into a video
ffmpeg -r 50  -i temp/%05d.jpg $2
# rm temp folder
rm -R temp