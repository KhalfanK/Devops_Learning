#!/bin/bash

# This script demonstrates file creation and permission checking in Bash.

mkdir -p . bash_demo
cd bash_demo

echo "demo_txt: This file was created by a Bash script on $(date)." > demo.txt
cat demo.txt