 #!/bin/bash

#catch errors
set -eu

#read in the fastq file for mapping
read -p "Enter a path to the fastq file: " file

#check if the file exists or is empty

if [[ ! -e ${file} ]]
then 
	echo "file does not exist"

elif [[ ! -s ${file} ]]
then
	echo "file is empty"

else
	echo "file is in the right format"
	echo "Proceeding"

fi

output="output.paf"

echo " initiating assembly"

echo " Keep calm"

minimap2 -x ava-ont ${file} ${file} >  ${output}

echo " All-vs-All overlap complete"

echo " Initiating the miniasm"

output2="output.gfa"

miniasm -f ${file} ${output} > ${output2}

echo "Graph assembly complete"

echo "initiating the consensus step"

minipolish ${file} ${output2} > polished.gfa

#converts the gfa format to fasta format

awk '$1 ~/S/ {print ">"$2"\n"$3}' polished.gfa > polished.fasta

echo " Successfully assembled" 
