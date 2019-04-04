#!/bin/bash

set -e
. ./var.env
# . ./deploy-rg.sh
. ./deploy-storage.sh
# . ./deploy-aci.sh
# This approach didn't work form my Mac. 
# It probably works from Ubuntu or Windows Subsystem for Linux
# For now I copy /root/.ssh/authorized_keys into the container image
# definitely not a best practice.
#. ./deploy-cert.sh
. ./deploy-containers.sh
