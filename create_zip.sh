#!/bin/bash

platform=${1:-win_amd64}
tmp_dir=packed-awscli_$platform

pip download -d $tmp_dir awscli --platform $platform --only-binary=:all:
zip -r $tmp_dir.zip $tmp_dir

rm -rf $tmp_dir