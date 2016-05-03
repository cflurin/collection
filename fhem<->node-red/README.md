# fhem<->node-red

The example-flow demostrates a "full-duplex" communication between node-red and fhem:

* set or get `Readings` inside node-red.
* receiving `Readings` from fhem.

In order to be able to receive Readings from fhem you need a small perl sub [http_request.pm](https://github.com/cflurin/collection/blob/master/fhem%3C-%3Enode-red/http_request.pm) that you can add to your 99_myUtils.pm.

Replace `127.0.0.1` with your `ip-address`.

Add an attr `userReadings` to your device, e.g.:

```
define hello_button dummy
attr hello_button setList on off
attr hello_button userReadings http {http_request("hello_button", "On", ReadingsVal("hello_button","state","") =~/^on/?1:0)}
```

Set a trigger `http:temperature.*` to process the specific Reading once, e.g.:

```
define temp_office EnOcean 0082CF95
attr temp_office userReadings http:temperature.* {http_request("temp_office", "CurrentTemperature", ReadingsVal("temp_office","temperature",""))}
```

When the device is triggered node-red will receive a JSON string:

```sh
{topic: "set", payload: {"name": "hello_button", "characteristic": "On", "value": 1}}
```

The payload in this example is based on the HomeKit specs. But you can change the `payload` in `http_request.pm`.

**How to use:**

Import the [example-flow](https://github.com/cflurin/collection/blob/master/fhem%3C-%3Enode-red/example-flow.json) into node-red, the sub-flow `fhem in` will be also created.


![example-flow](https://cloud.githubusercontent.com/assets/5056710/14916059/8f68e8b2-0e17-11e6-861a-7eea9bd9e84b.png)

**Sub-flow "fhem in"**

![subflow](https://cloud.githubusercontent.com/assets/5056710/14918472/652757ac-0e24-11e6-83cd-777fa79e0d28.png)

**get function**

```javascript
var r_msg = {};
var ip = "127.0.0.1:8083";
var cmd = "{ReadingsVal('hello_button','state','')}";
r_msg.url = "http://" + ip + "/fhem?cmd=" + cmd + "&XHR=1";
return r_msg;
```

**set function**

```javascript
var r_msg = {};
var ip = "127.0.0.1:8083";
var cmd = "set hello_button " + msg.payload;
r_msg.url = "http://" + ip + "/fhem?cmd=" + cmd + "&XHR=1";

if (msg.payload === "on") {
    node.status({fill:"yellow",shape:"dot",text:"on"});
} else if (msg.payload === "off") {
    node.status({fill:"grey",shape:"dot",text:"off"});
}

return r_msg;
```

Replace `127.0.0.1` with your `fhem-ip-address`.
