# Commands to Run this thing
# Certbot
Create the certs
`docker-compose run --rm certbot certonly --standalone --agree-tos -m thomas@stachl.me -d alpenx.org`

Create the inital wordpress install
`docker-compose run --rm wp core install --url=https://alpenx.org --title=AlpenX --admin_user=admin --admin_email=thomas@alpenx.org --admin_password=admin --skip-email`
