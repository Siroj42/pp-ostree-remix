#!/bin/bash

cp ./.fedora-iot-spec/* .tmp/
cp ./custom/* .tmp/

cat "./.fedora-iot-spec/treecompose-post.sh" "./custom/treecompose-post.sh" > ".tmp/treecompose-post.merged.sh"
chmod +x ".tmp/treecompose-post.merged.sh"

sudo rpm-ostree compose tree --unified-core --cachedir=".cache" --repo=".build-repo" ".tmp/treefile.json"
