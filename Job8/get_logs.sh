Date=$(date +%d-%m-%v-%H:%M)
fichier="number_connection-$Date"
grep "MURDOCKs" /var/log/system.log > a
# ICI mettre la commande comptant les lignes en les rentrant dans b
tar -czvf $fichier.tar.gz b
wc l a && a > b && b > Backup
