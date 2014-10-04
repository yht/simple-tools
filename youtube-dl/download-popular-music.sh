#!/bin/sh

PY=/usr/bin/python
PATH=~/youtube-dl
#PROXY=--proxy http://192.168.100.10:8123/
ERRORS=--ignore-errors

# Youtube Music Popular Blues
$PY $PATH/youtube-dl $ERRORS PLzauiyXIK7RjRNsNId-pLgGmm043N7dUK

# Youtube Music Popular Latinas
$PY $PATH/youtube-dl $ERRORS PLcfQmtiAG0X86jeHk7Tbhjqr6HaYLvZ-c

# Youtube Music Popular
$PY $PATH/youtube-dl $ERRORS PLFgquLnL59alCl_2TQvOiD5Vgm1hCaGSI
