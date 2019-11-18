# This script should download the file specified in the first argument ($1), place it in the directory specified in the second argument, 
# and *optionally* uncompress the downloaded file with gunzip if the third argument contains the word "yes".

echo "Descarga de los archivos de secuencia..."
for url in $(cat data/urls)
do
wget -P data $url
echo "el archivo $url se descargó correctamente"
echo
done 

echo "Descarga de la base de datos de contaminantes"
wget -O res/contaminants.fasta.gz https://bioinformatics.cnio.es/data/courses/decont/contaminants.fasta.gz
echo "Descompresión del fichero de contaminantes..."
gunzip -k res/contaminants.fasta.gz

