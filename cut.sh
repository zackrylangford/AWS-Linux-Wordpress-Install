
#Configure Apache for Wordpress

echo "Configuring Apache for Wordpress" 
echo -e $(touch /home/ec2-user/wordpress.conf.original)

echo "
<VirtualHost *:80>
    DocumentRoot /var/www/html
    <Directory /var/www/html>
         Options FollowSymLinks
         AllowOverride Limit Options FileInfo
         DirectoryIndex index.php
         Require all granted
    </Directory>
    <Directory /var/www/html/wp-content>
         Options FollowSymLinks
         Require all granted
    </Directory>
    </VirtualHost>" > /home/ec2-user/wordpress.conf.original
echo -e $(sudo cp /home/ec2-user/wordpress.conf.original /etc//sites-available/wordpress.conf)
echo -e $(sudo rm /home/ec2-user/wordpress.conf.original)
echo -e $(sudo systemctl restart httpd)
echo "Apache configured successfully" 