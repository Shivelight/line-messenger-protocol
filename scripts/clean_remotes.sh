#!/bin/bash
DIST_OUT=../dist/gen-go/LineThrift
PATTERN="*remote"

find $DIST_OUT -name $PATTERN -prune -exec bash -c "echo {} && rm -r {}" \;

