#! /usr/bin/env bash

# Script to precompile the bits/stdc++.h header for performance reasons.
# Adapted from: https://github.com/dush1729/Speed-Up-GCC-Compile-Time

# Make sure to run the g++ command with the same options that you'd use to
# compile your program.

# Exit if the bits directory exists
if [[ -f 'bits/stdc++.h.gch' ]]; then
    echo 'Precompiled header already exists'
    exit 0
fi

# Find the header file's path
echo "Finding path to system's bits/stdc++.h ..."
tmp=$(g++ -std=c++14 -H templates/template.cpp 2>&1 | grep bits/stdc++.h)
fil=`echo $tmp | awk '{ print $NF }'`
echo "Path found: $fil"

# Copy to a local version and compile it
echo 'Precompiling bits/stdc++.h locally ...'
mkdir -p bits
cp $fil bits/.
g++ -std=c++14 bits/stdc++.h
rm -v a.out
echo 'Done'

if [[ "$?" == "0" ]]; then
    exit 0
else
    exit 1
fi
