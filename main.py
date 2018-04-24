#!/usr/bin/env python


import os
import subprocess
from subprocess import call, run

cmd1 = "./install"

cmd2 = "airmon-ng start wlan0"

cmd3 = "airmon-ng check kill"

cmd4 = "python clientprobe.py wlan0 100000"


