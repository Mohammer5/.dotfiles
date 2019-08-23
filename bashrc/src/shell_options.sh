#!/bin/bash

xhost +local:root > /dev/null 2>&1
complete -cf sudo
shopt -s expand_aliases
shopt -s histappend
