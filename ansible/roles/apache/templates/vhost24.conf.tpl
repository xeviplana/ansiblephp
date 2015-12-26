# Default Apache virtualhost template

<VirtualHost *:80>
ServerAdmin webmaster@localhost
DocumentRoot {{ apache.docroot }}
ServerName {{ apache.servername }}
ServerAlias www.{{ apache.servername }}

<Directory {{ apache.docroot }}>
AllowOverride All
Options FollowSymLinks
Order allow,deny
Allow from all

<IfModule mod_rewrite.c>
    Options -MultiViews
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.*)$ app.php [QSA,L]
</IfModule>
</Directory>

ErrorLog /var/log/apache2/error.log
CustomLog /var/log/apache2/access.log combined
</VirtualHost>