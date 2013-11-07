#!/bin/sh

# Unduh wordpress terbaru
wget http://wordpress.org/latest.tar.gz -O wp.tar.gz

# Backup direktori
mv wordpress wordpress.old

# Ekstrak wordpress terbaru
tar xvf wp.tar.gz

# Salin berkas konfigurasi
cp wordpress.old/wp-config.php wordpress

# Sesuaikan hak akses berkas konfigurasi
chown nobody.nogroup wordpress/wp-config.php
chmod 644 wordpress/wp-config.php

# Salin berkas-berkas pendukung
rsync -avz wordpress.old/wp-content/uploads/ wordpress/wp-content/uploads/
rsync -avz wordpress.old/wp-content/themes/ wordpress/wp-content/themes/
rsync -avz wordpress.old/wp-content/plugins/ wordpress/wp-content/plugins/

# Sesuaikan hak akses berkas-berkas pendukung
chown -R nobody.nogroup wordpress/wp-content/

# Paketkan backup
tar cf wordpress-`date '+%Y%m%d'`.tar wordpress.old/
bzip2 -9 wordpress-`date '+%Y%m%d'`.tar

# Hapus folder  backup
rm -rf wordpress.old

# Hapus berkas wordpress
rm wp.tar.gz
