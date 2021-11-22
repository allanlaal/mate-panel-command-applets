#!/bin/bash

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | tail -1 | sed 's/powersave/🡳 /' | sed 's/performance/🡱/'
