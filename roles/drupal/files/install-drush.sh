if [ ! -d /root/.composer/vendor/drush ]; then
  /usr/local/bin/composer global require drush/drush:6.*
fi
if [ ! -h /usr/local/bin/drush ]; then
  ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush
fi
