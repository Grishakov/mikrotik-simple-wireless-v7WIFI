#Backup
/interface/wifi/export file=wifibackup show-sensitive
#
# Reset WIFI configuration
#
/interface/wifi/reset 0,1
#
/interface wifi configuration
add channel.deprioritize-unii-3-4=yes .frequency=2401-2483,5150-5350,5650-5855 \
    .reselect-interval=4h..6h country="Superchannel" disabled=no \
    dtim-period=2 multicast-enhance=enabled name=cfg-wifi qos-classifier=\
    dscp-high-3-bits security.authentication-types=wpa2-psk,wpa3-psk \
    .connect-priority=0/1 .passphrase=PASSWORD ssid=IRRADIATOR steering.wnm=no
/interface wifi
set [ find default-name=wifi1 ] configuration=cfg-wifi configuration.mode=ap \
    disabled=no
set [ find default-name=wifi2 ] configuration=cfg-wifi configuration.mode=ap \
    disabled=no
