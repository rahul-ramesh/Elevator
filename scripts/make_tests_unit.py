# make_tests_unit.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

import sys
import glob
# get test info from a line of test
def get_info(line):
	# initialize indices
	i = 0;
	j = 0;

	# initialize names
	name = "";
	cf = "";
	mf = "";

	# loop over entire line
	while(i >= 0):
		# the data is space delimited 
		i = line.find(" ");
		if(j == 0):
		 	name = line[:i];
		 	j += 1;
		elif(j == 1):
		 	cf = line[:i];
		 	j += 1;
		elif(j == 2):
		 	mf = line[:i];
		 	j += 1;
		line = line[i+1:]
	# return name, cf, mf	
	return [name, cf, mf];

# create test based on the test_type, name, cf, mf. repeat 'repeats' times starting at index 'start'
#	NOTE: This creates a bash script
def make_test(test_type, name, cf, mf, repeats):
	test = "";
	test += "# " + name.upper() + " " + test_type.upper() + ": " + str(repeats) + " iterations\n";

	for i in range(0, repeats):
		test += "# " + name + " " + test_type + " " + str(i) + "\n";
		test += "echo -e\n"
		test += "echo -e " + test_type.upper() + ": " + mf[:-3] + " " + str(i) + "...\n"
		test += "if java simulator.framework.Elevator -cf ../../portfolio_grp11/" + test_type + "/" + cf + " -mf ../../portfolio_grp11/" + test_type + "/" + mf + " -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/" + test_type + "/out/" + mf[:-3] + "_" + str(i) + ".out; then\n";
		test += "\tmv injection-" + mf + "-0.stats ../../portfolio_grp11/" + test_type + "/stats/" + mf[:-3] + "_" + str(i) + ".stats\n";
		test += "\techo -e ...SUCCESS: " + mf[:-3] + " " + str(i) + " Unit Test ran successfully.\n";
		test += "\tSTR1=$(grep \"Passed:\" ../../portfolio_grp11/" + test_type + "/stats/" + mf[:-3] + "_" + str(i) + ".stats)\n";
		test += "\tSTR2=$(grep \"Failed:\" ../../portfolio_grp11/" + test_type + "/stats/" + mf[:-3] + "_" + str(i) + ".stats)\n";
		test += "\tSTR3=$(grep \"Total :\" ../../portfolio_grp11/" + test_type + "/stats/" + mf[:-3] + "_" + str(i) + ".stats)\n";
		test += "\techo -e ......$STR1\n";
		test += "\techo -e ......$STR2\n";
		test += "\techo -e ......$STR3\n";
		test += "else\n";
		test += "\techo -e ...FAILURE: " + name + " " + str(i) + " Unit Test did not run.\n"
		test += "fi\n\n"
	return test

# MAKE UNIT TESTS 
# make run_unit.bash
def make_unit_tests(repeats, echo):
	if(echo): print "MAKING UNIT TESTS";
	
	unit_test = open("../unit_test/unit_tests.txt", "r");
	unit_test_string = ""
	# loop over all lines in the unit test file
	for line in unit_test:
		# parse out comments, otherwise make a test
		if((line.find(";") < 0) and (len(line) > 1)):
			[name, cf, mf] = get_info(line);
			if(echo): print "...Adding " + name + " to the master script.";
			unit_test_string += make_test("unit_test", name, cf, mf, repeats);
		# write tests to output bash file
		fout = open("tests_unit.bash", "w");
		fout.write("cd ../../simulator-current/code\n");
		fout.write(unit_test_string);
		fout.write("cd ../../portfolio_grp11/scripts/\n");
		fout.write("python make_test_log.py -unit\n");
		fout.close();
	unit_test.close();

# parse command line arguments
repeats = 1;
f_help = 0;
f_echo = 0;
script_name = "";

arg_list = sys.argv;
for i,arg in enumerate(arg_list):
	if(i == 0):
		script_name = arg;
	if(arg == "-help"):
		f_help = 1;
	elif(arg == "-echo"):
		f_echo = 1;
	elif(arg.find("repeats") >= 0):
		repeats = int(arg[8:]);
	elif(arg != script_name):
		f_help = 1;

# print help menu or run script
if(f_help):
	print "make_unit_tests.py HELP menu:"
	print "To run this program in the terminal..."
	print ">"
	print "> python check_links.py (-help) (-echo) (-repeats##)"
	print ">"
	print "\t-help - bring up this menu"
	print "\t-echo -e - optional, print out diagnostics"
	print "\t-repeats## - ## number of repeated runs (DEFAULT: 1)"
else:
	make_unit_tests(repeats, f_echo);

