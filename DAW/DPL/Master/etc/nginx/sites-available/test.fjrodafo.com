server {
	listen 8080;
	listen [::]:8080;

	root /var/www/test;

	index index.html index.htm index.nginx-debian.html;

	server_name test.fjrodafo.com;

	location / {
		try_files $uri $uri/ =404;
	}

	location ~ \.php$ {
		#include snippets/fastcgi-php.conf;

		#fastcgi_pass unix:/run/php/php8.2-fpm.sock;
		#fastcgi_pass 127.0.0.1:9000;

		proxy_pass http://127.0.0.1:9000;
	}
}
