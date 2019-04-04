
folder_name=sshlocal
cert_path=./${folder_name}/id_rsa.vnc
share_mount=ssh

mkdir -p ${folder_name}
#echo expected account name mystorageaccount8781:gCiTiKLHzV/HV6fG0UyKjz6em6Oxb8GsZjWS2EKTI9AMiA65NLbyA9DvH+wehZn4EndNCAN0gDa3LGYEESs4jg==@mystorageaccount8781.file.core.windows.net/acikeyshare [mount point]

echo account name ${ACI_PERS_STORAGE_ACCOUNT_NAME}
echo  key ${STORAGE_KEY}
echo ekey gCiTiKLHzV/HV6fG0UyKjz6em6Oxb8GsZjWS2EKTI9AMiA65NLbyA9DvH+wehZn4EndNCAN0gDa3LGYEESs4jg==
# mount_smbfs \
#     -d 777 \
#     -f 777 \
#    //${ACI_PERS_STORAGE_ACCOUNT_NAME}:${STORAGE_KEY}@${ACI_PERS_STORAGE_ACCOUNT_NAME}.file.core.windows.net/${ACI_KEY_SHARE_NAME} ${folder_name}

echo Check if public key / private key pair exists
if [ ! -f ${cert_path} ];
then
    ssh-keygen -t rsa -b 2048 -f ${cert_path}
fi 

# copy private key to the file mount
cp ${folder_name}/* ${share_mount}

