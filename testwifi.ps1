$wifiSSID = "Divine_Glory"
$wifiPassword = "Aloha@123"

# Create a Wi-Fi profile with the provided SSID and password
$wifiProfileXml = @"
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>$wifiSSID</name>
    <SSIDConfig>
        <SSID>
            <name>$wifiSSID</name>
        </SSID>
    </SSIDConfig>
    <connectionType>ESS</connectionType>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>WPA2PSK</authentication>
                <encryption>AES</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
            <sharedKey>
                <keyType>passPhrase</keyType>
                <protected>false</protected>
                <keyMaterial>$wifiPassword</keyMaterial>
            </sharedKey>
        </security>
    </MSM>
</WLANProfile>
"@

# Save the Wi-Fi profile to the user's home directory
$profilePath = "$env:USERPROFILE\$wifiSSID.xml"
$wifiProfileXml | Out-File $profilePath -Encoding UTF8

# Add the Wi-Fi profile to the system
netsh wlan add profile filename="$profilePath"

# Connect to the Wi-Fi network using the SSID and profile name
netsh wlan connect name="$wifiSSID"

# Clean up: Delete the temporary XML profile
Remove-Item $profilePath
