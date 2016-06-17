#!/bin/bash
#export AWS_ACCESS_KEY_ID='supersecret';
#export AWS_SECRET_ACCESS_KEY='supersecret';

if [[ $1 == '' || $2 == '' ]]; then 
   echo " "
   echo "############# Deployment Script for notinphilly ###############"
   echo "Please use the following format:";
   echo "./deploy [application_elevation_level] [whether you want to deploy app - appDeploy]";
   echo " "
fi

if [[ $2 == 'appDeploy' && $1 != '' ]]; then
    ansible-playbook -i playbook/inventory/devservers -e "env="$1 --private-key=notinphilly.pem playbook/app_install.yml -vvvv ;
fi

if [[ $2 == '' && $1 != '' ]]; then
   ansible-playbook -i playbook/inventory/devservers -e "env="$1 --private-key=notinphilly.pem playbook/site.yml -vvvv
fi
