# Split image

these scripts can be used as extension for gThumb image viewer
for spliting the image into two halves, and convert them to grayscale.
I am using this to convert my pdf notes to kindle friendly dimensions.

### split.sh
splits all images in a path
Usage: ./split.sh path/

### split_file.sh
split selected images
Usage: split.sh path/ filename.jpg


### gThumb Parameters

Tools->Personalize->new

split.sh
```
    bash /path/to/split.sh %P
    terminal command                - yes
    execute command for every file  - no
    wait for command to finish      - yes
```

split_file.sh
```
    bash /path/to/split_file.sh %P %N%E
    terminal command                - yes
    execute command for every file  - yes
    wait for command to finish      - yes
```
