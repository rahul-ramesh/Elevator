# AcceptTestGenerator.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

import sys 
import random

# constants - floor
MIN_FLOOR = 1;
MAX_FLOOR = 8;

# constants - direction
DOWN = -5;
UP = 5;

# constants - hallway
FRONT = "FRONT";
BACK = "BACK";

# constants - file
EXTENSION = ".pass"

# getHeader -
# return a header for a .pass file
def getHeader(description):
	HEADER = 	"; randomAcceptanceX.pass\n"
	HEADER +=	"; 18-649 Distributed Embedded Systems\n"
	HEADER += 	"; Group 11\n"
	HEADER += 	"; Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant\n";
	HEADER += 	"; !@\n";
	HEADER += 	"\n";
	HEADER +=	"; DESCRIPTION: " + description + " Created with AcceptTestGenerator.py\n"
	HEADER +=	"\n";
	HEADER += 	";Time\tStart Floor\tStart Hall\tEnd Floor\tEnd Hall\n";
	return HEADER

# getDirection -
# return a psuedorandom direction from starting floor
def getDirection(starting_floor):
	if(starting_floor == MAX_FLOOR):
		return DOWN;
	elif(starting_floor == MIN_FLOOR):
		return UP;
	return random.randint(-100, 100);	

# getUpPeakDirection -
# return a psuedorandom direction from starting floor for an UpPeak scenario
def getUpPeakDirection(starting_floor):
	if(starting_floor == MAX_FLOOR):
		return DOWN;
	elif(starting_floor == MIN_FLOOR):
		return UP;
	return random.randint(-20, 100);
	
# getDownPeakDirection -
# return a psuedorandom direction from starting floor for a DownPeak scenario
def getDownPeakDirection(starting_floor):
	if(starting_floor == MAX_FLOOR):
		return DOWN;
	elif(starting_floor == MIN_FLOOR):
		return UP;
	return random.randint(-100, 20);		

# getEndFloor -
# return a psuedorandom end floor based on start floor and direction
def getEndFloor(starting_floor, d):
	if(d >= UP):
		return random.randint(starting_floor + 1, MAX_FLOOR);
	elif(d <= DOWN):
		return random.randint(MIN_FLOOR, starting_floor - 1);
	return starting_floor;	

# getHall
# return a psuedorandom hallway based on the input floor
def getHall(floor):
	if(floor == 2):
		return BACK;
	elif((floor == 1) or (floor == 7)):
		if(random.randint(0,1)):
			return FRONT;
		else:
			return BACK;
	return FRONT;

# makeRandomTests - 
# create num_files tests with num_passengers in it
def makeRandomTests(num_files, num_passengers):
	for i in range(0, num_files):
		time = 0;
		fname = "randomAcceptance" + str(i) + EXTENSION;
		print "Creating " + fname + "...";
		fout = open(fname, "w");
		fout.write(getHeader("Random passengers/random destinations."));
		for j in range(0, num_passengers):

			# get starting floor
			start_floor = random.randint(MIN_FLOOR, MAX_FLOOR)

			# determine the direction of travel
			direction = getDirection(start_floor);

			# get ending floor
			end_floor = getEndFloor(start_floor, direction);

			start_hall = getHall(start_floor);
			end_hall = getHall(end_floor)

			time += (random.randint(0, 15) + round(random.random(), 1));
			fout.write(str(time) + "s\t" + str(start_floor) + "\t" + start_hall + "\t" + str(end_floor) + "\t" + end_hall + "\n");
		fout.close();

def makeUpPeakTests(num_files, num_passengers):
	for i in range(0, num_files):
		time = 0;
		fname = "randomUpAcceptance" + str(i) + EXTENSION;
		print "Creating " + fname + "...";
		fout = open(fname, "w");
		fout.write(getHeader("Up peak from random staring floors."));
		for j in range(0, num_passengers):

			# get starting floor
			start_floor = random.randint(MIN_FLOOR, MAX_FLOOR - 1)

			# determine the direction of travel
			direction = getUpPeakDirection(start_floor);

			# get ending floor
			end_floor = getEndFloor(start_floor, direction);

			start_hall = getHall(start_floor);
			end_hall = getHall(end_floor)

			time += (random.randint(0, 15) + round(random.random(), 1));
			fout.write(str(time) + "s\t" + str(start_floor) + "\t" + start_hall + "\t" + str(end_floor) + "\t" + end_hall + "\n");
		fout.close();

def makeDownPeakTests(num_files, num_passengers):
	for i in range(0, num_files):
		time = 0;
		fname = "randomDownAcceptance" + str(i) + EXTENSION;
		print "Creating " + fname + "...";
		fout = open(fname, "w");
		fout.write(getHeader("Down peak from random staring floors."));
		for j in range(0, num_passengers):

			# get starting floor
			start_floor = random.randint(MIN_FLOOR + 1, MAX_FLOOR)

			# determine the direction of travel
			direction = getDownPeakDirection(start_floor);

			# get ending floor
			end_floor = getEndFloor(start_floor, direction);

			start_hall = getHall(start_floor);
			end_hall = getHall(end_floor)

			time += (random.randint(0, 15) + round(random.random(), 1));
			fout.write(str(time) + "s\t" + str(start_floor) + "\t" + start_hall + "\t" + str(end_floor) + "\t" + end_hall + "\n");
		fout.close();

# command line initialization
arg_list = sys.argv;
mk_up = 0;
mk_dn = 0;
help = 0;
num_passengers = 1;
num_files = 1;

# loop through all commands from command line
for i,arg in enumerate(arg_list):
	# set script name
	if(i == 0):
		script_name = arg;
	
	# determine if enough arguements have been given
	if(len(arg_list) == 1):
		help = 1;
	elif(len(arg_list) == 2):
		try:
			num_passengers = int(arg_list[1]);
		except:
			help = 1;
	
	# parse help flag
	elif(arg == "-help"):
		help = 1;
	
	# parse passenger flag
	elif(arg == "-p"):
		if(len(arg_list) > (i + 1)):
			try:
				num_passengers = int(arg_list[i+1]);
			except:
				help = 1;
		else:
			help = 1;
	
	# parse file flag
	elif (arg == "-f"):
		if(len(arg_list) > (i+1)):
			try:
				num_files = int(arg_list[i+1]);
			except:
				help = 1
		else:
			help = 1;

	# parse UP peak flag
	elif (arg == "-up"):
		mk_up = 1;

	# parse DOWN peak flag
	elif (arg == "-down"):
		mk_dn = 1;

# print help menu or run script
if(help):
	print "AcceptTestGenerator.py HELP menu:"
	print "To run this program in the terminal..."
	print ">"
	print "> python AcceptTestGenerator.py (-help) (N) (-p N) (-f M) (-up) (-down)"
	print ">"
	print "\t-help 	- bring up this menu"
	print "\tN 	- if only one numerical argument is given, one random acceptance test will be created with N passengers"
	print "\t-p N 	- create acceptance test(s) with N passengers"
	print "\t-f M 	- create M acceptance tests"
	print "\t-up 	- create acceptance test(s) in an up peak scenario"
	print "\t-down 	- create acceptance test(s) in a down peak scenario"
	print
	print "To create a single random acceptance test with 100 passengers:"
	print">> python AcceptTestGenerator.py 100"
	print 
	print "To create 10 random acceptance tests with 100 passengers:"
	print ">> python AcceptTestGenerator.py -f 10 -p 100"
elif(mk_up):
	makeUpPeakTests(num_files, num_passengers);
elif(mk_dn):
	makeDownPeakTests(num_files, num_passengers);
else:
	makeRandomTests(num_files, num_passengers);



