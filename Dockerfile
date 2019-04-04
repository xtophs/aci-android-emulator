FROM thyrlian/android-sdk-vnc
RUN sdkmanager "platform-tools" "platforms;android-24" "emulator"
RUN sdkmanager "system-images;android-24;default;armeabi-v7a"
RUN echo no | avdmanager create avd -n emuTest -k "system-images;android-24;default;armeabi-v7a"
ENV DISPLAY=
ENV QT_QPA_PLATFORM='offscreen'

# NOT a best practice
COPY aci/sshlocal/id_rsa.pub /root/.ssh/authorized_keys

## It works up to here when the container is started with 
# docker run -d -p 5901:5901 -p 2222:22 -p 5037:5037 -e QT_QPA_PLATFORM='offscreen' -e DISPLAY='' -v $(pwd)/sdk:/opt/android-sdk xtoph/android-emu
# and then a user connects with ssh
# ssh -p 2222 root@0.0.0.0
# and then launches the emulator
COPY ./entry.sh /
RUN chmod 500 /entry.sh
ENTRYPOINT [ "/bin/bash", "-c", "/entry.sh" ]