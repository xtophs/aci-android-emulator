
# az container create \
#     --resource-group $ACI_PERS_RESOURCE_GROUP \
#     --name sdkfiles2 \
#     --image thyrlian/android-sdk-vnc \
#     --dns-name-label vnc-demo-2 \
#     --ports 5901 22 5037 \
#     --protocol TCP \
#     --protocol UDP 

# Creating container from YAML file to have 2 mounts
# one mount with the SDK one with the public keyfile that needs to go into the 
# /root/.ssh/authorized_keys in the container

# TODO
# 1. Try android-sdk-vnc image without the extra sdk tree copy
# 2. Script copy / chmod of authorized keys
# 3. Script android emulator setup
# 4. Think about other ways for authorized_keys to get into the container
# Copying into the container seems wrong ...

az container create \
    --resource-group aci-rg \
    --file android-emu-aci.yaml
 