#!/bin/bash

if kak -l | grep -q '12345'; then
    kak -c 12345
else
    kak -s 12345
fi
