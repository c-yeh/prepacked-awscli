#!/bin/bash

platform=${platform:-win_amd64}
pyver=${pyver:-3.10}
tmp_dir=packed-awscli_${platform}_py${pyver}

platform_arg="--platform $platform"
if [ $platform == 'this' ]; then
    platform_arg=''
fi
python3 -m pip download -d $tmp_dir \
    git+https://github.com/aws/aws-cli.git@v2 \
    flit_core \
    $platform_arg --only-binary=:all: \
    --python-version $pyver \
&& zip -r $tmp_dir.zip $tmp_dir \
&& rm -rf $tmp_dir