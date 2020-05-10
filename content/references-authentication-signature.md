---
title: "Authentication signature"

menu: 
    main:
        parent: References
        weight: 10
---
The following guide shows how the signing mechanism works which used by private and presence channels.

The auth string is made from a key and a signature like this <key>:<signature>

The signature is a HMAC SHA256 hex digest. This is generated from a string signed by your applications secret.

String of the signature

* Private channels: `<socket_id>:<channel_name>`
* Presence channels: `<socket_id>:<channel_name>:<json_user_data>`

The socket id and the channel name is sent to your system to a configurable URI via a POST request.

After that you have to decide if that client has permission to a access that channel.

For private channels the response must contain a JSON string with an auth property.

For presence channels the response must contain a JSON string with an auth property. And a channel_data property should also be present containing a string representation of the data for the channel.

> The response must be JSON-encoded before returning it to the client.
