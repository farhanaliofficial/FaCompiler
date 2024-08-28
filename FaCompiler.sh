#!/bin/bash

# 
# MIT License
# 
# Copyright (c) 2024 Farhan Ali
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
# 
#           /\_/\  
#          ( o.o )   Feed me ⭐ on GitHub!
#           > ^ <
# 
#
# FaCompiler - A Python Compilation and Optimization Tool
# Author: Farhan Ali
# GitHub: https://github.com/farhanaliofficial
# License: MIT License

# This script compiles Python files into optimized executables using Cython, GCC, and UPX.

# Usage: 
#   FaCompiler <input_file.py> -o <output_file>
#   --version: Display version information.
#   --help: Display this help message.

if [[ "$#" -eq 0 ]]; then
    echo "Usage: FaCompiler <input_file.py> -o <output_file>"
    exit 1
fi

if [[ "$1" == "--help" ]]; then
    echo "Usage: FaCompiler <input_file.py> -o <output_file>"
    echo "--version: Display version information."
    echo "--help: Display this help message."
    echo "Author: Farhan Ali (https://github.com/farhanaliofficial)"
    exit 0
fi

if [[ "$1" == "--version" ]]; then
    echo "FaCompiler version 1.0"
    exit 0
fi

input_file=""
output_file=""

while [[ $# -gt 0 ]]; do
    case $1 in
        *.py)
            input_file=$1
            ;;
        -o)
            output_file=$2
            shift
            ;;
    esac
    shift
done

if [[ -z $input_file ]]; then
    echo "Usage: FaCompiler <input_file.py> -o <output_file>"
    exit 1
fi

if [[ -z $output_file ]]; then
    output_file="${input_file%.py}"
fi


python_version=$(python3 --version | awk '{print $2}')
python_include_path=$(python3 -c "from sysconfig import get_paths as gp; print(gp()['include'])")

echo "Running cython..."
cython_output=$(cython -3 "$input_file" --embed 2>&1)
if [[ $? -ne 0 ]]; then
    echo "Error: Cython failed."
    echo "$cython_output" >&2
    exit 1
fi

echo "Compiling with gcc..."
gcc_output=$(gcc -O3 -I"$python_include_path" -lpython${python_version%.*} -ldl -lpthread -lm "${input_file%.*}.c" -o "$output_file" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "Error: GCC compilation failed."
    echo "$gcc_output" >&2
    exit 1
fi

echo "Compressing with upx..."
upx_output=$(upx -9 "$output_file" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "Error: UPX compression failed."
    echo "$upx_output" >&2
    exit 1
fi

echo "FaCompiler completed successfully!"
