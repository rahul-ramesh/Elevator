# duplicate_file.bash
# 18-649 Distributed Embedded Systems
# Group 11
# Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
# !@

# duplicate_file.bash
# Create individual files for each team member
# 	argument 1: file location ("../traceability")
#	argument 2: file name (no extension) ("scen_req_traceability")
#	argument 3: extension (".xls")

rahul="rahulram"
danny="ddsantor"
david="davitho"
jacob="jialiant"

# $1 - file location
# $2 - infile name "somthing"
# $3 - infile/outfile extension ".txt"
infile=$1'/'$2$3
outfile_base=$1'/'$2'_'

echo COPY $infile
if [ -e $infile ]; then
	# loop from input argument 1 to input argument 2
	for i in `seq 1 4`;
	do
		# create output filename based on input arguments
		if [ $i -eq '1' ]; then
			extension=$rahul
		elif [ $i -eq '2' ]; then
			extension=$danny
		elif [ $i -eq '3' ]; then
			extension=$david
		elif [ $i -eq '4' ]; then
			extension=$jacob
		fi
		filename=$outfile_base$extension$3

		# CREATE FILE 
		# check to see if desired output file already exists
		if [ -e $filename ]; then
			echo $filename ALREADY EXISTS
		#create new file
		else
			echo CREATING $filename
			cp $infile $filename
		fi
	done 
else
	echo $infile DOES NOT EXIST
	echo UNABLE TO COPY
	echo ABORT.
fi



