#!/usr/bin/bash
# PATCH_FILES CAN BE TAKEN FROM HERE https://github.com/AdamUOF/UOFLauncher/blob/master/UOFLauncher/Classes/Constants.cs
PATCH_FILES="https://www.uoforever.com/patches/UOPTREEHACK/Updates.xml https://www.uoforever.com/patches/UOP/Updates.xml"
if [ $# -eq 1 ]
then
    UO_PATH=$(realpath $1)
else
   echo "Your spell fizeles. provide --path parameter"
   exit 1
fi


if [ ! -d $UO_PATH ]
then
    echo -n "$UO_PATH does not exist, are you sure you want to continue y/n?"
    read answer
    if [ $answer != "y" ]
    then
        echo "you see a dragon and get scared, instalation into $answer abborted"
    fi
else
    echo "Kal Vas Flam: installing patch into $UO_PATH"
fi
if [ ! -d $UO_PATH/tmp_patch_dir ]
then
    echo "Kal Por Ylem: you create $UO_PATH/tmp_patch_dir dir"
    mkdir "$UO_PATH/tmp_patch_dir"
fi

if [ ! -d "$UO_PATH/tmp_patch_dir/files" ]
then
    echo "Kal Por Ylem: you create $UO_PATH/tmp_patch_dir/files dir"
    mkdir "$UO_PATH/tmp_patch_dir/files"
fi
if [ ! -d "$UO_PATH/tmp_backup" ]
then
    echo "Kal Por Ylem: you create a backup file  $UO_PATH/tmp_backup dir"
    mkdir "$UO_PATH/tmp_backup"
fi

pushd "$UO_PATH/tmp_patch_dir"
for file in $(curl $PATCH_FILES 2>/dev/null | egrep -o 'https?://www.uoforever.com/patches/.*.zip' | sort | uniq)
do
    echo "Kal Xen: downloading $file"
    curl -O $file 2>/dev/null
    filename=$(echo $file | egrep -o "[0-9,a-z,A-Z]+.zip")
    unzip -o $filename -d files/
done

for file in $(ls -1 $UO_PATH/tmp_patch_dir/files)
do
    echo "backing up $UO_PATH/$file to $UO_PATH/tmp_patch_dir/files/backup"
    if [ -f $UO_PATH/$file ]
    then
        cp $UO_PATH/$file $UO_PATH/tmp_backup/
    fi
    echo "patching $UO_PATH/$file with $UO_PATH/tmp_patch_dir/files/$file"
    cp $UO_PATH/tmp_patch_dir/files/$file $UO_PATH/$file
done
