# fixit.py
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
from glob import glob;

def remove_lines(filename, indicator):
    string = "";
    f = open(filename, "r");
    
    for line in f:
        if(line.find(indicator) < 0):
            string += line;

    f.close;
    f = open(filename, "w");
    f.write(string);
    f.close();
    

def sub_lines(filename, sub_this, with_this):
    string = "";
    f = open(filename, "r");
    for line in f:
        #if((line.find(sub_this) > 0) and not(line.find(with_this) > 0)):
        if(line.find(sub_this) > 0):
            line = line.replace(sub_this, with_this);
        string += line;
    f.close();
    f = open(filename, "w");
    f.write(string);
    f.close();
    
def getFloor(indicator, line):
    possible = ["1", "2", "3", "4", "5", "6", "7", "8"];
    line = line[line.find(indicator):];
    start = line.find("[")
    i = line[start+1:start+2];
    if(i in possible):
        return " " + i;
    else:
        return "";

def getHallway(indicator, line):
    line = line[line.find(indicator):];
    if(line.find("FRONT") > 0):
        return " FRONT"
    elif (line.find("BACK") > 0):
        return " BACK"
    else:
        return ""

def getDirection(indicator, line):
    line = line[line.find(indicator):];
    if(line.find("UP") > 0):
        return " UP"
    elif (line.find("DOWN") > 0):
        return " DOWN"
    else:
        return ""  

def getSide(indicator, line):
    line = line[line.find(indicator):];
    if(line.find("RIGHT") > 0):
        return " RIGHT"
    elif (line.find("LEFT") > 0):
        return " LEFT"
    else:
        return ""    
        
def find_and_sub(filename, indicator, sub_this, for_this):
    string = "";
    f = open(filename, "r");
    for line in f:
        line_str = "";
        if((line.find(indicator) > 0) and (line.find(sub_this) > 0) and (line.find("#DEFINE") < 0)):
            line_str = for_this + getFloor(indicator, line) + getHallway(indicator, line) + getDirection(indicator, line) + getSide(indicator, line)
            line = line.replace(sub_this, line_str);
            print line
        string += line;
    f.close();
    f = open(filename, "w");
    f.write(string);
    f.close();    

unit_files = glob("../unit_test/*.mf");
integ_files = glob("../integration_test/*.mf");
print "HELLO"
#for f in unit_files:
#    print f
    #find_and_sub(f, "DOOR_MOTOR_", "Integer", "DoorMotorCommand");
    #sub_lines(f, "LeanDesiredFloor", "DesiredFloor")
    #remove_lines(f, "desiredDwell")

f = "../integration_test/sd2d.mf";
find_and_sub(f, "DOOR_MOTOR_", "Integer", "DoorMotorCommand");


