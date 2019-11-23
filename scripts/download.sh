# This script should download the file specified in the first argument ($1), place it in the directory specified in the second argument, 
# and *optionally* uncompress the downloaded file with gunzip if the third argument contains the word "yes".

link=$1
dir=$2
arg=$3

if ["${url}"=="$1"]
then
	echo "Descarga de los archivos de secuencia..."
	wget -P $2 $1
	echo	
	

else
	echo "Descarga de la base de datos de contaminantes"
	wget -P $2 $1
	gunzip -k $2/contaminants.fasta.gz
fi


