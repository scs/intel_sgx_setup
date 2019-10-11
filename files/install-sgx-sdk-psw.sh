#!/bin/bash
sudo ./download_prebuilt.sh
sudo make
sudo make sdk_install_pkg
sudo make deb_pkg
cd linux/installer/bin
exec_file=$(find . -type f -name sgx_linux_x64_sdk_*.bin -printf "%f\n" )
echo HELLO WORLD $exec_file

debug_out=$(expect -c "
spawn sudo ./$exec_file
expect \" :\"
send \"yes\r\";
interact;
")

cd ../deb
sudo dpkg -i ./libsgx-urts_*_amd64.deb ./libsgx-enclave-common_*_amd64.deb
sudo dpkg -i ./libsgx-enclave-common-dbgsym_*_amd64.ddeb
