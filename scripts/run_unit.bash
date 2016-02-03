# run_unit.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
python ./make_tests_unit.py
chmod 777 tests_unit.bash
rm -r ../unit_test/out/*
rm -r ../unit_test/stats/*
./tests_unit.bash