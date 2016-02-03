# tests_acceptance.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@
cd ../../simulator-current/code
# BASIC ACCEPTANCE_TEST: 1 iterations
# basic acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: basic 0...
echo -e ACCEPTANCE_TEST: basic 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/basic.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/basic_0.out; then
	mv elevator-basic.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/basic_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/basic_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/basic_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/basic_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/basic_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/basic_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: basic 0 Acceptance Test did not run.
	echo -e ...FAILURE: basic 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/basic_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# DOWNPEAK_FINAL ACCEPTANCE_TEST: 1 iterations
# downpeak_final acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: downpeak_final 0...
echo -e ACCEPTANCE_TEST: downpeak_final 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/downpeak_final.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/downpeak_final_0.out; then
	mv elevator-downpeak_final.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/downpeak_final_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/downpeak_final_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/downpeak_final_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/downpeak_final_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/downpeak_final_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/downpeak_final_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: downpeak_final 0 Acceptance Test did not run.
	echo -e ...FAILURE: downpeak_final 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/downpeak_final_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# LONG ACCEPTANCE_TEST: 1 iterations
# long acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: long 0...
echo -e ACCEPTANCE_TEST: long 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/long.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/long_0.out; then
	mv elevator-long.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/long_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/long_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/long_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/long_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/long_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/long_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: long 0 Acceptance Test did not run.
	echo -e ...FAILURE: long 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/long_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# MED ACCEPTANCE_TEST: 1 iterations
# med acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: med 0...
echo -e ACCEPTANCE_TEST: med 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/med.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/med_0.out; then
	mv elevator-med.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/med_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/med_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/med_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/med_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/med_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/med_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: med 0 Acceptance Test did not run.
	echo -e ...FAILURE: med 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/med_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# NORMAL_FINAL ACCEPTANCE_TEST: 1 iterations
# normal_final acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: normal_final 0...
echo -e ACCEPTANCE_TEST: normal_final 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/normal_final.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/normal_final_0.out; then
	mv elevator-normal_final.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/normal_final_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/normal_final_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/normal_final_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/normal_final_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/normal_final_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/normal_final_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: normal_final 0 Acceptance Test did not run.
	echo -e ...FAILURE: normal_final 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/normal_final_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# PROJ12ACCEPTANCE1 ACCEPTANCE_TEST: 1 iterations
# proj12acceptance1 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: proj12acceptance1 0...
echo -e ACCEPTANCE_TEST: proj12acceptance1 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/proj12acceptance1.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/proj12acceptance1_0.out; then
	mv elevator-proj12acceptance1.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/proj12acceptance1_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance1_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance1_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance1_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance1_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: proj12acceptance1 0 Acceptance Test did not run.
	echo -e ...FAILURE: proj12acceptance1 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/proj12acceptance1_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# PROJ12ACCEPTANCE2 ACCEPTANCE_TEST: 1 iterations
# proj12acceptance2 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: proj12acceptance2 0...
echo -e ACCEPTANCE_TEST: proj12acceptance2 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/proj12acceptance2.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/proj12acceptance2_0.out; then
	mv elevator-proj12acceptance2.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/proj12acceptance2_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance2_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance2_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance2_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance2_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: proj12acceptance2 0 Acceptance Test did not run.
	echo -e ...FAILURE: proj12acceptance2 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/proj12acceptance2_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# PROJ12ACCEPTANCE3 ACCEPTANCE_TEST: 1 iterations
# proj12acceptance3 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: proj12acceptance3 0...
echo -e ACCEPTANCE_TEST: proj12acceptance3 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/proj12acceptance3.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/proj12acceptance3_0.out; then
	mv elevator-proj12acceptance3.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/proj12acceptance3_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance3_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance3_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance3_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance3_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/proj12acceptance3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: proj12acceptance3 0 Acceptance Test did not run.
	echo -e ...FAILURE: proj12acceptance3 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/proj12acceptance3_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# PROJ7ACCEPTANCE1 ACCEPTANCE_TEST: 1 iterations
# proj7acceptance1 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: proj7acceptance1 0...
echo -e ACCEPTANCE_TEST: proj7acceptance1 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/proj7acceptance1.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/proj7acceptance1_0.out; then
	mv elevator-proj7acceptance1.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/proj7acceptance1_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance1_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance1_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance1_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance1_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: proj7acceptance1 0 Acceptance Test did not run.
	echo -e ...FAILURE: proj7acceptance1 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/proj7acceptance1_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# PROJ7ACCEPTANCE2 ACCEPTANCE_TEST: 1 iterations
# proj7acceptance2 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: proj7acceptance2 0...
echo -e ACCEPTANCE_TEST: proj7acceptance2 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/proj7acceptance2.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/proj7acceptance2_0.out; then
	mv elevator-proj7acceptance2.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/proj7acceptance2_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance2_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance2_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance2_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance2_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: proj7acceptance2 0 Acceptance Test did not run.
	echo -e ...FAILURE: proj7acceptance2 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/proj7acceptance2_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# PROJ7ACCEPTANCE3 ACCEPTANCE_TEST: 1 iterations
# proj7acceptance3 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: proj7acceptance3 0...
echo -e ACCEPTANCE_TEST: proj7acceptance3 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/proj7acceptance3.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/proj7acceptance3_0.out; then
	mv elevator-proj7acceptance3.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/proj7acceptance3_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance3_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance3_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance3_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance3_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/proj7acceptance3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: proj7acceptance3 0 Acceptance Test did not run.
	echo -e ...FAILURE: proj7acceptance3 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/proj7acceptance3_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# PROJ8GROUP11ACCEPTANCE1 ACCEPTANCE_TEST: 1 iterations
# proj8group11acceptance1 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: proj8group11acceptance1 0...
echo -e ACCEPTANCE_TEST: proj8group11acceptance1 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/proj8group11acceptance1.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/proj8group11acceptance1_0.out; then
	mv elevator-proj8group11acceptance1.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/proj8group11acceptance1_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/proj8group11acceptance1_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/proj8group11acceptance1_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/proj8group11acceptance1_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/proj8group11acceptance1_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/proj8group11acceptance1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: proj8group11acceptance1 0 Acceptance Test did not run.
	echo -e ...FAILURE: proj8group11acceptance1 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/proj8group11acceptance1_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE0 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance0 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance0 0...
echo -e ACCEPTANCE_TEST: randomAcceptance0 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance0.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance0_0.out; then
	mv elevator-randomAcceptance0.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance0_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance0_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance0_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance0_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance0_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance0_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance0 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance0 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance0_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE1 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance1 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance1 0...
echo -e ACCEPTANCE_TEST: randomAcceptance1 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance1.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance1_0.out; then
	mv elevator-randomAcceptance1.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance1_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance1_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance1_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance1_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance1_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance1 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance1 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance1_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE10 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance10 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance10 0...
echo -e ACCEPTANCE_TEST: randomAcceptance10 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance10.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance10_0.out; then
	mv elevator-randomAcceptance10.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance10_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance10_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance10_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance10_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance10_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance10_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance10 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance10 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance10_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE11 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance11 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance11 0...
echo -e ACCEPTANCE_TEST: randomAcceptance11 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance11.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance11_0.out; then
	mv elevator-randomAcceptance11.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance11_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance11_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance11_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance11_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance11_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance11_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance11 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance11 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance11_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE12 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance12 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance12 0...
echo -e ACCEPTANCE_TEST: randomAcceptance12 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance12.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance12_0.out; then
	mv elevator-randomAcceptance12.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance12_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance12_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance12_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance12_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance12_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance12_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance12 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance12 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance12_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE13 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance13 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance13 0...
echo -e ACCEPTANCE_TEST: randomAcceptance13 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance13.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance13_0.out; then
	mv elevator-randomAcceptance13.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance13_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance13_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance13_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance13_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance13_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance13_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance13 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance13 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance13_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE14 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance14 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance14 0...
echo -e ACCEPTANCE_TEST: randomAcceptance14 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance14.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance14_0.out; then
	mv elevator-randomAcceptance14.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance14_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance14_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance14_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance14_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance14_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance14_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance14 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance14 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance14_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE15 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance15 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance15 0...
echo -e ACCEPTANCE_TEST: randomAcceptance15 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance15.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance15_0.out; then
	mv elevator-randomAcceptance15.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance15_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance15_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance15_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance15_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance15_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance15_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance15 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance15 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance15_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE16 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance16 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance16 0...
echo -e ACCEPTANCE_TEST: randomAcceptance16 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance16.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance16_0.out; then
	mv elevator-randomAcceptance16.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance16_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance16_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance16_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance16_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance16_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance16_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance16 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance16 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance16_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE17 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance17 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance17 0...
echo -e ACCEPTANCE_TEST: randomAcceptance17 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance17.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance17_0.out; then
	mv elevator-randomAcceptance17.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance17_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance17_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance17_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance17_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance17_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance17_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance17 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance17 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance17_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE18 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance18 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance18 0...
echo -e ACCEPTANCE_TEST: randomAcceptance18 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance18.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance18_0.out; then
	mv elevator-randomAcceptance18.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance18_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance18_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance18_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance18_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance18_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance18_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance18 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance18 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance18_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE19 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance19 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance19 0...
echo -e ACCEPTANCE_TEST: randomAcceptance19 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance19.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance19_0.out; then
	mv elevator-randomAcceptance19.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance19_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance19_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance19_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance19_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance19_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance19_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance19 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance19 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance19_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE2 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance2 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance2 0...
echo -e ACCEPTANCE_TEST: randomAcceptance2 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance2.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance2_0.out; then
	mv elevator-randomAcceptance2.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance2_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance2_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance2_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance2_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance2_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance2 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance2 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance2_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE20 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance20 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance20 0...
echo -e ACCEPTANCE_TEST: randomAcceptance20 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance20.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance20_0.out; then
	mv elevator-randomAcceptance20.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance20_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance20_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance20_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance20_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance20_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance20_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance20 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance20 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance20_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE21 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance21 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance21 0...
echo -e ACCEPTANCE_TEST: randomAcceptance21 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance21.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance21_0.out; then
	mv elevator-randomAcceptance21.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance21_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance21_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance21_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance21_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance21_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance21_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance21 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance21 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance21_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE22 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance22 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance22 0...
echo -e ACCEPTANCE_TEST: randomAcceptance22 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance22.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance22_0.out; then
	mv elevator-randomAcceptance22.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance22_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance22_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance22_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance22_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance22_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance22_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance22 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance22 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance22_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE23 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance23 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance23 0...
echo -e ACCEPTANCE_TEST: randomAcceptance23 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance23.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance23_0.out; then
	mv elevator-randomAcceptance23.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance23_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance23_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance23_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance23_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance23_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance23_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance23 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance23 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance23_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE24 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance24 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance24 0...
echo -e ACCEPTANCE_TEST: randomAcceptance24 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance24.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance24_0.out; then
	mv elevator-randomAcceptance24.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance24_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance24_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance24_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance24_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance24_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance24_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance24 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance24 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance24_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE25 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance25 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance25 0...
echo -e ACCEPTANCE_TEST: randomAcceptance25 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance25.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance25_0.out; then
	mv elevator-randomAcceptance25.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance25_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance25_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance25_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance25_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance25_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance25_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance25 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance25 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance25_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE26 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance26 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance26 0...
echo -e ACCEPTANCE_TEST: randomAcceptance26 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance26.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance26_0.out; then
	mv elevator-randomAcceptance26.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance26_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance26_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance26_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance26_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance26_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance26_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance26 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance26 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance26_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE27 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance27 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance27 0...
echo -e ACCEPTANCE_TEST: randomAcceptance27 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance27.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance27_0.out; then
	mv elevator-randomAcceptance27.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance27_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance27_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance27_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance27_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance27_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance27_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance27 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance27 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance27_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE28 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance28 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance28 0...
echo -e ACCEPTANCE_TEST: randomAcceptance28 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance28.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance28_0.out; then
	mv elevator-randomAcceptance28.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance28_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance28_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance28_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance28_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance28_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance28_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance28 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance28 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance28_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE29 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance29 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance29 0...
echo -e ACCEPTANCE_TEST: randomAcceptance29 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance29.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance29_0.out; then
	mv elevator-randomAcceptance29.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance29_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance29_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance29_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance29_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance29_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance29_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance29 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance29 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance29_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE3 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance3 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance3 0...
echo -e ACCEPTANCE_TEST: randomAcceptance3 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance3.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance3_0.out; then
	mv elevator-randomAcceptance3.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance3_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance3_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance3_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance3_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance3_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance3 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance3 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance3_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE30 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance30 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance30 0...
echo -e ACCEPTANCE_TEST: randomAcceptance30 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance30.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance30_0.out; then
	mv elevator-randomAcceptance30.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance30_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance30_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance30_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance30_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance30_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance30_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance30 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance30 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance30_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE31 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance31 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance31 0...
echo -e ACCEPTANCE_TEST: randomAcceptance31 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance31.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance31_0.out; then
	mv elevator-randomAcceptance31.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance31_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance31_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance31_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance31_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance31_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance31_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance31 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance31 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance31_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE32 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance32 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance32 0...
echo -e ACCEPTANCE_TEST: randomAcceptance32 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance32.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance32_0.out; then
	mv elevator-randomAcceptance32.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance32_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance32_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance32_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance32_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance32_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance32_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance32 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance32 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance32_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE33 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance33 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance33 0...
echo -e ACCEPTANCE_TEST: randomAcceptance33 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance33.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance33_0.out; then
	mv elevator-randomAcceptance33.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance33_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance33_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance33_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance33_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance33_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance33_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance33 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance33 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance33_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE34 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance34 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance34 0...
echo -e ACCEPTANCE_TEST: randomAcceptance34 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance34.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance34_0.out; then
	mv elevator-randomAcceptance34.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance34_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance34_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance34_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance34_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance34_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance34_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance34 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance34 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance34_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE35 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance35 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance35 0...
echo -e ACCEPTANCE_TEST: randomAcceptance35 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance35.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance35_0.out; then
	mv elevator-randomAcceptance35.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance35_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance35_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance35_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance35_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance35_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance35_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance35 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance35 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance35_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE36 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance36 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance36 0...
echo -e ACCEPTANCE_TEST: randomAcceptance36 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance36.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance36_0.out; then
	mv elevator-randomAcceptance36.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance36_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance36_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance36_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance36_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance36_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance36_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance36 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance36 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance36_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE37 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance37 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance37 0...
echo -e ACCEPTANCE_TEST: randomAcceptance37 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance37.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance37_0.out; then
	mv elevator-randomAcceptance37.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance37_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance37_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance37_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance37_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance37_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance37_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance37 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance37 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance37_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE38 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance38 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance38 0...
echo -e ACCEPTANCE_TEST: randomAcceptance38 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance38.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance38_0.out; then
	mv elevator-randomAcceptance38.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance38_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance38_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance38_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance38_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance38_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance38_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance38 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance38 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance38_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE39 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance39 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance39 0...
echo -e ACCEPTANCE_TEST: randomAcceptance39 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance39.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance39_0.out; then
	mv elevator-randomAcceptance39.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance39_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance39_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance39_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance39_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance39_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance39_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance39 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance39 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance39_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE4 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance4 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance4 0...
echo -e ACCEPTANCE_TEST: randomAcceptance4 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance4.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance4_0.out; then
	mv elevator-randomAcceptance4.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance4_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance4_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance4_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance4_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance4_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance4_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance4 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance4 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance4_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE5 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance5 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance5 0...
echo -e ACCEPTANCE_TEST: randomAcceptance5 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance5.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance5_0.out; then
	mv elevator-randomAcceptance5.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance5_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance5_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance5_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance5_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance5_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance5_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance5 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance5 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance5_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE6 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance6 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance6 0...
echo -e ACCEPTANCE_TEST: randomAcceptance6 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance6.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance6_0.out; then
	mv elevator-randomAcceptance6.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance6_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance6_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance6_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance6_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance6_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance6_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance6 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance6 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance6_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE7 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance7 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance7 0...
echo -e ACCEPTANCE_TEST: randomAcceptance7 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance7.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance7_0.out; then
	mv elevator-randomAcceptance7.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance7_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance7_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance7_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance7_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance7_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance7_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance7 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance7 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance7_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE8 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance8 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance8 0...
echo -e ACCEPTANCE_TEST: randomAcceptance8 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance8.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance8_0.out; then
	mv elevator-randomAcceptance8.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance8_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance8_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance8_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance8_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance8_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance8_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance8 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance8 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance8_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMACCEPTANCE9 ACCEPTANCE_TEST: 1 iterations
# randomAcceptance9 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomAcceptance9 0...
echo -e ACCEPTANCE_TEST: randomAcceptance9 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomAcceptance9.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomAcceptance9_0.out; then
	mv elevator-randomAcceptance9.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomAcceptance9_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance9_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance9_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance9_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance9_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomAcceptance9_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomAcceptance9 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomAcceptance9 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomAcceptance9_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE0 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance0 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance0 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance0 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance0.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance0_0.out; then
	mv elevator-randomDownAcceptance0.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance0_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance0_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance0_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance0_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance0_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance0_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance0 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance0 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance0_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE1 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance1 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance1 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance1 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance1.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance1_0.out; then
	mv elevator-randomDownAcceptance1.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance1_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance1_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance1_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance1_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance1_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance1 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance1 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance1_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE10 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance10 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance10 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance10 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance10.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance10_0.out; then
	mv elevator-randomDownAcceptance10.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance10_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance10_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance10_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance10_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance10_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance10_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance10 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance10 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance10_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE11 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance11 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance11 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance11 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance11.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance11_0.out; then
	mv elevator-randomDownAcceptance11.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance11_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance11_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance11_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance11_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance11_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance11_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance11 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance11 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance11_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE12 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance12 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance12 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance12 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance12.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance12_0.out; then
	mv elevator-randomDownAcceptance12.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance12_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance12_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance12_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance12_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance12_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance12_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance12 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance12 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance12_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE13 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance13 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance13 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance13 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance13.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance13_0.out; then
	mv elevator-randomDownAcceptance13.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance13_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance13_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance13_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance13_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance13_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance13_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance13 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance13 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance13_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE14 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance14 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance14 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance14 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance14.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance14_0.out; then
	mv elevator-randomDownAcceptance14.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance14_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance14_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance14_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance14_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance14_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance14_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance14 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance14 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance14_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE15 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance15 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance15 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance15 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance15.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance15_0.out; then
	mv elevator-randomDownAcceptance15.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance15_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance15_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance15_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance15_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance15_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance15_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance15 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance15 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance15_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE16 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance16 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance16 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance16 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance16.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance16_0.out; then
	mv elevator-randomDownAcceptance16.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance16_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance16_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance16_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance16_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance16_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance16_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance16 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance16 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance16_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE17 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance17 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance17 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance17 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance17.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance17_0.out; then
	mv elevator-randomDownAcceptance17.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance17_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance17_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance17_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance17_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance17_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance17_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance17 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance17 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance17_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE18 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance18 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance18 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance18 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance18.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance18_0.out; then
	mv elevator-randomDownAcceptance18.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance18_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance18_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance18_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance18_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance18_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance18_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance18 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance18 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance18_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE19 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance19 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance19 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance19 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance19.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance19_0.out; then
	mv elevator-randomDownAcceptance19.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance19_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance19_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance19_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance19_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance19_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance19_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance19 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance19 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance19_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE2 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance2 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance2 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance2 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance2.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance2_0.out; then
	mv elevator-randomDownAcceptance2.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance2_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance2_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance2_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance2_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance2_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance2 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance2 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance2_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE20 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance20 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance20 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance20 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance20.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance20_0.out; then
	mv elevator-randomDownAcceptance20.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance20_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance20_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance20_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance20_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance20_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance20_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance20 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance20 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance20_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE21 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance21 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance21 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance21 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance21.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance21_0.out; then
	mv elevator-randomDownAcceptance21.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance21_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance21_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance21_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance21_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance21_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance21_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance21 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance21 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance21_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE22 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance22 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance22 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance22 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance22.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance22_0.out; then
	mv elevator-randomDownAcceptance22.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance22_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance22_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance22_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance22_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance22_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance22_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance22 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance22 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance22_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE23 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance23 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance23 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance23 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance23.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance23_0.out; then
	mv elevator-randomDownAcceptance23.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance23_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance23_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance23_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance23_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance23_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance23_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance23 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance23 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance23_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE24 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance24 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance24 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance24 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance24.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance24_0.out; then
	mv elevator-randomDownAcceptance24.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance24_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance24_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance24_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance24_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance24_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance24_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance24 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance24 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance24_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE25 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance25 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance25 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance25 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance25.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance25_0.out; then
	mv elevator-randomDownAcceptance25.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance25_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance25_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance25_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance25_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance25_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance25_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance25 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance25 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance25_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE26 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance26 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance26 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance26 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance26.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance26_0.out; then
	mv elevator-randomDownAcceptance26.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance26_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance26_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance26_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance26_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance26_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance26_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance26 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance26 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance26_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE27 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance27 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance27 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance27 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance27.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance27_0.out; then
	mv elevator-randomDownAcceptance27.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance27_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance27_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance27_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance27_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance27_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance27_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance27 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance27 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance27_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE28 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance28 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance28 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance28 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance28.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance28_0.out; then
	mv elevator-randomDownAcceptance28.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance28_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance28_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance28_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance28_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance28_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance28_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance28 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance28 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance28_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE29 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance29 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance29 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance29 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance29.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance29_0.out; then
	mv elevator-randomDownAcceptance29.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance29_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance29_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance29_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance29_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance29_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance29_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance29 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance29 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance29_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE3 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance3 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance3 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance3 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance3.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance3_0.out; then
	mv elevator-randomDownAcceptance3.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance3_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance3_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance3_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance3_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance3_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance3 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance3 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance3_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE30 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance30 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance30 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance30 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance30.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance30_0.out; then
	mv elevator-randomDownAcceptance30.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance30_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance30_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance30_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance30_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance30_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance30_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance30 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance30 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance30_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE31 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance31 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance31 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance31 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance31.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance31_0.out; then
	mv elevator-randomDownAcceptance31.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance31_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance31_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance31_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance31_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance31_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance31_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance31 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance31 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance31_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE32 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance32 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance32 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance32 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance32.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance32_0.out; then
	mv elevator-randomDownAcceptance32.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance32_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance32_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance32_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance32_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance32_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance32_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance32 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance32 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance32_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE33 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance33 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance33 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance33 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance33.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance33_0.out; then
	mv elevator-randomDownAcceptance33.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance33_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance33_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance33_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance33_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance33_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance33_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance33 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance33 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance33_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE34 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance34 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance34 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance34 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance34.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance34_0.out; then
	mv elevator-randomDownAcceptance34.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance34_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance34_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance34_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance34_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance34_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance34_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance34 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance34 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance34_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE35 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance35 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance35 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance35 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance35.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance35_0.out; then
	mv elevator-randomDownAcceptance35.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance35_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance35_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance35_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance35_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance35_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance35_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance35 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance35 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance35_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE36 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance36 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance36 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance36 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance36.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance36_0.out; then
	mv elevator-randomDownAcceptance36.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance36_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance36_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance36_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance36_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance36_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance36_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance36 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance36 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance36_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE37 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance37 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance37 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance37 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance37.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance37_0.out; then
	mv elevator-randomDownAcceptance37.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance37_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance37_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance37_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance37_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance37_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance37_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance37 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance37 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance37_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE38 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance38 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance38 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance38 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance38.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance38_0.out; then
	mv elevator-randomDownAcceptance38.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance38_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance38_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance38_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance38_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance38_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance38_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance38 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance38 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance38_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE39 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance39 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance39 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance39 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance39.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance39_0.out; then
	mv elevator-randomDownAcceptance39.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance39_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance39_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance39_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance39_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance39_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance39_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance39 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance39 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance39_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE4 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance4 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance4 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance4 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance4.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance4_0.out; then
	mv elevator-randomDownAcceptance4.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance4_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance4_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance4_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance4_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance4_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance4_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance4 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance4 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance4_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE5 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance5 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance5 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance5 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance5.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance5_0.out; then
	mv elevator-randomDownAcceptance5.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance5_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance5_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance5_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance5_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance5_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance5_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance5 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance5 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance5_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE6 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance6 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance6 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance6 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance6.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance6_0.out; then
	mv elevator-randomDownAcceptance6.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance6_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance6_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance6_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance6_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance6_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance6_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance6 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance6 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance6_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE7 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance7 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance7 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance7 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance7.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance7_0.out; then
	mv elevator-randomDownAcceptance7.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance7_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance7_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance7_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance7_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance7_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance7_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance7 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance7 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance7_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE8 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance8 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance8 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance8 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance8.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance8_0.out; then
	mv elevator-randomDownAcceptance8.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance8_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance8_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance8_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance8_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance8_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance8_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance8 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance8 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance8_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMDOWNACCEPTANCE9 ACCEPTANCE_TEST: 1 iterations
# randomDownAcceptance9 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomDownAcceptance9 0...
echo -e ACCEPTANCE_TEST: randomDownAcceptance9 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomDownAcceptance9.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance9_0.out; then
	mv elevator-randomDownAcceptance9.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance9_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance9_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance9_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance9_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance9_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomDownAcceptance9_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomDownAcceptance9 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomDownAcceptance9 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomDownAcceptance9_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE0 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance0 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance0 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance0 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance0.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance0_0.out; then
	mv elevator-randomUpAcceptance0.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance0_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance0_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance0_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance0_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance0_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance0_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance0 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance0 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance0_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE1 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance1 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance1 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance1 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance1.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance1_0.out; then
	mv elevator-randomUpAcceptance1.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance1_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance1_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance1_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance1_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance1_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance1_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance1 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance1 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance1_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE10 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance10 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance10 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance10 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance10.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance10_0.out; then
	mv elevator-randomUpAcceptance10.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance10_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance10_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance10_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance10_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance10_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance10_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance10 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance10 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance10_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE11 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance11 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance11 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance11 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance11.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance11_0.out; then
	mv elevator-randomUpAcceptance11.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance11_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance11_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance11_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance11_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance11_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance11_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance11 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance11 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance11_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE12 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance12 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance12 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance12 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance12.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance12_0.out; then
	mv elevator-randomUpAcceptance12.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance12_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance12_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance12_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance12_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance12_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance12_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance12 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance12 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance12_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE13 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance13 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance13 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance13 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance13.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance13_0.out; then
	mv elevator-randomUpAcceptance13.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance13_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance13_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance13_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance13_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance13_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance13_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance13 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance13 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance13_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE14 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance14 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance14 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance14 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance14.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance14_0.out; then
	mv elevator-randomUpAcceptance14.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance14_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance14_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance14_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance14_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance14_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance14_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance14 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance14 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance14_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE15 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance15 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance15 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance15 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance15.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance15_0.out; then
	mv elevator-randomUpAcceptance15.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance15_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance15_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance15_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance15_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance15_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance15_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance15 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance15 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance15_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE16 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance16 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance16 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance16 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance16.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance16_0.out; then
	mv elevator-randomUpAcceptance16.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance16_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance16_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance16_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance16_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance16_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance16_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance16 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance16 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance16_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE17 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance17 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance17 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance17 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance17.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance17_0.out; then
	mv elevator-randomUpAcceptance17.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance17_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance17_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance17_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance17_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance17_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance17_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance17 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance17 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance17_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE18 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance18 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance18 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance18 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance18.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance18_0.out; then
	mv elevator-randomUpAcceptance18.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance18_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance18_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance18_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance18_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance18_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance18_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance18 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance18 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance18_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE19 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance19 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance19 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance19 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance19.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance19_0.out; then
	mv elevator-randomUpAcceptance19.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance19_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance19_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance19_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance19_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance19_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance19_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance19 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance19 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance19_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE2 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance2 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance2 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance2 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance2.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance2_0.out; then
	mv elevator-randomUpAcceptance2.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance2_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance2_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance2_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance2_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance2_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance2_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance2 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance2 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance2_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE20 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance20 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance20 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance20 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance20.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance20_0.out; then
	mv elevator-randomUpAcceptance20.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance20_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance20_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance20_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance20_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance20_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance20_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance20 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance20 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance20_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE21 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance21 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance21 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance21 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance21.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance21_0.out; then
	mv elevator-randomUpAcceptance21.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance21_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance21_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance21_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance21_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance21_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance21_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance21 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance21 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance21_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE22 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance22 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance22 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance22 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance22.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance22_0.out; then
	mv elevator-randomUpAcceptance22.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance22_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance22_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance22_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance22_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance22_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance22_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance22 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance22 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance22_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE23 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance23 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance23 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance23 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance23.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance23_0.out; then
	mv elevator-randomUpAcceptance23.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance23_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance23_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance23_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance23_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance23_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance23_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance23 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance23 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance23_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE24 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance24 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance24 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance24 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance24.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance24_0.out; then
	mv elevator-randomUpAcceptance24.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance24_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance24_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance24_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance24_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance24_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance24_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance24 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance24 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance24_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE25 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance25 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance25 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance25 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance25.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance25_0.out; then
	mv elevator-randomUpAcceptance25.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance25_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance25_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance25_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance25_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance25_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance25_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance25 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance25 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance25_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE26 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance26 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance26 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance26 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance26.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance26_0.out; then
	mv elevator-randomUpAcceptance26.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance26_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance26_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance26_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance26_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance26_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance26_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance26 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance26 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance26_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE27 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance27 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance27 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance27 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance27.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance27_0.out; then
	mv elevator-randomUpAcceptance27.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance27_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance27_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance27_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance27_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance27_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance27_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance27 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance27 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance27_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE28 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance28 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance28 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance28 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance28.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance28_0.out; then
	mv elevator-randomUpAcceptance28.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance28_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance28_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance28_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance28_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance28_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance28_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance28 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance28 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance28_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE29 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance29 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance29 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance29 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance29.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance29_0.out; then
	mv elevator-randomUpAcceptance29.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance29_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance29_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance29_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance29_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance29_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance29_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance29 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance29 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance29_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE3 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance3 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance3 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance3 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance3.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance3_0.out; then
	mv elevator-randomUpAcceptance3.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance3_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance3_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance3_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance3_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance3_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance3_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance3 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance3 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance3_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE30 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance30 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance30 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance30 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance30.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance30_0.out; then
	mv elevator-randomUpAcceptance30.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance30_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance30_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance30_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance30_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance30_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance30_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance30 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance30 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance30_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE31 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance31 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance31 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance31 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance31.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance31_0.out; then
	mv elevator-randomUpAcceptance31.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance31_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance31_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance31_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance31_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance31_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance31_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance31 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance31 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance31_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE32 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance32 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance32 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance32 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance32.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance32_0.out; then
	mv elevator-randomUpAcceptance32.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance32_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance32_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance32_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance32_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance32_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance32_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance32 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance32 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance32_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE33 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance33 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance33 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance33 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance33.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance33_0.out; then
	mv elevator-randomUpAcceptance33.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance33_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance33_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance33_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance33_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance33_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance33_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance33 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance33 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance33_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE34 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance34 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance34 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance34 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance34.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance34_0.out; then
	mv elevator-randomUpAcceptance34.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance34_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance34_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance34_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance34_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance34_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance34_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance34 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance34 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance34_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE35 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance35 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance35 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance35 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance35.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance35_0.out; then
	mv elevator-randomUpAcceptance35.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance35_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance35_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance35_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance35_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance35_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance35_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance35 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance35 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance35_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE36 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance36 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance36 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance36 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance36.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance36_0.out; then
	mv elevator-randomUpAcceptance36.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance36_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance36_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance36_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance36_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance36_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance36_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance36 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance36 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance36_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE37 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance37 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance37 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance37 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance37.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance37_0.out; then
	mv elevator-randomUpAcceptance37.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance37_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance37_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance37_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance37_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance37_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance37_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance37 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance37 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance37_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE38 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance38 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance38 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance38 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance38.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance38_0.out; then
	mv elevator-randomUpAcceptance38.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance38_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance38_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance38_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance38_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance38_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance38_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance38 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance38 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance38_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE39 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance39 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance39 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance39 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance39.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance39_0.out; then
	mv elevator-randomUpAcceptance39.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance39_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance39_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance39_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance39_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance39_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance39_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance39 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance39 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance39_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE4 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance4 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance4 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance4 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance4.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance4_0.out; then
	mv elevator-randomUpAcceptance4.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance4_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance4_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance4_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance4_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance4_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance4_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance4 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance4 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance4_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE5 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance5 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance5 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance5 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance5.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance5_0.out; then
	mv elevator-randomUpAcceptance5.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance5_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance5_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance5_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance5_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance5_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance5_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance5 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance5 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance5_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE6 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance6 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance6 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance6 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance6.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance6_0.out; then
	mv elevator-randomUpAcceptance6.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance6_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance6_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance6_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance6_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance6_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance6_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance6 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance6 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance6_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE7 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance7 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance7 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance7 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance7.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance7_0.out; then
	mv elevator-randomUpAcceptance7.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance7_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance7_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance7_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance7_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance7_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance7_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance7 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance7 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance7_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE8 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance8 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance8 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance8 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance8.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance8_0.out; then
	mv elevator-randomUpAcceptance8.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance8_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance8_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance8_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance8_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance8_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance8_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance8 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance8 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance8_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# RANDOMUPACCEPTANCE9 ACCEPTANCE_TEST: 1 iterations
# randomUpAcceptance9 acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: randomUpAcceptance9 0...
echo -e ACCEPTANCE_TEST: randomUpAcceptance9 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/randomUpAcceptance9.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance9_0.out; then
	mv elevator-randomUpAcceptance9.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance9_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance9_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance9_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance9_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance9_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/randomUpAcceptance9_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: randomUpAcceptance9 0 Acceptance Test did not run.
	echo -e ...FAILURE: randomUpAcceptance9 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/randomUpAcceptance9_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

# UPPEAK_FINAL ACCEPTANCE_TEST: 1 iterations
# uppeak_final acceptance_test 0
echo -e
echo -e ACCEPTANCE_TEST: uppeak_final 0...
echo -e ACCEPTANCE_TEST: uppeak_final 0...>>accept_out.txt
if java simulator.framework.Elevator -pf ../../portfolio_grp11/acceptance_test/uppeak_final.pass -b 200 -fs 5.0 -monitor RuntimeRequirementsMonitor -head ../../portfolio_grp11/scripts/grp11.head &> ../../portfolio_grp11/acceptance_test/out/uppeak_final_0.out; then
	mv elevator-uppeak_final.pass-0.stats ../../portfolio_grp11/acceptance_test/stats/uppeak_final_0.stats
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.
	echo -e ...SUCCESS:  0 Acceptance Test ran successfully.>>accept_out.txt
	STR1=$(grep "Delivered:" ../../portfolio_grp11/acceptance_test/stats/uppeak_final_0.stats)
	STR2=$(grep "Stranded:" ../../portfolio_grp11/acceptance_test/stats/uppeak_final_0.stats)
	STR3=$(grep "Total:" ../../portfolio_grp11/acceptance_test/stats/uppeak_final_0.stats)
	STR4=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/stats/uppeak_final_0.stats)
	STR5=$(grep "RuntimeMonitor generated" ../../portfolio_grp11/acceptance_test/stats/uppeak_final_0.stats)
	echo -e ......$STR1
	echo -e ......$STR2
	echo -e ......$STR3
	echo -e ......$STR4
	echo -e ......$STR5
	echo -e ......$STR1>>accept_out.txt
	echo -e ......$STR2>>accept_out.txt
	echo -e ......$STR3>>accept_out.txt
	echo -e ......$STR4>>accept_out.txt
	echo -e ......$STR5>>accept_out.txt
else
	echo -e ...FAILURE: uppeak_final 0 Acceptance Test did not run.
	echo -e ...FAILURE: uppeak_final 0 Acceptance Test did not run.>>accept_out.txt
	STR6=$(grep "RandomSeed =" ../../portfolio_grp11/acceptance_test/out/uppeak_final_0.out)
	echo -e ......$STR6
	echo -e ......$STR6>>accept_out.txt
fi

cd ../../portfolio_grp11/scripts/
python make_test_log.py -acceptance
