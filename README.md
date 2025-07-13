# OctoPrint-Remote_connection

Connect OctoPrint to remote devices via the network.

## Setup

Install via the bundled [Plugin Manager](https://docs.octoprint.org/en/master/bundledplugins/pluginmanager.html)
or manually using this URL:

    https://github.com/mstarostik/OctoPrint-Remote_connection/archive/main.zip

## Configuration

List all remote devices you want to add to the connection list. All you need is each device's hostname or IP address, the TCP port to connect to and whether to establish a raw connection or use the RFC2217 protocol.

Raw connections are the basic variant where all you need is some TCP listener that will pass data on incoming connections to the actual device, presumably via a serial port local to the machine the listener is running on. You will need to make sure the correct baudrate is setup by this listener.

You may use [ser2net](https://github.com/cminyard/ser2net) with a configuration like this:

```
connection: &my-printer
    accepter: tcp,1234
    connector: serialdev,/dev/ttyUSB0,115200N81
```

or even just a simple socat invocation like `socat TCP-LISTEN:1234,reuseaddr,fork GOPEN:/dev/ttyUSB0,b115200,raw,echo=0`

RFC2217 connections communicate the baudrate expected by OctoPrint to the listener instead. Make sure to use a listener software that understands this protocol.

To setup [ser2net](https://github.com/cminyard/ser2net) for this, use a configuration like this:

```
connection: &my-printer
    accepter: telnet(rfc2217),tcp,1234
    connector: serialdev,/dev/ttyUSB0,115200N81
```
