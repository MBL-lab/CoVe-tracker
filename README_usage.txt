'''
	Author	-	Murali Aadhitya M S
	Created	-	Wed Jun 22 00:47:59 IST 2022
'''

			
Steps:

1. Download sequences from GISAID under 'Input for AUGUR Pipeline'

2. Copy all *.tar files into one folder

3. Inside folder
	> ls *.tar > extract.sh
	> sed -i 's/^/tar -xvf /g' extract.sh
	> chmod 777 extract.sh
	> ./extract.sh

4. All fasta and metadata files will be extracted

5. Convert metadata from tsv to csv
	> cat *.tsv | tr "," ";" | tr "\t" "," > Metadata_(MONTH).csv

6. Delete metadata.tsv
	> rm *tsv

7. Format all fasta files
	> python3 ../file_formatter_v2.py 

8. Compile multiple fasta files together to contain ~40k sequences per file
	> cat (file1.fasta) (file2.fasta) (file3.fasta) (file4.fasta)... > (MONTH_PART).fasta
	> rm (file1.fasta) (file2.fasta) 

9. Within seqs/ folder, split masterfile into required size
	> cd seqs/
	> python3 ../splitseq.py (filename.fasta) (Month_of_fasta_files) (No._of_seqs_per_file)

10. Create and navigate to (MONTH_PART) folder, into Level B
	> cd (MONTH_PART)/ 

11. Execute auto_job_subm.sh
	# if submitting only one job, enter same number for start and end
	> /path/to/auto_job_subm_V10.sh /absolute/path/to/Python_files_V10/ /absolute/path/to/seqs/ /absolute/path/to/Metadata.csv (start_number) (end_number)

12. Check status of all jobs by executing following command inside ALL subm folders
	
	> wc -l *bm/Pro* 
        > wc -l *bm/Ana*

