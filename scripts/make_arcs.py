# make_arcs.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

# open appropriate input/output files 
fin_filename = "../scen_sd/scen_sd.html";
fout_filename = "../scen_sd/scen_sd_arcs.csv"
fin = open(fin_filename, "r");
fout = open(fout_filename, "w");

# global variables
header = "";
data = "";

# pull the name of the sequence diagram from the comment
def get_name(line):
	name_index = line.find("SD");
	return line[name_index:name_index+4]

# get all of the arcs out of the comment line
def get_arcs(line, arcs_index):
	# initialization
	arcs = [];

	# pull the unparsed arcs from the comment
	#	- that is, arcs are currently separated by a space
	unparsed = line[arcs_index+6:line.find("-->")]

	# parse arcs and put in array
	i = 0;
	while(i >= 0):
		i = unparsed.find(" ");
		if(i>=0):
			arcs.append(unparsed[:i]);
			unparsed = unparsed[i+1:]
	# return array
	return arcs	

# append data to write strings (header and data)
def append_data(name, arcs, header, data):
	for i, arc in enumerate(arcs):
		if (i == 0):
			header += (name + ",");
		else:
			header += (",");
		data += (arc + ",");

	return [header, data]

# loop over all lines in the input file
for line in fin:
	# determine if this is a line with a comment that contains arc information
	arcs_index = line.find("arcs:");
	if (arcs_index >= 0):
		name = get_name(line);
		arcs = get_arcs(line, arcs_index);
		print "Arcs found for " + name + "..."
		
		# create csv data
		[header, data] = append_data(name, arcs, header, data)

# write data to output file
fout.write(header + "\n");
fout.write(data + "\n");

# clost input/output files
fin.close();
fout.close();
			
