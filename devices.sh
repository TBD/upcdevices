#!/bin/bash

# --- UPC Router get connected devices
# --- requirements curl, xml-json https://github.com/maxogden/xml-json

TOKEN=$(curl -I -s http://192.168.0.1/common_page/login.html | grep -E "sessionToken=" | cut -d '=' -f 2 | cut -d ';' -f 1)
curl -s http://192.168.0.1/xml/getter.xml --data "token=${TOKEN}&fun=123" | xml-json LanUserTable > devices.json

node -e 'var devices=require("./devices.json"),clientinfo=devices.WIFI.clientinfo.sort((e,a)=>(aa=e.IPv4Addr.slice(0,-3).split("."),bb=a.IPv4Addr.slice(0,-3).split("."),aaa=256*aa[2]+aa[3],bbb=256*bb[2]+bb[3],aaa-bbb));clientinfo.forEach(e=>{console.log(e.IPv4Addr.slice(0,-3),e.hostname)});'
