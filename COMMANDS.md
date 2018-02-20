# Commands to Run this thing

## Certbot

Certbot needs to run before `docker-compose up` so the port binding doesn't
interfere with the webserver.

```sh
  docker-compose run --rm \
    -p 80:80 -p 443:443 \
    certbot certonly \
      --standalone \
      --agree-tos \
      -m jdoe@example.com \
      -d example.com,www.example.com
```

# Docker Compose Up

Now it's time to get the engine started.

```sh
  docker-compose up
```

# Wordpress Multisite Install

This is the networks default site spin up.

```sh
  docker-compose run --rm \
    wp core multisite-install \
      --url=https://alpenx.org \
      --title=AlpenX \
      --admin_user=admin \
      --admin_email=jdoe@example.com \
      --admin_password=strongpassword \
      --skip-email
```

# Wordpress Plugin Install

This installs all the default plugins to the multisite network.

```sh
  docker-compose run --rm \
    wp plugin install \
      autoptimize \
      cache-enabler \
      tiny-compress-images \
      rocket-lazy-load \
      wp-optimize \
      wordpress-mu-domain-mapping \
      --activate-network
```

## Cron Job



```sh
  docker-compose run --rm \
    wp sh -c \
      "wp db export --add-drop-table - | gzip -c > wp-content/database.sql.gz"
```

## Restic

Initial respository setup.

```sh
  docker-compose run --rm \
    restic \
      restic init
```

Listing snapshots.

```sh
  docker-compose run --rm \
    restic \
      restic snapshots
```

Restoring a snapshot.

```sh
  docker-compose run --rm \
    restic \
      restic restore bfb511cf \
        --target /
```

Some comments from last night:


### DIGITAL OCEAN ###
Create a droplet

### might not be necessary ###
apt-get update
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable


adduser tstachl
gpasswd -a tstachl sudo
su - tstachl

mkdir .ssh
chmod 700 .ssh/
vim .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
exit

vi /etc/ssh/sshd_config

### AUTHY ###
https://www.authy.com/integrations/ssh/
wget https://raw.githubusercontent.com/authy/authy-ssh/master/authy-ssh
chmod +x authy-ssh
sudo bash authy-ssh install /usr/local/bin
Enter API Key
sudo authy-ssh enable tstachl
authy-ssh test
sudo service ssh restart

### DOCKER ###
fix permissions for docker
sudo usermod -aG docker ${USER}
su - ${USER}

### COMPOSE ###
clone repo
create .env file
CLOUDFLARE fix up dns records (can take a few minutes)
run certbot

docker-compose up
docker-compose down
docker-compose up

wp core multisite-install
wp plugin install


crontab -e
0 3 * * * (cd /home/user/compose; /usr/local/bin/docker-compose run --rm wp sh -c "wp db export --add-drop-table - | gzip -c > wp-content/database.sql.gz")