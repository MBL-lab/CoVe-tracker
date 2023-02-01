#!/bin/bash

# Author : Murali Aadhitya M S
# Date Created : Mon Nov 29 17:44:26 IST 2021
# Date Modified : 17 January 2022 14:18:23 (Version 5)
# 	Execute in the following manner
# 	(script) (Python files) (folder path of sequences) (Metdata path) (start number) (end number)
#	Example:
#		./../auto_job_subm.sh /home/murali/Pamser/test_auto/Python_files_with_db_5/ /home/murali/Pamser/test_auto/ /home/murali/Pamser/test_auto/Metadata_3Jul2021.csv 1 4

scriptfiles=$1
seqfolder=$2
metadatafile=$3
startjob=$4
endjob=$5
echo ""
date

for (( i=$startjob; i<=$endjob; i+=1)) ; 
do
	echo $i"subm"
	temp=$1"*"
	temp2=$2$i"_gisaid*"
	temp3=`ls $temp2`
	temp4=`date`
	#echo temp2 $temp2
	#echo temp3 $temp3
	echo ""
	mkdir $i"subm"
	cd $i"subm"
	cp -r $temp .
	#echo ""
	nohup python3.7 10code_analysis_date_crtd.py $temp3 $3 > "err_subm"$i".out" 2>&1 &
	echo $i"subm - "$!" - "$temp4 >> ../pid.txt
	#echo ""
	pwd
	echo ""
	cd ..
	sleep 1s
done

date
echo ""