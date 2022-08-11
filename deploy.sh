#!/bin/bash

composer install
./vendor/bin/drush -y updb
./vendor/bin/drush -y cim
./vendor/bin/drush cr