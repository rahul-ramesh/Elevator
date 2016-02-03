# tests_unit.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
cd ../../simulator-current/code
# CARBUTTONCONTROL UNIT_TEST: 1 iterations
# CarButtonControl unit_test 0
echo -e
echo -e UNIT_TEST: CarButtonControl 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/CarButtonControl.cf -mf ../../portfolio_grp11/unit_test/CarButtonControl.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/CarButtonControl_0.out; then
	mv injection-CarButtonControl.mf-0.stats ../../portfolio_grp11/unit_test/stats/CarButtonControl_0.stats
	echo -e ...SUCCESS: CarButtonControl 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/CarButtonControl_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/CarButtonControl_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/CarButtonControl_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: CarButtonControl 0 Unit Test did not run.
fi

# CARPOSITIONCONTROL UNIT_TEST: 1 iterations
# CarPositionControl unit_test 0
echo -e
echo -e UNIT_TEST: CarPositionControl_0 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/CarPositionControl.cf -mf ../../portfolio_grp11/unit_test/CarPositionControl_0.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/CarPositionControl_0_0.out; then
	mv injection-CarPositionControl_0.mf-0.stats ../../portfolio_grp11/unit_test/stats/CarPositionControl_0_0.stats
	echo -e ...SUCCESS: CarPositionControl_0 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/CarPositionControl_0_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/CarPositionControl_0_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/CarPositionControl_0_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: CarPositionControl 0 Unit Test did not run.
fi

# CARPOSITIONCONTROL UNIT_TEST: 1 iterations
# CarPositionControl unit_test 0
echo -e
echo -e UNIT_TEST: CarPositionControl_1 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/CarPositionControl.cf -mf ../../portfolio_grp11/unit_test/CarPositionControl_1.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/CarPositionControl_1_0.out; then
	mv injection-CarPositionControl_1.mf-0.stats ../../portfolio_grp11/unit_test/stats/CarPositionControl_1_0.stats
	echo -e ...SUCCESS: CarPositionControl_1 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/CarPositionControl_1_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/CarPositionControl_1_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/CarPositionControl_1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: CarPositionControl 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_0.1 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_0.1.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_0.1_0.out; then
	mv injection-Dispatcher_0.1.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_0.1_0.stats
	echo -e ...SUCCESS: Dispatcher_0.1 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.1_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.1_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_0.2 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_0.2.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_0.2_0.out; then
	mv injection-Dispatcher_0.2.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_0.2_0.stats
	echo -e ...SUCCESS: Dispatcher_0.2 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.2_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.2_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_0.3 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_0.3.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_0.3_0.out; then
	mv injection-Dispatcher_0.3.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_0.3_0.stats
	echo -e ...SUCCESS: Dispatcher_0.3 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.3_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.3_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_0.4 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_0.4.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_0.4_0.out; then
	mv injection-Dispatcher_0.4.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_0.4_0.stats
	echo -e ...SUCCESS: Dispatcher_0.4 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.4_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.4_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.4_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_0.5 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_0.5.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_0.5_0.out; then
	mv injection-Dispatcher_0.5.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_0.5_0.stats
	echo -e ...SUCCESS: Dispatcher_0.5 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.5_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.5_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.5_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_0.6 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_0.6.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_0.6_0.out; then
	mv injection-Dispatcher_0.6.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_0.6_0.stats
	echo -e ...SUCCESS: Dispatcher_0.6 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.6_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.6_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_0.6_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_1.1 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_1.1.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_1.1_0.out; then
	mv injection-Dispatcher_1.1.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_1.1_0.stats
	echo -e ...SUCCESS: Dispatcher_1.1 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.1_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.1_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_1.2 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_1.2.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_1.2_0.out; then
	mv injection-Dispatcher_1.2.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_1.2_0.stats
	echo -e ...SUCCESS: Dispatcher_1.2 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.2_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.2_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_1.3 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_1.3.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_1.3_0.out; then
	mv injection-Dispatcher_1.3.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_1.3_0.stats
	echo -e ...SUCCESS: Dispatcher_1.3 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.3_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.3_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_1.4 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_1.4.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_1.4_0.out; then
	mv injection-Dispatcher_1.4.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_1.4_0.stats
	echo -e ...SUCCESS: Dispatcher_1.4 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.4_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.4_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.4_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_1.5 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_1.5.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_1.5_0.out; then
	mv injection-Dispatcher_1.5.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_1.5_0.stats
	echo -e ...SUCCESS: Dispatcher_1.5 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.5_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.5_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.5_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_1.6 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_1.6.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_1.6_0.out; then
	mv injection-Dispatcher_1.6.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_1.6_0.stats
	echo -e ...SUCCESS: Dispatcher_1.6 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.6_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.6_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.6_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DISPATCHER UNIT_TEST: 1 iterations
# Dispatcher unit_test 0
echo -e
echo -e UNIT_TEST: Dispatcher_1.7 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/Dispatcher.cf -mf ../../portfolio_grp11/unit_test/Dispatcher_1.7.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/Dispatcher_1.7_0.out; then
	mv injection-Dispatcher_1.7.mf-0.stats ../../portfolio_grp11/unit_test/stats/Dispatcher_1.7_0.stats
	echo -e ...SUCCESS: Dispatcher_1.7 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.7_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.7_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/Dispatcher_1.7_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: Dispatcher 0 Unit Test did not run.
fi

# DOORCONTROL UNIT_TEST: 1 iterations
# DoorControl unit_test 0
echo -e
echo -e UNIT_TEST: DoorControl_1.1 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DoorControl.cf -mf ../../portfolio_grp11/unit_test/DoorControl_1.1.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DoorControl_1.1_0.out; then
	mv injection-DoorControl_1.1.mf-0.stats ../../portfolio_grp11/unit_test/stats/DoorControl_1.1_0.stats
	echo -e ...SUCCESS: DoorControl_1.1 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.1_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.1_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DoorControl_1.1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DoorControl 0 Unit Test did not run.
fi

# DOORCONTROL UNIT_TEST: 1 iterations
# DoorControl unit_test 0
echo -e
echo -e UNIT_TEST: DoorControl_1.2 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DoorControl.cf -mf ../../portfolio_grp11/unit_test/DoorControl_1.2.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DoorControl_1.2_0.out; then
	mv injection-DoorControl_1.2.mf-0.stats ../../portfolio_grp11/unit_test/stats/DoorControl_1.2_0.stats
	echo -e ...SUCCESS: DoorControl_1.2 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.2_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.2_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DoorControl_1.2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DoorControl 0 Unit Test did not run.
fi

# DOORCONTROL UNIT_TEST: 1 iterations
# DoorControl unit_test 0
echo -e
echo -e UNIT_TEST: DoorControl_1.3 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DoorControl.cf -mf ../../portfolio_grp11/unit_test/DoorControl_1.3.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DoorControl_1.3_0.out; then
	mv injection-DoorControl_1.3.mf-0.stats ../../portfolio_grp11/unit_test/stats/DoorControl_1.3_0.stats
	echo -e ...SUCCESS: DoorControl_1.3 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.3_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.3_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DoorControl_1.3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DoorControl 0 Unit Test did not run.
fi

# DOORCONTROL UNIT_TEST: 1 iterations
# DoorControl unit_test 0
echo -e
echo -e UNIT_TEST: DoorControl_1.4 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DoorControl.cf -mf ../../portfolio_grp11/unit_test/DoorControl_1.4.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DoorControl_1.4_0.out; then
	mv injection-DoorControl_1.4.mf-0.stats ../../portfolio_grp11/unit_test/stats/DoorControl_1.4_0.stats
	echo -e ...SUCCESS: DoorControl_1.4 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.4_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DoorControl_1.4_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DoorControl_1.4_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DoorControl 0 Unit Test did not run.
fi

# DRIVECONTROL UNIT_TEST: 1 iterations
# DriveControl unit_test 0
echo -e
echo -e UNIT_TEST: DriveControl_0.1 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DriveControl.cf -mf ../../portfolio_grp11/unit_test/DriveControl_0.1.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DriveControl_0.1_0.out; then
	mv injection-DriveControl_0.1.mf-0.stats ../../portfolio_grp11/unit_test/stats/DriveControl_0.1_0.stats
	echo -e ...SUCCESS: DriveControl_0.1 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.1_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.1_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DriveControl_0.1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DriveControl 0 Unit Test did not run.
fi

# DRIVECONTROL UNIT_TEST: 1 iterations
# DriveControl unit_test 0
echo -e
echo -e UNIT_TEST: DriveControl_0.2 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DriveControl.cf -mf ../../portfolio_grp11/unit_test/DriveControl_0.2.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DriveControl_0.2_0.out; then
	mv injection-DriveControl_0.2.mf-0.stats ../../portfolio_grp11/unit_test/stats/DriveControl_0.2_0.stats
	echo -e ...SUCCESS: DriveControl_0.2 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.2_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.2_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DriveControl_0.2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DriveControl 0 Unit Test did not run.
fi

# DRIVECONTROL UNIT_TEST: 1 iterations
# DriveControl unit_test 0
echo -e
echo -e UNIT_TEST: DriveControl_0.3 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DriveControl.cf -mf ../../portfolio_grp11/unit_test/DriveControl_0.3.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DriveControl_0.3_0.out; then
	mv injection-DriveControl_0.3.mf-0.stats ../../portfolio_grp11/unit_test/stats/DriveControl_0.3_0.stats
	echo -e ...SUCCESS: DriveControl_0.3 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.3_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.3_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DriveControl_0.3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DriveControl 0 Unit Test did not run.
fi

# DRIVECONTROL UNIT_TEST: 1 iterations
# DriveControl unit_test 0
echo -e
echo -e UNIT_TEST: DriveControl_0.4 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DriveControl.cf -mf ../../portfolio_grp11/unit_test/DriveControl_0.4.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DriveControl_0.4_0.out; then
	mv injection-DriveControl_0.4.mf-0.stats ../../portfolio_grp11/unit_test/stats/DriveControl_0.4_0.stats
	echo -e ...SUCCESS: DriveControl_0.4 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.4_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.4_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DriveControl_0.4_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DriveControl 0 Unit Test did not run.
fi

# DRIVECONTROL UNIT_TEST: 1 iterations
# DriveControl unit_test 0
echo -e
echo -e UNIT_TEST: DriveControl_0.5 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/DriveControl.cf -mf ../../portfolio_grp11/unit_test/DriveControl_0.5.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/DriveControl_0.5_0.out; then
	mv injection-DriveControl_0.5.mf-0.stats ../../portfolio_grp11/unit_test/stats/DriveControl_0.5_0.stats
	echo -e ...SUCCESS: DriveControl_0.5 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.5_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/DriveControl_0.5_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/DriveControl_0.5_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: DriveControl 0 Unit Test did not run.
fi

# HALLBUTTONCONTROL UNIT_TEST: 1 iterations
# HallButtonControl unit_test 0
echo -e
echo -e UNIT_TEST: HallButtonControl 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/HallButtonControl.cf -mf ../../portfolio_grp11/unit_test/HallButtonControl.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/HallButtonControl_0.out; then
	mv injection-HallButtonControl.mf-0.stats ../../portfolio_grp11/unit_test/stats/HallButtonControl_0.stats
	echo -e ...SUCCESS: HallButtonControl 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/HallButtonControl_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/HallButtonControl_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/HallButtonControl_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: HallButtonControl 0 Unit Test did not run.
fi

# LANTERNCONTROL UNIT_TEST: 1 iterations
# LanternControl unit_test 0
echo -e
echo -e UNIT_TEST: LanternControl 0...
if java simulator.framework.Elevator -cf ../../portfolio_grp11/unit_test/LanternControl.cf -mf ../../portfolio_grp11/unit_test/LanternControl.mf -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/unit_test/out/LanternControl_0.out; then
	mv injection-LanternControl.mf-0.stats ../../portfolio_grp11/unit_test/stats/LanternControl_0.stats
	echo -e ...SUCCESS: LanternControl 0 Unit Test ran successfully.
	STR1=$(grep "Passed:" ../../portfolio_grp11/unit_test/stats/LanternControl_0.stats)
	STR2=$(grep "Failed:" ../../portfolio_grp11/unit_test/stats/LanternControl_0.stats)
	STR3=$(grep "Total :" ../../portfolio_grp11/unit_test/stats/LanternControl_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
else
	echo -e ...FAILURE: LanternControl 0 Unit Test did not run.
fi

cd ../../portfolio_grp11/scripts/
python make_test_log.py -unit
