## ntpdate
[net sync](https://help.ubuntu.com/lts/serverguide/NTP.html)

## LAN with net bridge
remote_time = "$(ssh bobin@192.168.1.30 date)" && sudo date --set "$remote_time"
