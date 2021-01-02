#!/bin/bash

ZIP_RNNOISE_SOURCE="rnnoise_master_20.11.2020.zip"

if [ ! -f $ZIP_RNNOISE_SOURCE ]; then
    echo -e "\n[E] Archive ${ZIP_RNNOISE_SOURCE} not found\n"
    exit 1
fi

unzip $ZIP_RNNOISE_SOURCE
cd rnnoise-master
./autogen.sh
./configure
make
cd -
mkdir -p rnnoise_wrapper/libs

rm -rf rnnoise-master/.libs/*
mv rnnoise-master/.libs/lib* rnnoise_wrapper/libs/*
rm -rf rnnoise-master

echo -e "\n'librnnoise' has been successfully moved to 'rnnoise_wrapper/libs/librnnoise'"
