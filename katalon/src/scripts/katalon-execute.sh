#!/usr/bin/env bash

set -e

echo "Starting Katalon Studio"

current_dir=$(pwd)

if [[ -v DOCKER_PROXY_ALIAS ]]; then
  # add proxy alias to docker host entry in hosts file
  echo "$(/sbin/ip route|awk '/default/ { print $3 }') $DOCKER_PROXY_ALIAS" >> /etc/hosts
fi

# create tmp directory
tmp_dir=$KATALON_KATALON_ROOT_DIR/tmp
mkdir -p $tmp_dir
chmod -R 777 $tmp_dir

# project source code
project_dir=$KATALON_KATALON_ROOT_DIR/project
mkdir -p $project_dir
cp -r $KATALON_KATALON_ROOT_DIR/source/. $project_dir
# create .classpath if not exist
touch $project_dir/.classpath || exit
chmod -R 777 $project_dir

katalon_opts='-browserType="$BROWSER_TYPE" -retry=0 -statusDelay=15 -testSuitePath="$TEST_SUITE_PATH"'

# build command line
project_file=$(find $project_dir -maxdepth 1 -type f -name "*.prj")
cmd="$KATALON_KATALON_INSTALL_DIR/katalon -runMode=console -consoleLog -projectPath=$project_file $katalon_opts"

$KATALON_BASE_ROOT_DIR/scripts/xvfb.sh start
cd $tmp_dir
eval "$cmd"

cd $current_dir

echo "PASSED"
