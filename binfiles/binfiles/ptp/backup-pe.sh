#!/bin/bash
LLOCF=~/binfiles/ptp/.list_of_config_files #something something
LLOCD=~/binfiles/ptp/.list_of_config_dirs #something something
LLOPS=~/binfiles/ptp/.list_of_package_scripts  #probably modified with ls | grep sh$ | grep get >
LLOTS=~/binfiles/ptp/.transfer_scripts #ls | grep sh$ | grep add > .transfer_scripts
PTP=~/binfiles/ptp/
BINFILES=~/binfiles
BIN=~/bin
ME=teodoro

if [[ $EUID -ne 0 ]]; then
   echo "error: This script must b1e run as root" 
   exit 1
fi

#get back up location ready
cd /tmp/

if [ ! -d "backup-pe" ]; then
    mkdir backup-pe
else
    rm -rf backup-pe
    mkdir backup-pe
fi

echo "Made tmp/backup-pe"

cd backup-pe
mkdir config_files


#save ~ configuration files
cd
echo "Backing up config files"
cat $LLOCF | xargs -i cp -p {} "/tmp/backup-pe/config_files/"{}
cp $LLOCF "/tmp/backup-pe/config_files/.list_of_config_files"
echo "Backed up config files"

cd /tmp/backup-pe
mkdir config_dirs

#save configuration directories
cd
echo "Backing up config dirs"
cat $LLOCD | xargs -i cp -Rp {} "/tmp/backup-pe/config_dirs/"{}
cp $LLOCD "/tmp/backup-pe/config_dirs/.list_of_config_dirs"
echo "Backed up config dirs"

cd /tmp/backup-pe/
mkdir packages
cd $PTP
ls > start


#run scripts to back up things
echo "Running package scripts"
cat $LLOPS | xargs -i sudo sh {}
echo "Ran package scripts"
ls > end

echo "Locating results"
diff start end | grep \> | awk '{print $2}' > copy


cat copy | xargs -i cp -p {} "/tmp/backup-pe/packages/"{}
echo "Copy package script results to tmp"
rm /tmp/backup-pe/packages/end

echo "Copying Package Transfer Scripts"
cat $LLOTS | xargs -i cp -p {} "/tmp/backup-pe/packages/"{}
cp $LLOTS "/tmp/backup-pe/packages/.transfer_scripts"

echo "Copying bin (which should probably not happen...)"

cp -Rp $BIN /tmp/backup-pe/

echo "Copied bin"
echo "Copying bin sources (binfiles)"

cp -Rp $BINFILES /tmp/backup-pe/

echo "Copied bin sources"
echo "Copying the full transfer system "

cp -Rp $PTP /tmp/backup-pe/

echo "Copied full transfer system"
echo "Deleting extra files"


cat copy | xargs rm
rm start
rm copy


cd /tmp/backup-pe/
chmod -R 777 .
echo "Set permissions"

cd ..
echo "Creating tar in tmp"
tar -cvpzf ptp.tgz backup-pe
chown $ME ptp.tgz
chmod -R 777 ptp.tgz
echo "Created tar in tmp"
mv ptp.tgz ~/ptp.tgz
echo "Moved ptp.tgz to home directory"
rm -rf backup-pe
echo "Cleaning up backup-pe"






