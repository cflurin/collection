# homebridge-websocket

[Homebridge-websocket](https://github.com/cflurin/homebridge-websocket) is a Plugin for [Homebridge]((https://www.npmjs.com/package/homebridge)). The following [example-flow](https://github.com/cflurin/collection/blob/master/homebridge-websocket/example-flow) shows how to connect homebridge-websocket with [Node-RED](http://nodered.org/).


![node-RED](https://cloud.githubusercontent.com/assets/5056710/14761441/fee01054-0961-11e6-81e0-73f59603089c.jpeg)


The websocket node is defined as websocket-client:

```sh
Type:     Connect to
URL:      ws://192.168.0.30:4050
option:   Send/Receice intery message
```
