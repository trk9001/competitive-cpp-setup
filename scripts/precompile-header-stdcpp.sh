#! /usr/bin/env bash

# Script to precompile the bits/stdc++.h header for performance reasons.
# Adapted from: https://github.com/dush1729/Speed-Up-GCC-Compile-Time

# Make sure to run the g++ command with the same options that you'd use to
# compile your program.

# Exit if the bits directory exists
[[ -d 'bits' ]] && exit 1

# Find the header file's path
tmp=$(g++ -std=c++14 -H templates/template.cpp 2>&1 | grep bits/stdc++.h)
fil=`echo $tmp | awk '{ print $NF }'`
echo $fil

# Copy to a local version and compile it
mkdir bits
pushd bits
cp $fil .
g++ -std=c++14 stdc++.h
popd

exit 0
