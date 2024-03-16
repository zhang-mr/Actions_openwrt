#!/bin/bash

openwrt_dir=/home/zhang/workspace/openwrt

cd ${openwrt_dir}

git pull
if (( $? != 0 ))
then
    echo openwrt git pull error, return
    exit
fi
cd -

rm -rf ./overlay/*
mkdir -p ./overlay/include
mkdir -p ./overlay/target/linux/

cp -arf ${openwrt_dir}/include/kernel-6.1 ./overlay/include/
cp -arf ${openwrt_dir}/include/kernel-5.15 ./overlay/include/
cp -arf ${openwrt_dir}/target/linux/generic ./overlay/target/linux/
cp -arf ${openwrt_dir}/target/linux/ramips ./overlay/target/linux/

cd ./overlay

git add .
if (( $? != 0 ))
then
    echo git add error, retrun
    exit
fi

time=$(date "+%Y-%m-%d %H:%M:%S")
commit_mgs="update overlay at ${time}"
git commit -m "${commit_mgs}"
if (( $? != 0 ))
then
    echo git commit error
    git restore .
    exit
fi

git push
if (( $? != 0 ))
then
    echo git push error, git reset
    git reset --hard HAED
    exit
else 
    echo update overlay success.
fi

cd -
