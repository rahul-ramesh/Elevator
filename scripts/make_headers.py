# make_headers.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

import glob
import sys

#global variables 
header_start = "@@"
header_end = "!@"

# make headers for all files of type .extension at path
#	cstart and cend denote the beginning and end of the comment line
def make_header(path, extension, cstart, cend):
	offset = 0;
	# headers for java files
	if(cstart == "//"):
		cstart = " *"
		header = [
			"/*\n",
			"", 
			cstart + " 18-649 Distributed Embedded Systems" + cend, 
			cstart + " Group 11" + cend, 
			cstart + " Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant" + cend,
			" */" + cend,
			"// !@" + cend
		]
		offset = 1;
	# headers for all other files
	elif((cstart == ";") or (cstart == "#") or (cstart == "<!--")):
		header = [
			"", 
			cstart + " 18-649 Distributed Embedded Systems" + cend, 
			cstart + " Group 11" + cend, 
			cstart + " Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant" + cend,
			cstart + " !@" + cend
		]
		offset = 0;

	# get files to edit
	edit = glob.glob(path + extension)

	# loop through all files
	for filename in edit:
		print filename

		# create new header
		if(cstart == "<!--"):
			temp = filename[len(filename) - filename[len(filename):0:-1].find("/"):]
			header[offset] = cstart + " " + temp + cend;
		else:
			header[offset] = cstart + " " + filename[len(path):] + cend;

		# set flag
		writeEn = 0;

		# read entire file
		f = open(filename, 'r');
		lines = f.readlines();
		f.close();

		# RE-WRITE ENTIRE FILE
		# add header
		f = open(filename, 'w');
		for h in header:
			f.write(h)

		# replace old header, write everything else
		for i,line in enumerate(lines):
			if(writeEn):
				f.write(line)
			if(line.find(header_end) >= 0):
				writeEn = 1;

		# always re-write the contents of the file
		if(writeEn == 0):
			print "No previous header found..."
			for i, line in enumerate(lines):
				f.write(line);
		f.close();


# Initialize flags to 0
mk_unit = 0;
mk_integration = 0;
mk_acceptance = 0;
mk_java = 0;
mk_bash = 0;
mk_py = 0;
mk_text = 0;
mk_html = 0;
mk_verify = 0;
issue = 0;

# Loop through input arguments, set appropriate flags 
arg_list = sys.argv;
for arg in arg_list:
	if (arg == "-unit"):
		mk_unit = 1;
	elif (arg == "-integration"):
		mk_integration = 1;
	elif (arg == "-acceptance"):
		mk_acceptance = 1;
	elif (arg == "-java"):
		mk_java = 1;
	elif(arg == "-bash"):
		mk_bash = 1;
	elif(arg == "-py"):
		mk_py = 1;
	elif(arg == "-text"):
		mk_text = 1;
	elif(arg == "-html"):
		mk_html = 1;
	elif(arg == "-verify"):
		mk_verify = 1;
	elif(arg == "-all"):
		mk_unit = 1;
		mk_integration = 1;
		mk_acceptance = 1;
		mk_java = 1;
		mk_bash = 1;
		mk_html = 1;
		mk_verify = 1;
		mk_py = 1;
	elif((arg != "make_headers.py") or (len(arg_list) == 1)):
		issue = 1;

# act on imput arguments:
if(issue):
	print "Incorrect input to headers.py. Acceptable input includes:"
	print "\t-unit - update headers for all unit test files"
	print "\t-integration - update headers for all integration test files"
	print "\t-acceptance - update headers for all acceptance test files"
	print "\t-java - update headers in all java files in elevatorcontrol"
	print "\t-bash"
	print "\t-py"
	print "\t-text"
	print "\t-html"
	print "\t-all"
else:
	# make headers for all unit test files 
	if(mk_unit):
		make_header('../unit_test/out/','*.out', ";", "\n");
		make_header('../unit_test/stats/','*.stats', ";", "\n");
		make_header('../unit_test/','*.mf', ";", "\n");
		make_header('../unit_test/','*.cf', ";", "\n");	

	# make headers for all integration test files
	if(mk_integration):
		make_header('../integration_test/out/', '*.out', ";", "\n");
		make_header('../integration_test/stats/', '*.stats', ";", "\n");
		make_header('../integration_test/', '*.mf', ";", "\n");
		make_header('../integration_test/', '*.cf', ";", "\n");
	
	# make headers for all acceptance test files			
	if(mk_acceptance):
		make_header('../acceptance_test/', '*.pass', ";", "\n");
		make_header('../acceptance_test/out/', '*.out', ";", "\n");
		make_header('../acceptance_test/stats/', '*.stats', ";", "\n");	
	
	# make headers for all bash scripts
	if(mk_java):
		make_header('../elevatorcontrol/','*.java',"//", "\n")
	
	# make headers for all bash scripts
	if(mk_bash):
		make_header('', '*.bash',"#","\n");

	# make headers for all python scripts
	if(mk_py):
		make_header('', '*.py', "#","\n");

	# make headers for text files
	if(mk_text):
		make_header('../*/', '*.txt', ";", "\n");
	# make headers for all hmtl files
	if(mk_html):
		make_header('../*/', '*.html', "<!--"," -->\n");
	# make headers for all verify files
	if(mk_verify):
		make_header('../verify/out/', '*.out', ";", "\n");










