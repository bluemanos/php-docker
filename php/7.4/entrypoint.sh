#!/bin/bash
set -e

# Provide github token if you are using composer a lot in non-interactive mode
# Otherwise one day it will get stuck with request for authorization
# https://github.com/settings/tokens
if [[ ! -z "$COMPOSER_GITHUB" ]]
then
  composer config --global github-oauth.github.com "$COMPOSER_GITHUB"
fi

# If $TIMEZONE variable is passed to the image - it will set system timezone
# and php.ini date.timezone value as well
# Overwise the default system Etc/UTC timezone will be used
if [[ ! -z "$TIMEZONE" ]]
then
  echo "$TIMEZONE" > /etc/timezone
  dpkg-reconfigure -f noninteractive tzdata
fi
echo "date.timezone=`cat /etc/timezone`" > /usr/local/etc/php/conf.d/timezone.ini

exec "$@"
