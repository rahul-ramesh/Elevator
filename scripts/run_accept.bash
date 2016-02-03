# run_accept.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
if [ -z $1 ]; then
	repeats=1
elif [ $1 -eq 0 ]; then
	repeats=1
else 
	repeats=$1
fi

python make_tests_acceptance.py -repeats$repeats
chmod 777 tests_acceptance.bash
rm -r ../acceptance_test/out/*
rm -r ../acceptance_test/stats/*
./tests_acceptance.bash