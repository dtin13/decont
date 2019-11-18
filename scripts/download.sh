# This script should download the file specified in the first argument ($1), place it in the directory specified in the second argument, 
# and *optionally* uncompress the downloaded file with gunzip if the third argument contains the word "yes".

url=$1
dir=$2


echo "Descarga de los archivos de secuencia..."
wget -P $2 $1
echo "el archivo $url se descargó correctamente"
echo

echo "Descarga de la base de datos de contaminantes"
wget -O $2/contaminants.fasta.gz $1
echo "Descompresión del fichero de contaminantes..."
gunzip -k res/contaminants.fasta.gz

