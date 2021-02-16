# APF
Apache Python Flask

## Install Dependencies

1. Install Apache
2. Install Python
3. Install wsgi (via pip)
3. Install Flask (via pip)

4. Create Virtual Environment `python3 -m venv venv`
5. Active Environment: `. venv/bin/activate` (to deactivate, type
   `deactivate`

## Configure Local Apache

1. Go into your apache config (`httpd.conf`) and update the values as
   described [here](https://medium.com/@crmcmullen/how-to-install-apache-on-macos-10-13-high-sierra-and-10-14-mojave-using-homebrew-3cb6bf6e3cd4)

2. Create an apache config file for your application. See
   [docs](https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/)

```
<VirtualHost *>
     # Add machine's IP address (use ifconfig command)
     ServerName 45.132.227.101
     # Give an alias to to start your website url with
     WSGIScriptAlias / ~/code/github/orphues/python/APF/app.wsgi
     <Directory ~/code/github/orphues/python/APF>
     		# set permissions as per apache2.conf file
        Order deny,allow
        AllowOverride None
        Allow from all
     </Directory>
     # ErrorLog ${APACHE_LOG_DIR}/error.log
     # LogLevel warn
     # CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

3. Add wsgi module to your apache config `httpd.conf`. Run this command to and add it's output to your `httpd.conf`: `mod_wsgi-express module-config`
If that command doesn't exist, you need to find out where the wsgi
module lives in your computer and add: `LoadModule wsgi_module
/path/to/module.so`

4. in your `httpd.conf`, change `Require all none` to `Require all
   granted` at your root `<Directory /> ... </Directory>` tag (do a
   search for `<Directory />` and find the one without any arguments
   passed to it.

```
<Directory />
    AllowOverride none
    Require all granted
</Directory>
```

5. add `Include /etc/apache2/other/*.conf ` to your `httpd.conf`. Change
   the path to wherever your custom application configurations go

6. Restart your apache server


## Start App Locally With Flask

`export FLASK_ENV=development`

`flask run`

## Mac Apache Commands

Start: `sudo apachectl start`

Stop: `sudo apachectl stop`

Config: `open -e /usr/local/etc/httpd/httpd.conf`

Restart: `sudo apachectl -k restart`
