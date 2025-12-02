server {
	listen 80;
	listen [::]:80;

	root /var/www/agenda;

	# Orden de archivos por defecto.
	index index.dpl index.html;
	include mime.types;
	types {
		text/html dpl;
	}

	server_name www.miagenda.com;

	location / {
		try_files $uri $uri/ =404;
	}

	location ~* /([[:alnum:]]+\.jpe?g)$ {
		try_files /imagenes/$1.$2 =404;
	}

	location /img/ {
		alias /var/www/agenda/img/;

		# Forzar tipo de contenido image/png para archivos .img
		types {
			image/png img;
		}
	}

	location = /secreto {
		rewrite ^ /secreto/interno/secreto.html break;
	}

	location = /secreto/ {
		rewrite ^ /secreto/interno/secreto.html break;
	}

	# Index por defecto dentro del directorio /secreto
	location /secreto/ {
		alias /var/www/agenda/secreto/;
		index secreto.html;
		try_files $uri $uri/ =404;
	}

	# Página de error 404 personalizada.
	error_page 404 /internos/p404.html;

	# Bloque location marcado como internal.
	location /internos {
		internal;
	}
}
