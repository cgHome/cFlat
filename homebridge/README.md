# cFlat - homebridge


### Command's

```sh
# Build image
./homebridge.sh build

# Run production container
./homebridge.sh run [cmd]

# Run development container
./homebridge.sh run-dev [cmd]

# Run plugin development container
./homebridge.sh run-plugin-dev [pluginName] [cmd]
```

### Setup development environment

Step 1: Create samba share:

```sh
# Set samaba user & password
sudo smbpasswd -a pirate

# Save samba.conf
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# Add to samba.conf
security = user

[pirate]
path = /home/pirate/
writeable = yes
guest ok = no

# Test samba.conf
testparm

# Restart samba to use the new configuration file.
sudo /etc/init.d/samba restart
```

Step 2: 

```sh
# Clone homebridge
homebridge/homebridge.sh dev "rm -rf ..?* .[!.]* * && git clone https://github.com/nfarina/homebridge.git ."
```