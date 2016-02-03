# make_project.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

path1="../elevatorcontrol/"
path2="../../simulator-current/code/simulator/elevatorcontrol/"

cd $path1
for f in *.java
do
    cp $path1$f $path2$f
done

cd ../../simulator-current/code
make clean
make