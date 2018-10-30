#!/bin/bash

policy="$(ls -1 /etc/ImageMagick-*/policy.xml | head -n1)"
if [ ! -f $policy ]; then
    echo "policy.xml not found!"
    exit 1
fi

line="$(grep -n '<policy domain="coder" rights="none" pattern="PDF" />' $policy)"

if [ ! -z "$line" ]; then
    n="$(echo $line | cut -f1 -d:)"
    sed -i "${n}s/rights=\"none\"/rights=\"read\|write\"/" $policy
fi
