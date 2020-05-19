![HeaderWebInterface](https://user-images.githubusercontent.com/23568795/64644718-85070980-d3d0-11e9-83a8-034f91ee0f4f.png)
## TCPLightingWebInterface-MQTT - Can be used with MQTT & IFTTT
This is a fork of awesome TCPLightingWebInterface-MQTT (https://github.com/sktaylortrash/TCPLightingWebInterface-MQTT),
which is "a fork of the fabulous TCPLightingWebInterface" (https://github.com/bren1818/TCPLightingWebInterface)
created by bren1818.

That fork aimed to remove cloud dependance by leveraging MQTT. While leaving the IFTTT focused API available. This is acheived through an additional python script (generated as needed by a PHP script), a couple cron jobs and a small API change 

Setup for that complete effort is as described in the project's wiki - 
          https://github.com/sktaylortrash/TCPLightingWebInterface-MQTT/wiki

This particular fork is a move to containerize the solution that recucisitates the TCP Lighting Gateway.
You need to downgrade the gateway to v2 and block its internet access to make this easier.... 
         (https://github.com/bren1818/TCPFirmwareRestore)

... This doc is not done... The docker-compose file will work just fine, but it needs an MQTT server to point at.
I do not have a built in MQTT server here yet because I already have one. I'll add one soon. 

You can easily add one to the Compose. I have one in there, commented out for now, but I need to deal with consistent config and the data folders. 

### To insatll
Go to the command line of your Linux machine with docker-compose on it. 

```
cd ~
mkdir docker
cd docker
mkdir tcplights
cd tcplights
wget -N https://raw.githubusercontent.com/henroFall/TCPLightingWebInterface-MQTT-DOCKER/master/docker-compose.yml
```

You now have the docker-compose file. 

`nano docker-compose.yml`

That will bring you into the compose file where you need to edit all the variables that apply. 
You very particularly must set `IP_TCPLIGHTS` to the IP address of  your Gateway. `IP_MQTT` must also be set for your external MQTT server. Everything else is pretty much optional, based on how you use this thing. You might need to set timezone, GPS, etc. There are lots of comments in the yml file. 

You'll see here the commented out section for the Mosquitto MQTT server that I have not put in place yet. You can uncomment that, and work throught the Mosquitto installation guide to get that going.

##### You're done. As you can see in the yml, the web insterface is exposed on port 4321. 
So, http://yourserverIP:4321 gets  you there. You can change that port to anything you want in the yml file. Make it 80 if you don't want to type in a port number. 