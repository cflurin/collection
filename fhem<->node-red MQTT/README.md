# fhem<->node-red MQTT

The example-flow demonstrates a bi-directional communication between node-red and fhem via MQTT:

**Connect fhem with MQTT**

```
Define mosquitto MQTT 192.168.0.33:1883
```

In this example the mosquitto broker is installed on a RPi with the address `192.168.0.33:1883` but you can use any broker.

Define a "bridge" between a fhem-device and the a MQTT topic.

```
define mqtt_hello_button MQTT_BRIDGE hello_button
attr mqtt_hello_button IODev mosquitto
attr mqtt_hello_button publishState fhem/hello_button
attr mqtt_hello_button stateFormat transmission-state
attr mqtt_hello_button subscribeSet fhem/hello_button/set
```

**node-red flow**

Import the [example-flow](https://github.com/cflurin/collection/blob/master/fhem%3C-%3Enode-red%20MQTT/example-flow.json) into node-red.

![mqtt](https://cloud.githubusercontent.com/assets/5056710/15010186/1ecc04ea-11eb-11e6-94e9-b9663c621cbc.png)