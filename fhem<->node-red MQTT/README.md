# fhem<->node-red MQTT

The example-flow demostrates a bit-directional communication between node-red and fhem via MQTT:

**Connect fhem with MQTT**

```
Define mosquitto MQTT 192.168.0.33:1883
```
In this esxample the mosquitto broker is installed on a RPi with the address `192.168.0.33:1883` but you can use any broker.

Define a "bridge" bewtween an fhem-device and the an MQQT topic.

```
define mqtt_hello_button MQTT_BRIDGE hello_button
attr mqtt_hello_button IODev mosquitto
attr mqtt_hello_button publishState fhem/hello_button
attr mqtt_hello_button stateFormat transmission-state
attr mqtt_hello_button subscribeSet fhem/hello_button/set
```

The connection to mosquitto shoulf be active.

**node-red flow**

Import the [example-flow](https://github.com/cflurin/collection/blob/master/fhem%3C-%3Enode-red/example-flow.json) into node-red.

