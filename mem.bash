#!/bin/bash
# = /afs/acn/infra./laptop./scripts./mate_panel_command_applets/mem.bash

# RAM: free GB:

#awk '/MemFree/{a=$2}END{printf("%.1fG",a/1024/1024)}' /proc/meminfo
# 2021-03-09: ei reporti (zram pärast?) õiget nrit L4 peal (L3 peal ei märganud viga?)

# free %:
#awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf("%.0f%%",100-100*a/t)}' /proc/meminfo

# Mem: used GB/Total GB:
awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf("%02.1f/%.0f",(t-a)/1024/1024, t/1024/1024)}' /proc/meminfo
