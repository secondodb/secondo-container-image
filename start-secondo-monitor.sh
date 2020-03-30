#!/bin/bash

# Determine the IP address
HOSTIP=$(hostname -i)

# Insert the host IP into the config file
sed -i "s/{{HOST_IPADDRESS}}/$HOSTIP/g" /database/secondo/bin/SecondoConfig.ini

source /database/.secondorc

/database/secondo/bin/SecondoMonitor -s