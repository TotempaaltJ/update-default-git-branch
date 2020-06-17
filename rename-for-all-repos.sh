#!/usr/bin/env bash

USER=$1
FROM=$2
TO=$3

NAMES=$(gh api "users/$USER/repos" | jq -r '.[] | .name')
for NAME in $NAMES; do
    ./rename-github-default-branch.sh $USER $NAME $FROM $TO
done
