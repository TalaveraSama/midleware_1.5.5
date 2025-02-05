📌 1. Descarga el archivo desde Bitbucket

Si quieres descargarlo directamente en tu servidor o PC, usa wget o curl:

wget https://raw.githubusercontent.com/TalaveraSama/midleware_1.5.5/main/remove_panels_xtreamui.sh

o

curl -O https://raw.githubusercontent.com/TalaveraSama/midleware_1.5.5/main/remove_panels_xtreamui.sh

📌 2. Otorga permisos de ejecución

Después de descargarlo, dale permisos de ejecución para que se pueda correr:

chmod +x remove_panels_xtreamui.sh

📌 3. Ejecuta el script

Ejecuta el archivo con:

./remove_panels_xtreamui.sh

Si necesitas ejecutarlo con permisos de superusuario:

sudo ./remove_panels_xtreamui.sh

🔹 Notas importantes

    Revisa el contenido antes de ejecutarlo
    Abre el script para ver qué hace realmente antes de ejecutarlo:

cat remove_panels_xtreamui.sh

Asegúrate de que tu sistema tiene bash instalado
Si hay errores, prueba ejecutarlo con:

    bash remove_panels_xtreamui.sh

    Si el script necesita dependencias
    Algunos scripts requieren paquetes adicionales, revisa si necesitas instalar algo antes de ejecutarlo.


-------------------------------------------------------------------------
🚀 Explicación del Script

✔ Detiene los servicios de MySQL/MariaDB
✔ Elimina completamente los archivos y configuraciones
✔ Mata procesos en ejecución
✔ Limpia usuarios y grupos del sistema
✔ Borra cualquier rastro en /etc/fstab, /etc/crontab y /etc/sudoers
✔ Limpia paquetes innecesarios y bloqueos

Después de ejecutarlo, reinicia el servidor


