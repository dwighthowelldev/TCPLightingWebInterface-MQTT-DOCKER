![HeaderWebInterface](https://user-images.githubusercontent.com/23568795/64644718-85070980-d3d0-11e9-83a8-034f91ee0f4f.png)
## TCPLightingWebInterface-MQTT - Can be used with MQTT & IFTTT
This is a fork of awesome TCPLightingWebInterface-MQTT (https://github.com/sktaylortrash/TCPLightingWebInterface-MQTT) which is "a fork of the fabulous TCPLightingWebInterface" (https://github.com/bren1818/TCPLightingWebInterface) created by bren1818.

This fork is a move to containerize the solution that recucisitates the TCP Lighting Gateway. You need to downgrade....

... this doc is not done... don't use this project yet... the docs are not done, but it will work just fine with the docker-compose once I publish.

ALSO, I do not have a built in MQTT server here yet because I already have one. I'll add one soon.

That fork aimed to remove cloud dependance by leveraging MQTT. While leaving the IFTTT focused API available. 

This is acheived through an additional python script (generated as needed by a PHP script), a couple cron jobs and a small API change 

Setup is as described in the project's wiki - https://github.com/sktaylortrash/TCPLightingWebInterface-MQTT/wiki



