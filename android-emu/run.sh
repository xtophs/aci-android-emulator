#!/bin/bash

echo Setting up a container running the Android sdk
echo and making the emulator available via VNC

#Pulls android-sdk image
docker pull thyrlian/android-sdk

#Pulls android-sdk-vnc image
docker pull thyrlian/android-sdk-vnc

#Runs android sdk on container
# docker run -it —rm \
#    -v $(pwd)/sdk:/sdk thyrlian/android-sdk bash \
#    -c 'cp -a $ANDROID_HOME/. /sdk'

docker run -d -p 5901:5901 -p 2222:22 -p 5037:5037 -v $(pwd)/aci/sdk:/opt/android-sdk -v /Users/xtoph/.ssh/id_rsa.pub:/root/.ssh/authorized_keys thyrlian/android-sdk-vnc

echo Please follow the instructions for setting up the emulator at:
echo https://medium.com/@AndreSand/android-emulator-on-docker-container-f20c49b129ef

# TODO: Script android SDK setup.