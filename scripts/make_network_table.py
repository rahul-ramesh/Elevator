# make_network_table.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
f = open("make_a_table.txt", "r");

string = "";
start = "\t\t<td>";
end = "</td>\n";
for line in f:
    string += "\t<tr>\n";
    while(line.find("+") >= 0):
        i = line.find("+");
        string += (start + line[:i] + end);
        line = line[i+1:];
    string += "\t</tr>\n";

print string