#!/usr/bin/bash

base="SGD"
symbols="MYR"

url=$(printf "http://api.fixer.io/latest?symbols=%s&base=%s" $symbols $base)

myr=$(curl -s $url | jq -r ".rates.MYR")

printf "%s1=%s%f\n" $base $symbols $myr
