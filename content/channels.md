---
title: "Channels"

menu:
    main:
        weight: 20
---
Applications can have infinite number of channels.

They are special filters for data. With them you can create different streams of information.

Channels are created on the fly during subscription, which means they don't have to be initialized.

### Types
* [Public]({{< ref "channels-public" >}}): anyone can subscribe.
* [Private]({{< ref "channels-private" >}}): Your system grants access to the users to be able to subscribe.
* [Presence]({{< ref "channels-presence" >}}): Your system grants access and data to the users to be able to subscribe and share information on subscription, which will be sent to all other subscribers of the channel.
