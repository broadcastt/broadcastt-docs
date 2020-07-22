---
title: "Channel protocol"

menu: 
    main:
        parent: References
        weight: 30
---
_In progress_

Currently the server library only supports [RFC 6455](https://tools.ietf.org/html/rfc6455) (aka WebSocket v13)

Browser compatibility ([source](https://en.wikipedia.org/wiki/WebSocket#Browser_implementation)):

| Protocol, version | Draft date     | Internet Explorer | Firefox (PC, Android) | Chrome (PC, Mobile) | Safari (Mac, iOS) | Opera (PC, Mobile) | Android Browser |
| ----------------- | -------------- | ----------------- | --------------------- | ------------------- | ----------------- | ------------------ | --------------- |
| RFC 6455          | December, 2011 | 10                | 11                    | 16                  | 6                 | 12.10              | 4.4             |

## Connection

```
[scheme]://[cluster].broadcastt.xyz:[port]/app/[key]
```

### Options

#### `scheme`

* `ws` Indicates the use of WebSocket protocol
* `wss` Indicates the use of secure WebSocket protocol

#### `cluster`

The name of the cluster of your application

#### `port`

Default WebSocket ports are `80` for ws and `443` for wss connections

#### `key`

The key of your application

## Data messages

Data is sent bidirectionally over a WebSocket as text data containing UTF8 encoded JSON.

## Ping and pong messages

[RFC 6455](https://tools.ietf.org/html/rfc6455) natively supports [Ping](https://tools.ietf.org/html/rfc6455#section-5.5.2) and [Pong](https://tools.ietf.org/html/rfc6455#section-5.5.2) frames. These frames helps determine if the connection lost.

## Connection closure

Clients may close the WebSocket connection at any time.

The server may close the connection when an error happens. In most cases a code and a reason will be sent.

The error code indicates the following rules

* 4000-4099: The connection SHOULD NOT be re-established.
* 4100-4199: The connection SHOULD be re-established after backing off.
* 4200-4299: The connection SHOULD be re-established immediately.

## Events

Events are WebSocket frames with a predefined structure. The frame has to be a JSON object which has to have an `event` property and can have a `data` property.

For consistency the optional `data` property must be a string which means JSON objects must be serialized.

### Connection Events

#### `broadcastt::connection_established` From *channel* to *client*

This event is triggered when a client successfully connected to the application. When this event has been triggered subscriptions can be made to channels using the WebSocket connection.

```
{
  "event": "broadcastt:connection_established",
  "data": String
}
```

Here the `data` property is a is a JSON-encoded hash of following format:

```
{
  "socket_id": String // A unique identifier for the connected client
  "activity_timeout": Number // The number of seconds between ping attempts
}
```

### Error Events

#### `broadcastt:error` From *channel* to *client*

_In progress_

### Subscription Events

#### `broadcastt:subscribe` From *client* to *channel*

_In progress_

#### `broadcastt:unsubscribe` From *client* to *channel*

_In progress_

#### `broadcastt:subscription_succeeded` From *channel* to *client*

`broadcastt_internal:subscription_succeeded`

_In progress_

### Channel Events

These type of messages are sent from a *channel* to *clients*.

Channel events are associated with a single channel.

_In progress_
