#!/usr/bin/python

import sys
import requests

base = "SGD"
symbols = "MYR"

url = "http://api.fixer.io/latest?symbols={}&base={}".format(symbols, base)

jsonresp = requests.get(url).json()

sys.stdout.write("{}1={}{}\n".format(base, symbols, jsonresp["rates"]["MYR"]))
