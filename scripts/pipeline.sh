#Download all the files specified in data/filenames
for url in $(cat data/urls) #TODO
do
    bash scripts/download.sh $url data
done
echo

# Download the contaminants fasta file, and uncompress it
bash scripts/download.sh https://bioinformatics.cnio.es/data/courses/decont/contaminants.fasta.gz res yes #TODO
echo

# Index the contaminants file
bash scripts/index.sh res/contaminants.fasta res/contaminants_idx
echo

# Merge the samples into a single file
for sid in $(ls data/*.fastq.gz|cut -d "-" -f1|sed 's:data/::'|sort |uniq ) #TODO
do
    bash scripts/merge_fastqs.sh data out/merged $sid
done
echo

mkdir -p out/trimmed
mkdir -p log/cutadapt
for file in $(ls out/merged/*|sed 's:out/merged/::'|sed 's:.fastq.gz::')
do
cutadapt -m 18 -a TGGAATTCTCGGGTGCCAAGG --discard-untrimmed -o out/trimmed/$file.trimmed.fastq.gz out/merged/$file.fastq.gz > log/cutadapt/$file.log
done
echo


#TODO: run STAR for all trimmed files
for fname in out/trimmed/*.fastq.gz
do
    # you will need to obtain the sample ID from the filename
    sid=#TODO
    # mkdir -p out/star/$sid
    # STAR --runThreadN 4 --genomeDir res/contaminants_idx --outReadsUnmapped Fastx --readFilesIn <input_file> --readFilesCommand zcat --outFileNamePrefix <output_directory>
done 

# TODO: create a log file containing information from cutadapt and star logs
# (this should be a single log file, and information should be *appended* to it on each run)
# - cutadapt: Reads with adapters and total basepairs
# - star: Percentages of uniquely mapped reads, reads mapped to multiple loci, and to too many loci
