#!/usr/bin/env bash

export DEPLOY_BRANCH=${DEPLOY_BRANCH:-master}

if [ ! -z "$CIRCLE_PR_USERNAME" -o "$CIRCLE_PROJECT_USERNAME" != "amu-oss" -o "$CIRCLE_BRANCH" != "$DEPLOY_BRANCH" ]; then
    echo "This is $CIRCLE_PR_USERNAME building the PR $CIRCLE_PULL_REQUEST triggered by $CIRCLE_USERNAME"
    echo "We deploy site only for changes in master. So, let's skip this shall we ? :)"
    exit 0
fi

yarn add surge

export SURGE_LOGIN=amu-oss@gmail.com
./node_modules/.bin/surge --project ./dist --domain amu2ias.surge.sh
