ssh root@cdn-galenguyer-01.westus2.cloudapp.azure.com mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-galenguyer-01.westus2.cloudapp.azure.com:/var/www/cdn.galenguyer.com/
ssh root@cdn-galenguyer-01.westus2.cloudapp.azure.com chown www-data:www-data /var/www -R

ssh root@cdn-galenguyer-01.eastus.cloudapp.azure.com mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-galenguyer-01.eastus.cloudapp.azure.com:/var/www/cdn.galenguyer.com/
ssh root@cdn-galenguyer-01.eastus.cloudapp.azure.com chown www-data:www-data /var/www -R

ssh root@cdn-galenguyer-01.uksouth.cloudapp.azure.com mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-galenguyer-01.uksouth.cloudapp.azure.com:/var/www/cdn.galenguyer.com/
ssh root@cdn-galenguyer-01.uksouth.cloudapp.azure.com chown www-data:www-data /var/www -R

ssh root@cdn-galenguyer-01.australiaeast.cloudapp.azure.com mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-galenguyer-01.australiaeast.cloudapp.azure.com:/var/www/cdn.galenguyer.com/
ssh root@cdn-galenguyer-01.australiaeast.cloudapp.azure.com chown www-data:www-data /var/www -R
