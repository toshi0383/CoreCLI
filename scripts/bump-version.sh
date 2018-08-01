#!/bin/bash
VERSION=${1:?}
git grep -l 0.1.9 | xargs sed -i "" -e "s/0.1.9/$VERSION/g"
