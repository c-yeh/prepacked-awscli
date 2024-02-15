#!/bin/bash

platform=${platform:-win_amd64}
pyver=${pyver:-3.10}
tmp_dir=packed-awscli_${platform}_py${pyver}

pip download -d $tmp_dir awscli \
    --platform $platform --only-binary=:all: \
    --python-version $pyver
zip -r $tmp_dir.zip $tmp_dir

rm -rf $tmp_dir