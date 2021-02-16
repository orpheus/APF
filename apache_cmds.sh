#!/bin/bash

conf () {
  vi /usr/local/etc/httpd/httpd.conf
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

