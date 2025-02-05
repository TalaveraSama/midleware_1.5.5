#!/bin/bash

echo "🛑 Deteniendo servicios de base de datos..."
sudo systemctl stop mysql.service 2>/dev/null
sudo systemctl stop mariadb.service 2>/dev/null

echo "🗑️ Eliminando MySQL/MariaDB..."
sudo apt purge -y mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-* mariadb-server 2>/dev/null
sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql 2>/dev/null
sudo apt autoremove -y && sudo apt autoclean -y

echo "🛑 Matando procesos de Xtream Codes..."
sudo pkill -u xtreamcodes 2>/dev/null
sudo kill $(ps aux | grep '[p]hp' | awk '{print $2}') 2>/dev/null
sudo kill $(ps aux | grep '[n]ginx' | awk '{print $2}') 2>/dev/null

echo "🗑️ Eliminando archivos y configuraciones de Xtream Codes..."
sudo chattr -i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb 2>/dev/null
sudo rm -rf /home/xtreamcodes/iptv_xtream_codes/tmp/* /home/xtreamcodes/iptv_xtream_codes/streams/* 2>/dev/null
sudo umount -f /home/xtreamcodes/iptv_xtream_codes/{streams,tmp} 2>/dev/null
sudo sed -i '/xtreamcodes/d' /etc/fstab /etc/crontab /etc/sudoers
sudo deluser xtreamcodes 2>/dev/null
sudo groupdel xtreamcodes 2>/dev/null
sudo chown root:root -R /home/xtreamcodes 2>/dev/null
sudo chmod -R 0644 /home/xtreamcodes 2>/dev/null

echo "🛑 Matando procesos de StreamCreed..."
sudo pkill -u streamcreed 2>/dev/null
sudo kill $(ps aux | grep '[p]hp' | awk '{print $2}') 2>/dev/null
sudo kill $(ps aux | grep '[n]ginx' | awk '{print $2}') 2>/dev/null

echo "🗑️ Eliminando archivos y configuraciones de StreamCreed..."
sudo rm -rf /home/streamcreed/tmp/* /home/streamcreed/streams/* 2>/dev/null
sudo umount -f /home/streamcreed/{streams,tmp} 2>/dev/null
sudo sed -i '/streamcreed/d' /etc/fstab /etc/crontab /etc/sudoers
sudo deluser streamcreed 2>/dev/null
sudo groupdel streamcreed 2>/dev/null
sudo chown root:root -R /home/streamcreed 2>/dev/null
sudo chmod -R 0644 /home/streamcreed 2>/dev/null

echo "🛑 Eliminando bloqueos y paquetes huérfanos..."
sudo rm -f /var/lib/dpkg/lock-frontend /var/cache/apt/archives/lock /var/lib/dpkg/lock 2>/dev/null
sudo apt-get remove -y libcurl3 2>/dev/null
sudo apt autoremove -y && sudo apt autoclean -y

echo "✅ Proceso completado. Xtream UI / Xtream Codes / StreamCreed han sido eliminados."
