# run_integration.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
python ./make_tests_integration.py
chmod 777 tests_integration.bash
rm -r ../integration_test/out/*
rm -r ../integration_test/stats/*
./tests_integration.bash