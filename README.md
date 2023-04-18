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

bastion_IP = 51.250.82.213
someinternalhost_IP = 10.128.0.27
