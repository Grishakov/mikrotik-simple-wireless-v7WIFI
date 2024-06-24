#
# Reset WIFI config
#
/interface/wifi/reset 0,1
#
/interface wifi configuration
add country="United States" disabled=no \
	dtim-period=3 \
	multicast-enhance=enabled \
	name=cfg-SSID \
	qos-classifier=dscp-high-3-bits \
    security.authentication-types=wpa2-psk,wpa3-psk .connect-priority=0/1 \
	ssid=IRRADIATOR \
	steering.wnm=no
/interface wifi
set [ find default-name=wifi1 ] configuration=cfg-SSID configuration.mode=ap disabled=no
set [ find default-name=wifi2 ] configuration=cfg-SSID configuration.mode=ap disabled=no