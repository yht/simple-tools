#!/bin/sh

# Definisi
TGL=`date +%Y%m%d`
PAKET=wordpress
BACKUP=$PAKET-$TGL

# Unduh wordpress terbaru
wget http://wordpress.org/latest.tar.gz -O $PAKET.tar.gz

# Backup direktori
mv $PAKET $BACKUP

# Ekstrak wordpress terbaru
tar xvf $PAKET.tar.gz

# Salin berkas konfigurasi
cp $BACKUP/wp-config.php $PAKET

# Sesuaikan hak akses berkas konfigurasi
chown nobody.nogroup wordpress/wp-config.php
chmod 644 wordpress/wp-config.php

# Salin berkas-berkas pendukung
rsync -avz $BACKUP/wp-content/uploads/ $PAKET/wp-content/uploads/
rsync -avz $BACKUP/wp-content/themes/ $PAKET/wp-content/themes/
rsync -avz $BACKUP/wp-content/plugins/ $PAKET/wp-content/plugins/

# Sesuaikan hak akses berkas-berkas pendukung
chown -R nobody.nogroup wordpress/wp-content/

# Paketkan backup
tar -cvjf $BACKUP.tar.bz2 $BACKUP

# Hapus folder backup
rm -rf $BACKUP

# Hapus berkas wordpress
rm $PAKET.tar.gz
