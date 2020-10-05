#!/bin/bash
NAME=$1
CATEGORY=$2

DATE=$(date "+%Y-%m-%d")
SAMPLE_POST="_posts/2020-10-04-bpf-1.md"

NEW_POST="_posts/$DATE-$NAME.md"

cp $SAMPLE_POST $NEW_POST
mkdir "assets/$NAME" || true

sed -i .bak -e "s/date: .*$/date: $DATE/" $NEW_POST  
sed -i .bak -e "s/category: .*$/category: $CATEGORY/" $NEW_POST
rm _posts/*.bak || true
