#!/bin/bash
## this script is used by jenkins to update the django-maploom project after building latest maploom
# exit if anything returns failure
set -e

pwd

git checkout master

# path to the maploom build that will be used
MAPLOOM_PATH=../../maploom/lastSuccessful/archive

# get the new index.html file and use it to make the partial
sed -n '/body>/,/body>/p' $MAPLOOM_PATH/bin/index.html > index_body.html
sed '/body>/d' ./index_body.html > index_body_no_tag.html
echo '{% load staticfiles i18n %}{% verbatim %}' > _maploom_map.html
cat index_body_no_tag.html >> _maploom_map.html
echo '{% endverbatim %}' >> _maploom_map.html
rm index_body.html
rm index_body_no_tag.html

# remove data we will overwrite shortly
rm -r maploom/static/maploom/assets
rm -r maploom/static/maploom/fonts
rm maploom/templates/maploom/_maploom_map.html

#copy the new fonts assets
cp -r $MAPLOOM_PATH/bin/assets maploom/static/maploom/
cp -r $MAPLOOM_PATH/bin/fonts maploom/static/maploom/
mv _maploom_map.html maploom/templates/maploom

# get the commit id of the last commit of the maploom repo and the current date-time to build 
# a version number which we can set in setup.py
VER_DATE=`date +%Y-%m-%d.%H:%M:%S`
pushd .
cd ../../maploom/workspace
VER_SHA1=`git log --format="%H" | head -n1 | cut -c 1-10`
popd
VER=$VER_DATE.$VER_SHA1
sed -i "s|^    version=.*|    version='0.0.1@"$VER_DATE.$VER_SHA1"',|" ./setup.py

# if git status doesn't have 'nothing' (to commit) in it, go ahead and commit
if [[ $(git status) != *nothing* ]]; then
  git add .
  git commit -m "jenkins job django-maploom: use latest maploom to build maploom django wrapper."
  git push origin master
fi
