# check_links.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

# import
import glob
import sys

# global variables
start_id = "<a href=\"";
end_id = "\">";
int_id = "id=\"";
int_end = "\"";
name_id = "name=\"";

ref_found = 0;
ref_confirmed = 0;
ref_broken = 0;



# get an array of all files
def get_all_files():
    found1 = glob.glob("../*/*.*");
    found2 = glob.glob("../*/*/*.*");
    found = [];
    for f in found1:
    	found.append(f);
    for f in found2:
    	found.append(f);

    return found;

# parse file to get all internal links
def get_internal_links(html):
    f = open(html, "r");
    internal = [];
    for line in f:
        s = line.find(int_id) + len(int_id);
        if(s >= len(int_id)):
            e = line[s:].find(int_end) + s;
            internal.append(line[s:e]);
        else:
            s = line.find(name_id) + len(name_id);
            if(s >= len(name_id)):
                e = line[s:].find(int_end) + s;
                internal.append(line[s:e]);
    f.close();
    return internal;
            
# parse line to get a reference (if any) out if it
def get_reference(found_in, line, internal):
    filename = "";
    path = "";
    flag = 0;
    # GET REFERENCE FILE
    # find start index
    s = line.find(start_id) + len(start_id);

    # if reference found, find the end index
    if ((s >= len(start_id)) and (line[s:].find("#") < 0)):
        e = line[s:].find(end_id) + s;
        filename = line[s:e];

        # GET PATH - only if reference was found
        # get index of last "/" in the string 
        i = len(found_in) - found_in[len(found_in):0:-1].find("/");
        # set path
        path = found_in[:i]
        
        # depending on how the file was put into the header,
        #   set path and filename differently
        if(filename.find(path) >= 0):
            path = "";
        if(filename.find("../") >= 0):
            path = "";
        else:
            filename = filename.replace("./", "");
    if((s >= len(start_id)) and (line[s:].find("#") >= 0)):
        s += 1;
        e = line[s:].find(int_end) + s;
        filename = line[s:e];
        if(flag):
            print filename
        path = "internal";
    
    # retrun path, filename
    return [path, filename]


def check_all_links(echo):
    # local variable initialization
    found = 0;
    confirmed = 0;
    broken = 0;
    
    # get all html files
    html_files = glob.glob("../*/*.html");

    # get all files to check against
    all_files = get_all_files();
    
    # loop through all HTML files
    for html in html_files:
        if(echo):
            print "CHECKING " + html + " LINKS...";
        
        # number of errors found in this particular file
        error = 0;
        
        internal_links = get_internal_links(html);

        # open html file for read only
        f = open(html, "r");
        # loop through all lines
        for line in f:
            # get reference (if any)
            [path, reference] = get_reference(html, line, internal_links);

            if (reference != ""):
                found += 1;
                if(path == "internal"):
                    if(reference in internal_links):
                        confirmed += 1;
                    else:
                        error += 1;
                        broken += 1;
                        if(echo):
                            print "\tERROR: " + reference + " internal link invalid.";
                else:
                    check = path + reference
                    if(check in all_files):
                        confirmed += 1;
                    else:
                        error += 1;
                        broken += 1;
                        if(echo):
                            print "\tERROR: " + check + " link invalid."
        if(echo):
            print "\tNumber of broken links found: " + str(error) + "\n";
    return [found, confirmed, broken];


# parse command line arguments
f_help = 0;
f_echo = 0;
arg_list = sys.argv;
for arg in arg_list:
    if(arg == "-help"):
        f_help = 1;
    elif(arg == "-echo"):
        f_echo = 1;

# print help menu or run script
if(f_help):
	print "check_links.py HELP menu:"
	print "To run this program in the terminal..."
	print "> python check_links.py (-echo) (-help)"
	print "\t(-help) - optional, bring up this menu"
	print "\t(-echo) - optional, print out diagnostics"
else:
    [ref_found, ref_confirmed, ref_broken] = check_all_links(f_echo);
    
    print "NUMBER OF LINKS INSPECTED..." + str(ref_found)
    print "NUMBER OF LINKS CONFIRMED..." + str(ref_confirmed)
    print "NUMBER OF LINKS BROKEN......" + str(ref_broken)
                    

        
