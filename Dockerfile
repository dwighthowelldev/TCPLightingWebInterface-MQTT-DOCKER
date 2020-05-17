FROM php:7-apache
RUN  apt-get update \
  && apt-get install -y wget python3-pip \
  && rm -rf /var/lib/apt/lists/*
RUN pip3 install paho-mqtt
RUN pip3 install requests

# Expose apache.
EXPOSE 80

# Copy the TCPLighting website into place.
ADD www /var/www/html
run chown -R www-data:www-data "/var/www/html"
run chmod -R 755 "/var/www/html"

# Update the default apache site with the config file in the project root.
ADD setup/apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# Move the startup scripts over, which:
#  Set up the config files, the MQTT processes, and start apache in the foreground.
ADD setup/startup.sh /tmp/startup.sh
ADD setup/mqttgenerator.sh /tmp/mqttgenerator.sh
ADD setup/mqttposter.sh /tmp/mqttposter.sh
run chmod 777 "/tmp/startup.sh"
run chmod 777 "/tmp/mqttgenerator.sh"
run chmod 777 "/tmp/mqttposter.sh"
run chmod 777 "/var/www/html/setup.sh"

# Start up
CMD /tmp/startup.sh