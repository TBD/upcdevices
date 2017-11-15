#!/bin/bash

# --- UPC Router get connected devices
# --- requirements curl, xml-json https://github.com/maxogden/xml-json, node

TOKEN=$(curl -I -s http://192.168.0.1/common_page/login.html | grep -E "sessionToken=" | cut -d '=' -f 2 | cut -d ';' -f 1)
curl -s http://192.168.0.1/xml/getter.xml --data "token=${TOKEN}&fun=123" | xml-json LanUserTable > devices.json

node display.js
