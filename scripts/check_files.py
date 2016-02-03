# check_files.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

import glob
import sys

accepted = [];
accepted.append([]);
accepted.append([]);
extra_files = 0;
missing_files = 0;
total_files = 0;

accepted_files = open("accepted_files.txt", "r");
for a in accepted_files:
	if((a.find(";") < 0) and (len(a) > 1)):
		accepted[0].append(a[:-1]);
		accepted[1].append(0);
accepted_files.close();

found1 = glob.glob("../*/*.*");
found2 = glob.glob("../*/*/*.*");
found1.sort();
found2.sort();

found = [];
for f in found1:
	found.append(f);
	total_files += 1;
for f in found2:
	found.append(f);
	total_files += 1;

print "ANALYZING EXTRA FILES..."
for f in found:
	if(f in accepted[0]):
		index = accepted[0].index(f);
	else:
		index = -1;

	if(index >= 0):
		accepted[1][index] = 1;
	else:
		extra_files += 1;
		print "...EXTRA FILE! " + f
print
print "Extra files found: " + str(extra_files);
print 

print "ANALYZING MISSING FILES..."
for i,a in enumerate(accepted[0]):
	if(accepted[1][i] == 0):
		missing_files += 1;
		print "...FILE MISSING! " + accepted[0][i]
print 
print "Missing files: " + str(missing_files);
print
print "TOTAL FILES FOUND: " + str(total_files);
print "TOTAL NUMBER OF ERRORS: " + str(missing_files + extra_files)