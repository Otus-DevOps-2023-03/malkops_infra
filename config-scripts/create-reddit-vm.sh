yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-id=fd8erurdc15jd4q8k67l,size=10GB,auto-delete=true \
  --public-ip \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=cloud-config.yml
