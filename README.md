# APF
Apache Python Flask

## Install Dependencies

1. Install Apache
2. Install Python
3. Install Flask

4. Create Virtual Environment `python3 -m venv venv`
5. Active Environment: `. venv/bin/activate` (to deactivate, type
   `deactivate`

# Configure Local Apache

### Mac

Start: `brew services start httpd`

Stop: `sudo apachectl stop`

Config: `open -e /usr/local/etc/httpd/httpd.conf`

Restart: `sudo apachectl -k restart`
