#!/bin/bash

(grep 'cpu ' /proc/stat;sleep 0.1;grep 'cpu ' /proc/stat)|awk -v RS="" '{printf("%02.0f%%", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5))}' | sed "s/100/99/"
