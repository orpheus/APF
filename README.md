# APF
Apache Python Flask

## Install Dependencies

1. Install Apache
2. Install Python
3. Install wsgi (via pip) `pip3 install mod_wsgi`
3. Install Flask (via pip)

4. Create Virtual Environment `python3 -m venv venv`
5. Active Environment: `. venv/bin/activate` (to deactivate, type
   `deactivate`

## Configure Local Apache

> Your local apache  config will differ based on os. For mac it's
`httpd.conf` and for linux it's `apache2.conf`


1. Go into your apache config (`httpd.conf`) and update the values as
   described [here](https://medium.com/@crmcmullen/how-to-install-apache-on-macos-10-13-high-sierra-and-10-14-mojave-using-homebrew-3cb6bf6e3cd4)

> This step may not be necessary, but it's the first thing I did. Mainly
you want to update your User and Group to be your computer's active User
and Group (the user displayed when you open a terminal. Type `whoami` to
see what is what.

2. Create an apache config file for your application. See
   [docs](https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/)

> Copy and paste this to /etc/apache2/other/MyApp.conf
> Make sure to change the paths (USING ONLY ABSOLUTE PATHS) and the user
and group to match

> Point the WSGI alias to your app.wsgi file in your project

```
<VirtualHost *>
     # Add machine's IP address (use ifconfig command)
     ServerName localhost
     # Give an alias to to start your website url with
     WSGIDaemonProcess /Users/rchacon/code/github/orpheus/python/APF user=rchacon group=staff threads=5
     WSGIScriptAlias / /Users/rchacon/code/github/orpheus/python/APF/app.wsgi
     <Directory /Users/rchacon/code/github/orpheus/python/APF>
     		# set permissions as per apache2.conf file
        # WSGIProcessGroup APF
        # WSGIApplicationGroup %{GLOBAL}
        Order deny,allow
        # AllowOverride All
        Allow from all
     </Directory>
     ErrorLog /tmp/error.log
     LogLevel warn
     CustomLog /tmp/access.log combined
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

7. Your app should be running on localhost

## Simply Apache Summary

1. Make sure python, flask, apache, and wsgi are installed
2. Create an Apache config for your application
3. Create a `.wsgi` file for your python app
3. Load the wsgi module in the Apache config
4. Restart your apache server for changes to take effect

## Start App Locally With Flask

`export FLASK_ENV=development`

`flask run`

## Mac Apache Commands

Start: `sudo apachectl start`

Stop: `sudo apachectl stop`

Config: `vi /etc/apache2/httpd.conf`

Restart: `sudo apachectl -k restart`
