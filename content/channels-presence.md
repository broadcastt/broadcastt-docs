---
title: "Presence channel"

menu:
    main:
        parent: Channels
        weight: 30
---
Presence channels do require authorisation. Access is restricted by your system which means you can share confidential information on this type of channel.

The authentication occurs via a HTTP Request to a configurable authentication url which is executed via AJAX. The developer can provide additional information about that user in the response to the HTTP authentication request, which can then be used within your application.

Presence channels can be used for any kind of application which requires the client to share additional information about them self eg. chat rooms, collaborator tools, competitions.

> Presence channels must be prefixed with "presence-"

> Presence channel requires authorisation

### Events
* Subscribe
* Unsubscribe
* Joining
* Leaving
* Here
* Listen
