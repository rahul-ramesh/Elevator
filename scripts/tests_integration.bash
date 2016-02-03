# tests_integration.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
cd ../../simulator-current/code
# SD1A INTEGRATION_TEST: 1 iterations
# sd1a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd1a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd1a.cf -mf ../../portfolio_grp11/integration_test/sd1a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd1a_0.out; then
	mv injection-sd1a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd1a_0.stats
	echo -e ...SUCCESS: sd1a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd1a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd1a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd1a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd1a 0 Integraion Test did not run.
fi

# SD1B INTEGRATION_TEST: 1 iterations
# sd1b integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd1b 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd1b.cf -mf ../../portfolio_grp11/integration_test/sd1b.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd1b_0.out; then
	mv injection-sd1b.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd1b_0.stats
	echo -e ...SUCCESS: sd1b 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd1b_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd1b_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd1b_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd1b 0 Integraion Test did not run.
fi

# SD1C INTEGRATION_TEST: 1 iterations
# sd1c integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd1c 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd1c.cf -mf ../../portfolio_grp11/integration_test/sd1c.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd1c_0.out; then
	mv injection-sd1c.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd1c_0.stats
	echo -e ...SUCCESS: sd1c 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd1c_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd1c_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd1c_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd1c 0 Integraion Test did not run.
fi

# SD1D INTEGRATION_TEST: 1 iterations
# sd1d integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd1d 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd1d.cf -mf ../../portfolio_grp11/integration_test/sd1d.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd1d_0.out; then
	mv injection-sd1d.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd1d_0.stats
	echo -e ...SUCCESS: sd1d 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd1d_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd1d_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd1d_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd1d 0 Integraion Test did not run.
fi

# SD2A INTEGRATION_TEST: 1 iterations
# sd2a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd2a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd2a.cf -mf ../../portfolio_grp11/integration_test/sd2a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd2a_0.out; then
	mv injection-sd2a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd2a_0.stats
	echo -e ...SUCCESS: sd2a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd2a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd2a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd2a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd2a 0 Integraion Test did not run.
fi

# SD2B INTEGRATION_TEST: 1 iterations
# sd2b integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd2b 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd2b.cf -mf ../../portfolio_grp11/integration_test/sd2b.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd2b_0.out; then
	mv injection-sd2b.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd2b_0.stats
	echo -e ...SUCCESS: sd2b 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd2b_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd2b_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd2b_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd2b 0 Integraion Test did not run.
fi

# SD2C INTEGRATION_TEST: 1 iterations
# sd2c integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd2c 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd2c.cf -mf ../../portfolio_grp11/integration_test/sd2c.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd2c_0.out; then
	mv injection-sd2c.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd2c_0.stats
	echo -e ...SUCCESS: sd2c 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd2c_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd2c_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd2c_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd2c 0 Integraion Test did not run.
fi

# SD3A INTEGRATION_TEST: 1 iterations
# sd3a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd3a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd3a.cf -mf ../../portfolio_grp11/integration_test/sd3a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd3a_0.out; then
	mv injection-sd3a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd3a_0.stats
	echo -e ...SUCCESS: sd3a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd3a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd3a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd3a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd3a 0 Integraion Test did not run.
fi

# SD3B INTEGRATION_TEST: 1 iterations
# sd3b integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd3b 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd3b.cf -mf ../../portfolio_grp11/integration_test/sd3b.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd3b_0.out; then
	mv injection-sd3b.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd3b_0.stats
	echo -e ...SUCCESS: sd3b 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd3b_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd3b_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd3b_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd3b 0 Integraion Test did not run.
fi

# SD4A INTEGRATION_TEST: 1 iterations
# sd4a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd4a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd4a.cf -mf ../../portfolio_grp11/integration_test/sd4a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd4a_0.out; then
	mv injection-sd4a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd4a_0.stats
	echo -e ...SUCCESS: sd4a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd4a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd4a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd4a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd4a 0 Integraion Test did not run.
fi

# SD4B INTEGRATION_TEST: 1 iterations
# sd4b integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd4b 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd4b.cf -mf ../../portfolio_grp11/integration_test/sd4b.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd4b_0.out; then
	mv injection-sd4b.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd4b_0.stats
	echo -e ...SUCCESS: sd4b 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd4b_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd4b_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd4b_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd4b 0 Integraion Test did not run.
fi

# SD5A INTEGRATION_TEST: 1 iterations
# sd5a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd5a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd5a.cf -mf ../../portfolio_grp11/integration_test/sd5a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd5a_0.out; then
	mv injection-sd5a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd5a_0.stats
	echo -e ...SUCCESS: sd5a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd5a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd5a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd5a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd5a 0 Integraion Test did not run.
fi

# SD6A INTEGRATION_TEST: 1 iterations
# sd6a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd6a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd6a.cf -mf ../../portfolio_grp11/integration_test/sd6a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd6a_0.out; then
	mv injection-sd6a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd6a_0.stats
	echo -e ...SUCCESS: sd6a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd6a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd6a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd6a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd6a 0 Integraion Test did not run.
fi

# SD6B INTEGRATION_TEST: 1 iterations
# sd6b integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd6b 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd6b.cf -mf ../../portfolio_grp11/integration_test/sd6b.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd6b_0.out; then
	mv injection-sd6b.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd6b_0.stats
	echo -e ...SUCCESS: sd6b 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd6b_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd6b_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd6b_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd6b 0 Integraion Test did not run.
fi

# SD7A INTEGRATION_TEST: 1 iterations
# sd7a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd7a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd7a.cf -mf ../../portfolio_grp11/integration_test/sd7a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd7a_0.out; then
	mv injection-sd7a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd7a_0.stats
	echo -e ...SUCCESS: sd7a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd7a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd7a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd7a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd7a 0 Integraion Test did not run.
fi

# SD8A INTEGRATION_TEST: 1 iterations
# sd8a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd8a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd8a.cf -mf ../../portfolio_grp11/integration_test/sd8a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd8a_0.out; then
	mv injection-sd8a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd8a_0.stats
	echo -e ...SUCCESS: sd8a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd8a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd8a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd8a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd8a 0 Integraion Test did not run.
fi

# SD8B INTEGRATION_TEST: 1 iterations
# sd8b integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd8b 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd8b.cf -mf ../../portfolio_grp11/integration_test/sd8b.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd8b_0.out; then
	mv injection-sd8b.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd8b_0.stats
	echo -e ...SUCCESS: sd8b 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd8b_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd8b_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd8b_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd8b 0 Integraion Test did not run.
fi

# SD9A INTEGRATION_TEST: 1 iterations
# sd9a integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd9a 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd9a.cf -mf ../../portfolio_grp11/integration_test/sd9a.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd9a_0.out; then
	mv injection-sd9a.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd9a_0.stats
	echo -e ...SUCCESS: sd9a 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd9a_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd9a_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd9a_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd9a 0 Integraion Test did not run.
fi

# SD9B INTEGRATION_TEST: 1 iterations
# sd9b integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd9b 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd9b.cf -mf ../../portfolio_grp11/integration_test/sd9b.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd9b_0.out; then
	mv injection-sd9b.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd9b_0.stats
	echo -e ...SUCCESS: sd9b 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd9b_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd9b_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd9b_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd9b 0 Integraion Test did not run.
fi

# SD9C INTEGRATION_TEST: 1 iterations
# sd9c integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd9c 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd9c.cf -mf ../../portfolio_grp11/integration_test/sd9c.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd9c_0.out; then
	mv injection-sd9c.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd9c_0.stats
	echo -e ...SUCCESS: sd9c 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd9c_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd9c_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd9c_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd9c 0 Integraion Test did not run.
fi

# SD9D INTEGRATION_TEST: 1 iterations
# sd9d integration_test 0
echo -e
echo -e INTEGRATION_TEST: sd9d 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/integration_test/sd9d.cf -mf ../../portfolio_grp11/integration_test/sd9d.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/integration_test/out/sd9d_0.out; then
	mv injection-sd9d.mf-0.stats ../../portfolio_grp11/integration_test/stats/sd9d_0.stats
	echo -e ...SUCCESS: sd9d 0 Integration Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/integration_test/stats/sd9d_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/integration_test/stats/sd9d_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/integration_test/stats/sd9d_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: sd9d 0 Integraion Test did not run.
fi

cd ../../portfolio_grp11/scripts/
python make_test_log.py -integration
