
This is a simple script for setting up Wi-Fi on a Mikrotik hAP (ac2,ac3,ax2,ax3) router. 
Single SSID for two bands. 

Mikrotik hAP AC2, Mikrotik hAP AC3, Mikrotik hAP AX2, Mikrotik hAP AX3.

The settings are only applicable for wifi-qcom and wifi-qcom-ac drivers.

Use the latest stable version of RouterOS.

How to use:

The configuration of wireless interfaces will be lost!

1. Back up your wireless network settings:
```
/interface/wifi/export file=wifibackup show-sensitive
```

2. Download the setup script:
```
/tool/fetch url="https://raw.githubusercontent.com/Grishakov/mikrotik-simple-wireless-v7WIFI/main/cfg-wifi.rsc" mode=https
```

4. Change SSID, password and country (/interface/wifi/radio/reg-info country= and press TAB):
```
/file/edit cfg-wifi.rsc value-name=contents
```
For hAP AC2/3, also change 
```
qos-classifier=priority
```
```
security.authentication-types=wpa2-psk
```

5. Import the configuration:
```
/import cfg-wifi.rsc
```

6. For hAP AC2/3 only, add the following rule:
```
/ip/firewall/mangle/
```
```
add action=set-priority chain=postrouting new-priority=from-dscp-high-3-bits passthrough=yes
```

7. Set up DHCP server lease time to 8-24 hours

Done!
