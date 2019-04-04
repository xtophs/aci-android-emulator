#/bin/bash

echo Launching a bunch of stuff
/usr/bin/supervisord > /tmp/svd.log 2>&1 &
tail /tmp/svd.log
echo Launching the emulator
emulator -avd emuTest -noaudio -no-boot-anim -gpu off

