# YA-drupal-docker-starter
Yet Another Drupal Docker Starter

## Services used

- [MySql](https://hub.docker.com/_/mysql)
- [PhpMyAdmin](https://hub.docker.com/_/phpmyadmin)
- [Traefik](https://hub.docker.com/_/traefik)
- [Apache](https://hub.docker.com/r/wodby/apache)
- [Php](https://hub.docker.com/r/ggggino/drupal-starter)
- [Mailhog](https://hub.docker.com/r/mailhog/mailhog/)

## Create local 

This Makefile helps to recreate an ideal folder structure to run locally a drupal

> The first step is copy this makefile in the project root.

## Available commands

Available commands to be launched in the project root **after copying the Makefile into it**.

### make generate-folders

Command: `make generate-folders`

This is a command that needs to be launched only one time, if launched more than once it fails.
Move every drupal file in the docroot

Transform this folder structure
```
<projectRoot>
|_ web
|_ config
|_ dev
```
in
```
<projectRoot>
|_ docroot
| |_ web
| |_ config
| |_ dev
|_ docker-compose.json
```

### make generate-settings

Command: `make generate-settings`

This command copy the `dev/settings.php` in the `./docroot/web/sites/default`

### make generate-docker-compose

Command: `make generate-docker-compose`

This command copy the `dev/docker-compose.yml` in the `./`

### make generate-tmp-private

Command: `make generate-tmp-private`

This command creates the tmp and private folders

### make generate-webpack

Command: `make FOLDER="pippo" generate-webpack`

This command clone the webpack repository and removes the .git.
The FOLDER argument is the relative/absolute destination folder es. "prova", "src", "../pippo", "/root"

### make

Command: `make`

This command executes the previous command in this order

- `make generate-folders`
- `make generate-settings`
- `make generate-docker-compose`

### xDebug

To use xdebug with VSCode 

- In the docker-compose.json change the local ip of the machine in the PHP_XDEBUG_CLIENT_HOST property
- Click on "Run and Debug on the left aside"
- Click on the gear "Open launch.json"
- Add to the array of configurations.
 ```
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9000,
            "pathMappings": {
                "/var/www/html": "${workspaceFolder}/docroot"
            }
        }
 ```
 
- Click "Start Debugging"

### Example complete command

> git clone git@bitbucket.org:corilla/aeroclub-tassignano-sito-2020.git aeroclubprova && cd aeroclubprova && cp dev/Makefile ./ && make all