#!/bin/bash

# tiny numbers:
#ping -w1 -c1 8.8.8.8 | tail -1| cut -d '=' -f 2 | cut -d '/' -f 2 | cut -d '.' -f 1 | sed 's/1/₁/g' | sed 's/2/₂/g' | sed 's/3/₃/g' | sed 's/4/₄/g' | sed 's/5/₅/g' | sed 's/6/₆/g' | sed 's/7/₇/g' | sed 's/8/₈/g' | sed 's/9/₉/g' | sed 's/0/₀/g' 

#normal size numbers:

## ping IP:
#ping -i 0.2 -w1 -c1 8.8.8.8 | tail -1| cut -d '=' -f 2 | cut -d '/' -f 2 | cut -d '.' -f 1

## ping VPS:
#ping -i 0.2 -w1 -c1 laal.ee | tail -1| cut -d '=' -f 2 | cut -d '/' -f 2 | cut -d '.' -f 1

## ping elisa.ee:
#ping -i 0.2 -w1 -c1 elisa.ee | tail -1| cut -d '=' -f 2 | cut -d '/' -f 2 | cut -d '.' -f 1


#echo 'ms'


# ping IP:
ping -c1 8.8.8.8 2>/dev/null | tail -1| cut -d '=' -f 2 | cut -d '/' -f 2 | cut -d '.' -f 1 | sed -e 's/^/g:/'

# ping VPS:
ping -c1 laal.ee 2>&1 | tail -1| cut -d '=' -f 2 | cut -d '/' -f 2 | cut -d '.' -f 1 | sed -e 's/^/𝛂:/' | sed -e 's/ping: laal.ee: Name or service not known/DNS err/'

# ping elisa.ee:
#ping -c1 elisa.ee 2>&1 | tail -1| cut -d '=' -f 2 | cut -d '/' -f 2 | cut -d '.' -f 1 | sed -e 's/^/e:/'  | sed -e 's/ping: elisa.ee: Name or service not known/DNS err/'
date +:%S
