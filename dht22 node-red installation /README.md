# obsolete using bcm2835-1.52

# How to install node-red-contrib-dht-sensor and configure node-red

**Install the `bcm2835 library`**

```sh
wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.50.tar.gz
tar zxvf bcm2835-1.50.tar.gz
cd bcm2835-1.50
./configure
make
sudo make check
sudo make install
```

**Install node-red-contrib-dht-sensor**

```sh
cd .node-red
npm install node-red-contrib-dht-sensor
```

**Configure `/lib/systemd/system/nodered.service`**

Since node-dht-sensor requires access to low-level parts of the Raspberry Pi, you must run Node-RED as root.

Change this line:

```sh
User=root
```
and add this line:

```sh
Environment="NODE_RED_OPTIONS=--userDir /home/pi/.node-red"
```

before `ExecStart=/usr/bin/env node-red-pi $NODE_OPTIONS $NODE_RED_OPTIONS`

Save nodered.service and run:

```sh
sudo systemctl daemon-reload
```

**Start Node-RED:**

```sh
node-red-start
```
