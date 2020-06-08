#!/usr/bin/env bash
set -e

DIR=$1

cd $DIR
REMOTE=$(git remote get-url origin)
USER=$(echo $REMOTE | sed 's/.*github\.com[\/:]\([[:alnum:]-]\+\).*/\1/')
REPO=$(echo $REMOTE | sed 's/.*github\.com[\/:][[:alnum:]-]\+\/\([[:alnum:]-]\+\).*/\1/')

FROM=$2
TO=$(gh api "repos/$USER/$REPO" | jq -r '.default_branch')

set -x
git branch $FROM -m $TO
git branch $TO -u origin/$TO
cd -
