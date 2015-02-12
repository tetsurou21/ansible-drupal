#!/bin/sh
if [ -f /usr/local/bin/composer ]; then
  exit 0
fi
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
