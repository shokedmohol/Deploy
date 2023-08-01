@echo off

set "wifiSSID=ShamrockStudents"
set "wifiPassword=Sh@mr0ck!5900"

:: Create the XML profile
echo ^<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"^> > "%wifiSSID%.xml"
echo     ^<name^>%wifiSSID%^</name^> >> "%wifiSSID%.xml"
echo     ^<SSIDConfig^> >> "%wifiSSID%.xml"
echo         ^<SSID^> >> "%wifiSSID%.xml"
echo             ^<name^>%wifiSSID%^</name^> >> "%wifiSSID%.xml"
echo         ^</SSID^> >> "%wifiSSID%.xml"
echo     ^</SSIDConfig^> >> "%wifiSSID%.xml"
echo     ^<connectionType^>ESS^</connectionType^> >> "%wifiSSID%.xml"
echo     ^<connectionMode^>auto^</connectionMode^> >> "%wifiSSID%.xml"
echo     ^<MSM^> >> "%wifiSSID%.xml"
echo         ^<security^> >> "%wifiSSID%.xml"
echo             ^<authEncryption^> >> "%wifiSSID%.xml"
echo                 ^<authentication^>WPA2PSK^</authentication^> >> "%wifiSSID%.xml"
echo                 ^<encryption^>AES^</encryption^> >> "%wifiSSID%.xml"
echo                 ^<useOneX^>false^</useOneX^> >> "%wifiSSID%.xml"
echo             ^</authEncryption^> >> "%wifiSSID%.xml"
echo             ^<sharedKey^> >> "%wifiSSID%.xml"
echo                 ^<keyType^>passPhrase^</keyType^> >> "%wifiSSID%.xml"
echo                 ^<protected^>false^</protected^> >> "%wifiSSID%.xml"
echo                 ^<keyMaterial^>%wifiPassword%^</keyMaterial^> >> "%wifiSSID%.xml"
echo             ^</sharedKey^> >> "%wifiSSID%.xml"
echo         ^</security^> >> "%wifiSSID%.xml"
echo     ^</MSM^> >> "%wifiSSID%.xml"
echo ^</WLANProfile^> >> "%wifiSSID%.xml"

:: Add the Wi-Fi profile to the system
netsh wlan add profile filename="%wifiSSID%.xml"

:: Set the profile to connect automatically
netsh wlan set profileparameter name="%wifiSSID%" connectiontype=ESS autoconnect=yes

:: Connect to the Wi-Fi network
netsh wlan connect name="%wifiSSID%"

:: Clean up: Delete the temporary XML profile
del "%wifiSSID%.xml"