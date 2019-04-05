FROM thyrlian/android-sdk-vnc
RUN sdkmanager "platform-tools" "platforms;android-24" "emulator"
RUN sdkmanager "system-images;android-24;default;armeabi-v7a"
RUN echo no | avdmanager create avd -n emuTest -k "system-images;android-24;default;armeabi-v7a"

# NOT a best practice
COPY aci/sshlocal/id_rsa.pub /root/.ssh/authorized_keys

COPY ./entry.sh /
RUN chmod 500 /entry.sh
ENTRYPOINT [ "/bin/bash", "-c", "/entry.sh" ]