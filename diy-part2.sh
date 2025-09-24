#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/10.6.0.1/g' package/base-files/files/bin/config_generate
# Modeify default root
sed -i '/^root:::/ {
    c\
root:$1$yJzy4v9Q$tBpKPQEc4hTRZJXsdUKHv0:19560:0:99999:7:::
}' package/base-files/files/etc/shadow

echo "ntp:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "dnsmasq:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "logd:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "nfs:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "rpc:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "ubus:x:0:0:99999:7:::" >> package/base-files/files/etc/shadow
echo "dnsproxy:x:0:0:99999:7::" >> package/base-files/files/etc/shadow

echo "ntp:x:123:123:ntp:/var/run/ntp:/bin/false" >> package/base-files/files/etc/passwd
echo "dnsmasq:x:453:453:dnsmasq:/var/run/dnsmasq:/bin/false" >> package/base-files/files/etc/passwd
echo "logd:x:514:514:logd:/var/run/logd:/bin/false" >> package/base-files/files/etc/passwd
echo "nfs:x:65536:65536:nfs:/var/run/nfs:/bin/false" >> package/base-files/files/etc/passwd
echo "rpc:x:65533:65533:rpc:/var/run/rpc:/bin/false" >> package/base-files/files/etc/passwd
echo "ubus:x:81:81:ubus:/var/run/ubus:/bin/false" >> package/base-files/files/etc/passwd
echo "dnsproxy:x:411:411:dnsproxy:/var/run/dnsproxy:/bin/false" >> package/base-files/files/etc/passwd
