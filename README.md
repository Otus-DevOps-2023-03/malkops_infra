# malkops_infra
malkops Infra repository

To go through `bastion` use: `ssh -i ~/.ssh/otus -A otus@<bastion-ip> -t "ssh <target-ip>"`

Add this in your ssh config
```config
# Bastion Host
Host bastion
    HostName bastion-ip
    User otus
    IdentityFile ~/.ssh/otus

# Target Host
Host someinternalhost
    HostName target_ip
    ProxyJump bastion
    User otus
    IdentityFile ~/.ssh/otus
```

### cloud-vpn

bastion_IP = 51.250.82.213

someinternalhost_IP = 10.128.0.27

### cloud-testapp

testapp_IP = 84.201.134.19

testapp_port = 9292

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=cloud-config.yml

### packer-base

What I achieve:
 - Install packer
 - Create [base image](packer/ubuntu16.json) with mongo and ruby on rails
 - Create [full image](packer/immutable.json) based on base image with app
 - Parametrize images with [variables](variables.json.examples)
 - Write [script](create-reddit-vm.sh) for creating VM
 - Write [additional files](packer/files/) that necessary for creating full image
 - Refactor structure of the project (testapp scripts move to config-scripts directory)
