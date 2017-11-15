var devices = require('./devices.json')

var clientinfo = devices.WIFI.clientinfo.sort((a,b) => {
	aa = a.IPv4Addr.slice(0, -3).split('.') 
	bb = b.IPv4Addr.slice(0, -3).split('.') 

	aaa = aa[2]*0x100 + aa[3]
	bbb = bb[2]*0x100 + bb[3]

	return aaa - bbb
})

clientinfo.forEach( (device) => {
	console.log(device.IPv4Addr.slice(0, -3), device.hostname)
})
