#!/usr/bin/env bash

modified_files=`git diff --cached --name-only | grep .png`
current_dir=`pwd`
echo $modified_files
if [ -z "$modified_files" ];then
  exit 0
else
  for i in ${modified_files}; do optipng -o7 -quiet  ${i}; done
fi

