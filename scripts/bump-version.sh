#!/bin/bash
VERSION=${1:?}
git grep -l 0.1.8 | xargs sed -i "" -e "s/0.1.8/$VERSION/g"
