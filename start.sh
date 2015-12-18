#!/bin/bash
myimage="busybox"

docker pull $myimage:latest
docker export $(docker create $myimage) > busybox.tar
mkdir rootfs
tar -C rootfs -xf $myimage.tar
rm -f $myimage.tar

sudo runc start
