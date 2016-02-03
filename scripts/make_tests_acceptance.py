# make_tests_acceptance.py
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
		test += "echo -e " + test_type.upper() + ": " + name + " " + str(i) + "...\n"
		test += "echo -e " + test_type.upper() + ": " + name + " " + str(i) + "...>>accept_out.txt\n"
		test += "if java simulator.framework.Elevator -pf ../../portfolio_grp11/" + test_type + "/" + name + ".pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/" + test_type + "/out/" + name + "_" + str(i) + ".out; then\n";
		test += "\tmv elevator-" + name + ".pass-0.stats ../../portfolio_grp11/" + test_type + "/stats/" + name + "_" + str(i) + ".stats\n";
		test += "\techo -e ...SUCCESS: " + mf[:-3] + " " + str(i) + " Acceptance Test ran successfully.\n";
		test += "\techo -e ...SUCCESS: " + mf[:-3] + " " + str(i) + " Acceptance Test ran successfully.>>accept_out.txt\n";
		test += "\tSTR1=$(grep \"Delivered:\" ../../portfolio_grp11/" + test_type + "/stats/" + name + "_" + str(i) + ".stats)\n";
		test += "\tSTR2=$(grep \"Stranded:\" ../../portfolio_grp11/" + test_type + "/stats/" + name + "_" + str(i) + ".stats)\n";
		test += "\tSTR3=$(grep \"Total:\" ../../portfolio_grp11/" + test_type + "/stats/" + name + "_" + str(i) + ".stats)\n";
		test += "\tSTR4=$(grep \"RandomSeed =\" ../../portfolio_grp11/" + test_type + "/stats/" + name + "_" + str(i) + ".stats)\n";
		test += "\tSTR5=$(grep \"RuntimeMonitor generated\" ../../portfolio_grp11/" + test_type + "/stats/" + name + "_" + str(i) + ".stats)\n";
		test += "\techo -e ......$STR1\n";
		test += "\techo -e ......$STR2\n";
		test += "\techo -e ......$STR3\n";
		test += "\techo -e ......$STR4\n";
		test += "\techo -e ......$STR5\n";
		test += "\techo -e ......$STR1>>accept_out.txt\n";
		test += "\techo -e ......$STR2>>accept_out.txt\n";
		test += "\techo -e ......$STR3>>accept_out.txt\n";
		test += "\techo -e ......$STR4>>accept_out.txt\n";			
		test += "\techo -e ......$STR5>>accept_out.txt\n";			
		test += "else\n";
		test += "\techo -e ...FAILURE: " + name + " " + str(i) + " Acceptance Test did not run.\n"
		test += "\techo -e ...FAILURE: " + name + " " + str(i) + " Acceptance Test did not run.>>accept_out.txt\n"
		test += "\tSTR6=$(grep \"RandomSeed =\" ../../portfolio_grp11/" + test_type + "/out/" + name + "_" + str(i) + ".out)\n";
		test += "\techo -e ......$STR6\n";
		test += "\techo -e ......$STR6>>accept_out.txt\n";			
		test += "fi\n\n"
	return test
	
# MAKE ACCEPTANCE TESTS
# make run_accept.bash
def make_acceptance_tests(repeats, echo):
	acceptance_tests = glob.glob("../acceptance_test/*.pass");
	acceptance_tests.sort();
	acceptance_test_string = ""
	for accept in acceptance_tests:
		start_index = len(accept) - accept[len(accept):0:-1].find("/")
		name = accept[start_index:-5]
		acceptance_test_string += make_test("acceptance_test", name, "", "", repeats);
	fout = open("tests_acceptance.bash", "w");
	fout.write("cd ../../simulator-current/code\n");
	fout.write(acceptance_test_string);
	fout.write("cd ../../portfolio_grp11/scripts/\n");
	fout.write("python make_test_log.py -acceptance\n");
	fout.close;

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
	print "check_links.py HELP menu:"
	print "To run this program in the terminal..."
	print ">"
	print "> python check_links.py (-help) (-echo) (-repeats##)"
	print ">"
	print "\t-help - bring up this menu"
	print "\t-echo -e - optional, print out diagnostics"
	print "\t-repeats## - ## number of repeated runs (DEFAULT: 1)"
else:
	make_acceptance_tests(repeats, f_echo);

