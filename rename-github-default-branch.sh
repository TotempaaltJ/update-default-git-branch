#!/usr/bin/env bash
set -e

USER=$1
REPO=$2

FROM=$3
TO=$4

CURRENT_STATE=$(gh api "repos/$USER/$REPO")
NAME=$(echo $CURRENT_STATE | jq -r '.name')
CURRENT_DEFAULT=$(echo $CURRENT_STATE | jq -r '.default_branch')

if [[ "$CURRENT_DEFAULT" != "$FROM" ]]; then
    echo "Current default branch for $USER/$REPO is $CURRENT_DEFAULT, not $FROM"
    exit 1
fi

SHA=$(gh api "repos/$USER/$REPO/git/ref/heads/$FROM" | jq -r '.object.sha')

set -ex
gh api "repos/$USER/$REPO/git/refs" -F ref="refs/heads/$TO" -F sha="$SHA"
gh api "repos/$USER/$REPO" -F name=$NAME -F default_branch=$TO
gh api -X DELETE "repos/$USER/$REPO/git/refs/heads/$FROM"
