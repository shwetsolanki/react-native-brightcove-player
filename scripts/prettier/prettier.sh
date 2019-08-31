#!/usr/bin/env bash

cmd="git ls-files | \
grep -E '\.(tsx|ts|graphql|java)$' | \
xargs prettier --config=.prettierrc"

if [ "$CI" = "true" ]
then cmd="$cmd --list-different"
else cmd="$cmd --write"
fi

echo ${cmd}
eval ${cmd}
