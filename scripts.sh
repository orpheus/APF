#!/bin/bash

httpd () {
  sudo vi /etc/apache2/httpd.conf
}

conf () {
  sudo vi /etc/apache2/other/APFapp.conf
}

start () {
  sudo apachectl start
}

stop () {
  sudo apachectl stop
}

restart () {
  sudo apachectl -k restart
}

active () {
  . ./venv/bin/activate
}

wstart () {
  mod_wsgi-express start-server APF.wsgi
}

wlog () {
  cat /var/tmp/mod_wsgi-localhost:8000:503/error_log
}

