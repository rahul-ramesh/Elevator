# code_lines.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

import glob
import sys

jfiles = glob.glob("../elevatorcontrol/*.java");

lines = 0;
for j in jfiles:
    f = open(j, 'r');
    i = 0;
    for line in f:
        if(not(line.find("//") >= 0) and not(line.find("*") >= 0) and (len(line) > 1)):
            i += 1;
    print j + ": " + str(i);
    lines += i;

print "TOTAL LINES: " + str(lines);