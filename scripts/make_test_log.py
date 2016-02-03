# make_test_log.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
import glob
import sys

# global variables
# acceptance test indicators
perf_ind = "Delivery_performance_score:  ";
time_ind = " simulation seconds";
seed_ind = "RandomSeed = ";
file_ind = "-pf ../../portfolio_grp11/acceptance_test/";
delivered_ind = "Delivered: ";
stranded_ind = "Stranded: ";
atotal_ind = "Total: ";
network = "Recent: ";
warning_ind = "RuntimeMonitor generated ";

# unit test indicators
state_id = ";#state '"
transition_id = ";#transition '"
ucf_ind = "-cf ../../portfolio_grp11/unit_test/";
umf_ind = "-mf ../../portfolio_grp11/unit_test/";

# integration test indicators
icf_ind = "-cf ../../portfolio_grp11/integration_test/";
imf_ind = "-mf ../../portfolio_grp11/integration_test/";

# universal 
p_ind = "Passed: ";
f_ind = "Failed: ";
file_end = "\t</tbody>\n</table>\n</body>\n</html>\n";

te_start = "\t\t<td style=\"vertical-align: top;\">"
te_end = "</td>\n"

# create html reference to filename
def reference_file(path, filename):
	return "<a href=\""+path + filename+"\">"+filename+"</a>";
	
def get_comment(path, filename):
	d_ind = "DESCRIPTION: ";
	f = open(path + filename, "r");
	
	for line in f:
		i = line.find(d_ind);
		if (i >= 0):
			return line[i + len(d_ind):-1];
	return ""
	
def make_html_list(elem_list):
	outstring = "<ul>";
	for elem in elem_list:
		outstring += ("<li>"+elem+"</li>");
	outstring += "</ul>";
	return outstring;
	
def get_states_transitions(mf):
	state_trace = [];
	transition_trace = [];
	
	f = open(mf, "r");
	# loop through all lines
	for line in f:
		# is there a tracability comment?
		state_index = line.find(state_id);
		transition_index = line.find(transition_id);

		# state tracability comment
		if(state_index >= 0):
			start_index = state_index + len(state_id);
			end_index = start_index + line[start_index:].find("'");
			if not(line[start_index:end_index] in state_trace):	
				state_trace.append(line[start_index:end_index]);
		# transition tracability comment
		elif(transition_index >= 0):
			start_index = transition_index + len(transition_id);
			end_index = start_index + line[start_index:].find("'");
			if not(line[start_index:end_index] in transition_trace):	
				transition_trace.append(line[start_index:end_index]);
	f.close();

	output_string = ""
	output_string += "<b>States:</b><br>"
	for state in state_trace:
		output_string += (state + ", ");
	output_string = output_string[:-2] + "<br>"
	output_string += "<br>";
	output_string += "<b>Transitions:</b><br>"
	for transition in transition_trace:
		output_string += (transition + ", ");
	output_string = output_string[:-2] + "<br>"
	return output_string;
	
	
# start with shell 
def copy_shell(fout, shell_path):
	shell = open(shell_path, "r");
	for line in shell:
		fout.write(line);
	shell.close();
	
def make_unit_entry(log_type, fin, folder_path, out_path, stat_path):
	cf = "";
	mf = "";
	p = "";
	f = "";
	cname = "";
	seed = "";
	
	for line in fin:
		cf_i = line.find(ucf_ind);
		mf_i = line.find(umf_ind);
		p_i = line.find(p_ind);
		f_i = line.find(f_ind);
		seed_i = line.find(seed_ind);
		
		if(cf_i >= 0):
			cf = line[cf_i + len(ucf_ind):line.find(".cf") + 3];
			cname = cf.replace(".cf", "");
		if(mf_i >= 0):
			mf = line[mf_i + len(umf_ind):line.find(".mf") + 3];
		if(p_i >= 0):
			p = line[p_i + len(p_ind): -1];
		if(f_i >= 0):
			f = line[f_i + len(f_ind): -1];
		if(seed_i >= 0):
			seed = line[seed_i+len(seed_ind):-1]
			
	outstring = "";
	outstring += "\t<!-- " + out_path.replace(".out", "") + " -->\n";
	outstring += "\t<tr>\n"
	outstring += te_start + cname + te_end;
	outstring += te_start + reference_file(folder_path, cf) + te_end;
	outstring += te_start + reference_file(folder_path, mf) + te_end;
	outstring += te_start + get_states_transitions(folder_path + mf) + te_end;
	outstring += te_start + p + te_end;
	outstring += te_start + f + te_end;
	outstring += te_start + seed + te_end;
	outstring += te_start + reference_file("", stat_path) + te_end;
	outstring += te_start + "N/A" + te_end;
	outstring += "\t</tr>\n";
	return outstring

def make_integ_entry(log_type, fin, folder_path, out_path, stat_path):
	cf = "";
	mf = "";
	p = "";
	f = "";
	cname = "";
	seed = "";
	
	for line in fin:
		cf_i = line.find(icf_ind);
		mf_i = line.find(imf_ind);
		p_i = line.find(p_ind);
		f_i = line.find(f_ind);
		seed_i = line.find(seed_ind);

		
		if(cf_i >= 0):
			cf = line[cf_i + len(icf_ind):line.find(".cf") + 3];
			cname = cf.replace(".cf", "");
		if(mf_i >= 0):
			mf = line[mf_i + len(imf_ind):line.find(".mf") + 3];
		if(p_i >= 0):
			p = line[p_i + len(p_ind): -1];
		if(f_i >= 0):
			f = line[f_i + len(f_ind): -1];
		if(seed_i >= 0):
			seed = line[seed_i+len(seed_ind):-1]
	
	outstring = "";
	outstring += "\t<!-- " + out_path.replace(".out", "") + " -->\n";
	outstring += "\t<tr>\n"
	outstring += te_start + cname + te_end;
	outstring += te_start + reference_file(folder_path, cf) + te_end;
	outstring += te_start + reference_file(folder_path, mf) + te_end;
	outstring += te_start + p + te_end;
	outstring += te_start + f + te_end;
	outstring += te_start + seed + te_end;
	outstring += te_start + reference_file("", stat_path) + te_end;
	outstring += te_start + "N/A" + te_end;
	outstring += "\t</tr>\n";
	return outstring

def make_accept_entry(fin, folder_path, out_path, stat_path):
	perf = "";
	runtime = "";
	seed = "";
	pass_file = "";
	delivered = "";
	stranded = "";
	total = "";
	usage = "";
	warnings = "";
	
	
	# loop throug all lines
	for line in fin:
		perf_i = line.find(perf_ind);
		time_i = line.find(time_ind);
		seed_i = line.find(seed_ind);
		file_i = line.find(file_ind);
		delivered_i = line.find(delivered_ind);
		stranded_i = line.find(stranded_ind);
		total_i = line.find(atotal_ind);
		usage_i = line.find(network);
		warn_i = line.find(warning_ind);
		
		if (perf_i >= 0):
			perf = line[perf_i+len(perf_ind):-1]
		elif(time_i >= 0):
			runtime = line[:time_i];
		elif(seed_i >= 0):
			seed = line[seed_i+len(seed_ind):-1]
		elif(file_i >= 0):
			pass_file = line[file_i + len(file_ind):line.find(".pass") + 5]
		elif(delivered_i >= 0):
			delivered = line[delivered_i:-1];
		elif(stranded_i >= 0):
			stranded = line[stranded_i:-1];
		elif(total_i >= 0):
			total = line[total_i:-1]
		elif(usage_i >= 0):
			end = line.find("%");
			usage = line[usage_i + len(network):end + 1];
		elif(warn_i >= 0):
			warnings = line[warn_i + len(warning_ind):];
			end = warnings.find(" ");
			warnings = warnings[:end]

	outstring = "";
	outstring += "\t<!-- " + out_path.replace(".out", "") + " -->\n";
	outstring += "\t<tr>\n"
	outstring += te_start + reference_file("",pass_file) + te_end;
	outstring += te_start + get_comment(folder_path, pass_file) + te_end;
	outstring += te_start + make_html_list([delivered, stranded, total]) + te_end;
	outstring += te_start + seed + te_end;
	outstring += te_start + runtime + te_end;
	outstring += te_start + perf + te_end;
	outstring += te_start + usage + te_end;
	outstring += te_start + warnings + te_end;
	outstring += te_start + reference_file("",stat_path) + te_end;
	outstring += te_start + "" + te_end;
	outstring += "\t</tr>\n";
	return outstring

# make individual log entry
def make_entry(log_type, path, run_path):
	run = open(run_path, "r");
	ref_out_path = run_path.replace(path, "");
	ref_stat_path = ref_out_path.replace("out", "stats");
	if (log_type == "a"):
		entry = make_accept_entry(run, path, ref_out_path, ref_stat_path);
	elif (log_type == "u"):
		entry = make_unit_entry(log_type, run, path, ref_out_path, ref_stat_path);
	elif(log_type == "i"):
		entry = make_integ_entry(log_type, run, path, ref_out_path, ref_stat_path);
	run.close();
	return entry

# make entire log
def make_log(path, shell, filename, log_type):
	fout = open(path + filename, "w");
	copy_shell(fout, shell);
	
	runs = glob.glob(path + "out/*.out");
	runs = sorted(runs)
	for run in runs:
		fout.write(make_entry(log_type, path, run));
	fout.write(file_end);
	fout.close();

# parse command line arguments
mk_unit = 0;
mk_integration = 0;
mk_acceptance = 0;
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
	elif(arg == "-unit"):
		mk_unit = 1;
	elif(arg == "-integration"):
		mk_integration = 1;
	elif(arg == "-acceptance"):
		mk_acceptance = 1;
	elif(arg == "-all"):
		mk_unit = 1;
		mk_integration = 1;
		mk_acceptance = 1;  
	elif(arg.find("repeats") >= 0):
		repeats = int(arg[8:]);
	elif((arg != script_name) or (len(arg_list) == 1)):
		f_help = 1;

# print help menu or run script
if(f_help):
	print "make_test_log.py HELP menu:"
	print "To run this program in the terminal..."
	print ">"
	print "> python check_links.py (-help) (-echo) (-unit) (-integration) (-acceptance) (-all) (-repeats##)"
	print ">"
	print "\t-help - bring up this menu"
	print "\t-echo - optional, print out diagnostics"
	print "\t-unit - create unit tests"
	print "\t-integration - create integration tests"
	print "\t-acceptance - create acceptance tests"
	print "\t-all - make unit, integration, and acceptance tests"
	print "\t-repeats## - ## number of repeated runs (DEFAULT: 1)"
else:
	if(mk_unit):
		make_log("../unit_test/", "shell_unit_test_log.html", "unit_test_log.html", "u");
	if(mk_integration):
		make_log("../integration_test/", "shell_integration_test_log.html", "integration_test_log.html", "i");
	if(mk_acceptance):
		make_log("../acceptance_test/", "shell_acceptance_test_log.html", "acceptance_test_log.html", "a");