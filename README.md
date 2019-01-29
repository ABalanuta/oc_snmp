# oc_snmp

## Install Procedure


```
curl -s https://api.github.com/repos/ABalanuta/oc_snmp/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -
sudo apt update
sudo dpkg -i oc-snmp_*.deb
sudo apt-get install -fy
rm oc-snmp_*.deb
```


## Removing 
```
dpkg --purge oc-snmp
```
