# How to install node-red-contrib-dht-sensor and configure node-red

1. Install installing the `bcm2835 library`

wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.50.tar.gz
tar zxvf bcm2835-1.50.tar.gz
cd bcm2835-1.50
./configure
make
sudo make check
sudo make install

2. install node-red-contrib-dht-sensor

cd .node-red
npm install node-red-contrib-dht-sensor

I had to install the node-dht-sensor in directory (I've to investigate ...)
cd .node-red/node_modules/node-dht-sensor
npm install

3. Configure `/lib/systemd/system/nodered.service`

Since node-dht-sensor requires accesss to low-level parts of the Raspberry Pi, you must run Node-RED as root.

Change this line:

```sh
User=root
```
and add this line:

```sh
Environment="NODE_RED_OPTIONS=--userDir /home/pi/.node-red"
```

`ExecStart=/usr/bin/env node-red-pi $NODE_OPTIONS $NODE_RED_OPTIONS`

Save the nodered.service
and run
```sh
sudo systemctl daemon-reload
```

Start Node-RED

```sh
node-red-start
```
