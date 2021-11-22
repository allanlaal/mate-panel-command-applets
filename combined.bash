#!/bin/bash



# powerscaling status:
#cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | tail -1 | sed 's/ondemand/🡳 /' | sed 's/powersave/🡳 /' | sed 's/performance/🡱/'
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | tail -1 | sed 's/ondemand/psave/' | sed 's/powersave/🡳 /' | sed 's/performance/perf/'

#battery
#upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | sed 's/state://' | sed 's/ //g' | sed 's/discharging/➖/'  | sed 's/fully-charged/➕/' | sed 's/charging/➕/'

# Mem: used GB/Total GB:
awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf("%02.1f/%.0f",(t-a)/1024/1024, t/1024/1024)}' /proc/meminfo
echo ""

# CPU %:
#(grep 'cpu ' /proc/stat;sleep 0.1;grep 'cpu ' /proc/stat)|awk -v RS="" '{printf("%0.f%%", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5))}'
/afs/acn/infra./laptop./scripts./mate_panel_command_applets/cpu.bash

# average Load:
cut -d ' ' -f 1 /proc/loadavg

# mem used GB:
#awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf("%.0fG",(t-a)/1024/1024)}' /proc/meminfo



#echo $BATTERY
#printf('%s', BATTERY)
