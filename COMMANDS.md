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
      -m admin@example.com \
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
      --url=https://example.com \
      --title=Example \
      --admin_user=admin \
      --admin_email=admin@example.com \
      --admin_password=superSecret \
      --skip-email \
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
      restic restore {SNAPSHOT_ID} \
        --target /
```