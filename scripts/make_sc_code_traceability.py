# make_sc_code_traceability.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

import glob
import sys

# global variables
path = "../elevatorcontrol/"
state_id = "//#state '"
transition_id = "//#transition '"
full = [];


def getAuthor(c):
	if (c == "Dispatcher"):
		return "Daniel Santoro // ddsantor"
	elif (c == "DriveControl"): 
		return "Daniel Santoro // ddsantor"
	elif (c == "HallButtonControl"):
		return "Daniel Santoro // ddsantor"
	elif (c == "CarButtonControl"):
		return "Daniel Santoro // ddsantor"
	elif (c == "DriveSpeedCanPayloadTranslator"):
		return "Daniel Santoro // ddsantor"
	elif (c == "Utility"):
		return "Daniel Santoro // ddsantor";
	elif (c == "Proj7RuntimeMonitor"):
		return "Daniel Santoro // ddsantor";
	elif (c == "DoorControl"):
		return "David Thompson // davidtho";
	elif (c == "LanternControl"):
		return "David Thompson // davidtho";
	elif (c == "CarPositionControl"): 
		return "Rahul Ramesh // rahulram";
	elif (c == "RuntimeRequirementsMonitor"):
		return "Jialiang Tan // jialiant; Rahul Ramesh // rahulram";
	else:
		return "FIX IT DUMMY"
		
# get all java files
java_files = glob.glob(path+"*.java");

# loop through all controller files
for controller in java_files:
	state_trace = [];
	transition_trace = [];
	
	# get controller name
	name = controller[len(path):-5]
	
	if((name.find("Control") >= 0) or (name == "Dispatcher")):
		print "Developing traceability for " + name;
		# open controller file
		f = open(controller);
	
		# loop through all lines
		for line_num,line in enumerate(f):
			# is there a tracability comment?
			state_index = line.find(state_id);
			transition_index = line.find(transition_id);
	
			# state tracability comment
			if(state_index >= 0):
				start_index = state_index + len(state_id);
				end_index = start_index + line[start_index:].find("'");
				state_trace.append(str(line_num + 1) + "&nbsp;&nbsp;&nbsp;" + line[start_index:end_index] + "<br>");
			# transition tracability comment
			elif(transition_index >= 0):
				start_index = transition_index + len(transition_id);
				end_index = start_index + line[start_index:].find("'");
				transition_trace.append(str(line_num + 1) + "&nbsp;&nbsp;&nbsp;" + line[start_index:end_index] + "<br>");
		# append blank lines
	
		full.append("<!-- " + name + "-->");
		full.append("<h2> " + name + "</h2>");
		full.append("Author Name:&nbsp; " + getAuthor(name) + "<br>");
		full.append("Traceability performed by:&nbsp; make_sc_code_traceability.py<br><br>");
		full.append("");
		full.append("(Line #, Transition #)<br>");
		if(len(transition_trace) != 0):
			for trans in transition_trace:
				full.append(trans);
		else:
			full.append("NO TRANSITIONS<br>");
		full.append("<br>");
		full.append("");
		full.append("(Line#, State)<br>");
		if(len(transition_trace) != 0):
			for s in state_trace:
				full.append(s);
		else:
			full.append("NO STATES<br>");
		full.append("");
	
		# close file
		f.close();


# create state output file
fout = open("../traceability/sc_code.html", "w");

#copy shell over
f = open("shell_sc_code.html", "r");
for line in f:
	fout.write(line);

# write tracability
for line in full:
	fout.write(line + "\n");

# finish file
fout.write("<br>\n<br>\n</body>\n</html>");
fout.close();




