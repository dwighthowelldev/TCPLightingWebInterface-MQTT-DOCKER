#!/bin/bash
# Update the PHP.ini file, enable <? ?> tags and quieten logging.
#sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
#sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini

# Set up config.inc.php file
sed -i "s/IPTCPLIGHTS/$IP_TCPLIGHTS/" /var/www/html/config.inc.php
sed -i "s/IPMQTT/$IP_MQTT/" /var/www/html/config.inc.php
sed -i "s/PORTTCPLIGHTS/$PORT_TCPLIGHTS/" /var/www/html/config.inc.php
sed -i "s|LOCALURL|$LOCAL_URL|" /var/www/html/config.inc.php
sed -i "s/USEREMAIL/$USER_EMAIL/" /var/www/html/config.inc.php
sed -i "s/USERPASSWORD/$USER_PASSWORD/" /var/www/html/config.inc.php
sed -i "s/FORCEFADEON/$FORCE_FADE_ON/" /var/www/html/config.inc.php
sed -i "s/FORCEFADEOFF/$FORCE_FADE_OFF/" /var/www/html/config.inc.php
sed -i "s|TCPTIMEZONE|$TCP_TIMEZONE|" /var/www/html/config.inc.php
sed -i "s/TCPLATITUDE/$TCP_LATITUDE/" /var/www/html/config.inc.php
sed -i "s/TCPLONGITUDE/$TCP_LONGITUDE/" /var/www/html/config.inc.php
sed -i "s/PORTMQTT/$PORT_MQTT/" /var/www/html/config.inc.php
sed -i "s/MQTTUSERNAME/$MQTT_USERNAME/" /var/www/html/config.inc.php
sed -i "s/MQTTPASSWORD/$MQTT_PASSWORD/" /var/www/html/config.inc.php
sed -i "s|MQTTsubid|$MQTTsub_id|" /var/www/html/config.inc.php
sed -i "s|MQTTpubid|$MQTTpub_id|" /var/www/html/config.inc.php
sed -i "s|MQTTprefix|$MQTT_prefix|" /var/www/html/config.inc.php
sed -i "s|MQTTcontrol|$MQTTcontrol|" /var/www/html/config.inc.php
sed -i "s|HomeAssistant-Topic_id|$HASSTopic_id|" /var/www/html/config.inc.php
sed -i "s|hass/status|$HASSOnline|" /var/www/html/config.inc.php

#run Web Server and MQTT Posters
/usr/sbin/apache2ctl -D FOREGROUND &
/tmp/mqttposter.sh &
/tmp/mqttgenerator.sh