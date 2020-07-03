ssh root@cdn-westus2-01 mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-westus2-01:/var/www/cdn.galenguyer.com/
ssh root@cdn-westus2-01 chown www-data:www-data /var/www -R

ssh root@cdn-eastus-01 mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-eastus-01:/var/www/cdn.galenguyer.com/
ssh root@cdn-eastus-01 chown www-data:www-data /var/www -R

ssh root@cdn-uksouth-01 mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-uksouth-01:/var/www/cdn.galenguyer.com/
ssh root@cdn-uksouth-01 chown www-data:www-data /var/www -R

ssh root@cdn-australiaeast-01 mkdir -p /var/www/cdn.galenguyer.com/
rsync -avz --delete -e ssh /data/nginx/cdn/ root@cdn-australiaeast-01:/var/www/cdn.galenguyer.com/
ssh root@cdn-australiaeast-01 chown www-data:www-data /var/www -R
