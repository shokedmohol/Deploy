$wifiSSID = "Divine_Glory"
$wifiPassword = "Aloha@123"

# Connect to the Wi-Fi network using the SSID and password
netsh wlan connect ssid="$wifiSSID" name="$wifiSSID" key="$wifiPassword"