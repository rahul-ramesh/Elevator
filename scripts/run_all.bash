# run_all.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

echo 
echo CLEAN UP...
make clean &> cleanup.out

echo REMAKE...
DIDMAKE=0
if make &> remake.out; then
	echo Re-make successful
	DIDMAKE=1
else
	echo Re-make unsuccessful. Abort.
fi

if DIDMAKE==1; then
	./run_unit.bash
	./run_integration.bash
	./run_accept.bash
fi
