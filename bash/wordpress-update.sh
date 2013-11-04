#!/bin/sh

# Unduh wordpress terbaru
wget http://wordpress.org/latest.tar.gz -O wp.tar.gz

# Backup direktori
mv wordpress wordpress.old

# Ekstrak wordpress terbaru
tar xvf wp.tar.gz

# Salin berkas konfigurasi
cp wordpress.old/wp-config.php wordpress

# Salin berkas-berkas pendukung
rsync -avz wordpress.old/wp-content/uploads/ wordpress/wp-content/uploads/
rsync -avz wordpress.old/wp-content/themes/ wordpress/wp-content/themes/
rsync -avz wordpress.old/wp-content/plugins/ wordpress/wp-content/plugins/

# Paketkan backup
tar cf wordpress-`date '%Y%m%d'`.tar wordpress.old/
bzip2 -9 wordpress-`date '%Y%m%d'`.tar

# Hapus folder  backup
rm -rf wordpress.old

