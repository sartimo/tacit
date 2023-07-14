# run docker daemon to point to an external drive since S/4 HANA is aroung 64 GB and HXE alone is 4.3 GB
sudo /usr/bin/dockerd --data-root /mnt/docker-data

# pull HXE image
docker pull saplabs/hanaexpress:2.00.061.00.20220519.1

# check: http://blog.ui5cn.com/s4-hana-1909-on-premise-using-docker/ for installation of S4 HANA
