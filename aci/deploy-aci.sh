# populate SDK share
# TODO: Could test for empty folder here

echo Starting container deploy

# az container create \
#     --resource-group $ACI_PERS_RESOURCE_GROUP \
#     --name sdkfiles \
#     --image thyrlian/android-sdk \
#     --azure-file-volume-account-name $ACI_PERS_STORAGE_ACCOUNT_NAME \
#     --azure-file-volume-account-key $STORAGE_KEY \
#     --azure-file-volume-share-name $ACI_PERS_SHARE_NAME \
#     --azure-file-volume-mount-path /sdk \
#     --command-line "/bin/bash -c '[[ $(find /sdk -type f | wc -l) -eq 0 ]] && cp -a $ANDROID_HOME/. /sdk'"

echo container deploy phase 1 complete
echo  TODO: Get SDK file count


az container create \
    --resource-group $ACI_PERS_RESOURCE_GROUP \
    --name sdkfiles2 \
    --image thyrlian/android-sdk \
    --dns-name-label vnc-demo \
    --ports 5901 22 5037 \
    --protocol TCP \
    --protocol UDP \
    --azure-file-volume-account-name $ACI_PERS_STORAGE_ACCOUNT_NAME \
    --azure-file-volume-account-key $STORAGE_KEY \
    --azure-file-volume-share-name $ACI_PERS_SHARE_NAME \
    --azure-file-volume-mount-path /sdk
    --command-line '[[ $(find /sdk -type f | wc -l) -eq 0 ]] && cp -a $ANDROID_HOME/. /sdk'

    # TODO get container name from output and attach