#! /usr/bin/python3.6

import logging
import sys

activate_this = '~/code/github/orpheus/python/APF/venv/bin/activate'
with open(activate_this) as file_:
    exec(file_.read(), dict(__file__=activate_this))

logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, '~/code/github/orpheus/python/APF/')
from app import app as application
application.secret_key = 'anything you wish'

