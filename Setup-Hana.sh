# run docker daemon to point to an external drive since S/4 HANA is aroung 64 GB and HXE alone is 4.3 GB
sudo /usr/bin/dockerd --data-root /mnt/docker-data

# pull HXE image
docker pull saplabs/hanaexpress:2.00.061.00.20220519.1

# run HANA Express containers
sudo docker run -p 39013:39013 -p 39017:39017 -p 39041-39045:39041-39045 -p 1128-1129:1128-1129 -p 59013-59014:59013-59014 -v /data/express_edition:/hana/mounts \
sudo docker run -p 49013:49013 -p 49015:49015 -p 49041-49045:49041-49045 -p 1138-1139:1128-1129 -p 59023-59024:59013-59014 -p 49030-49033:49030-49033 -p 51000-51060:51000-51060 -p 53075:53075 -h hxehost -v /data/hxe:/hana/mounts --ulimit nofile=1048576:1048576 --sysctl kernel.shmmax=1073741824 --sysctl net.ipv4.ip_local_port_range='60000 65535' --sysctl kernel.shmmni=524288 --sysctl kernel.shmall=8388608 --name hxexsa1 hanaexpressxsa:latest --agree-to-sap-license --passwords-url file:///hana/mounts/password.json --proxy-host proxy.wdf.sap.corp --proxy-port 8080 --no-proxy localhost,127.0.0.1,hxehost,hxehost.localdomain

# check: http://blog.ui5cn.com/s4-hana-1909-on-premise-using-docker/ for installation of S4 HANA
