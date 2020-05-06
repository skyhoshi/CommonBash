# Step 0: Run ./pre-req.sh and restart the PC/device.
# Step 1: Create Install Locaitons
sudo mkdir ~/dotnet-install
sudo mkdir /etc/dotnet
cd ~/dotnet-install
# Step 2: Download files
wget https://dot.net/v1/dotnet-install.sh
# Step 3: run prerequists
# Step 4: mark file as executiable
# sudo chmod +x dotnet-install.sh
# Step 5: Run Install for RasberryPi - Ubuntu 19.10 Arm64
# Install just the runtime
# ./dotnet-install.sh --install-dir "/etc/dotnet" --architecture "ubuntu.19.10-arm64" --runtime dotnet
# Install the SDK and Runtime
sudo ./dotnet-install.sh --version "3.1.201" --install-dir "/etc/dotnet" --architecture "arm64"
# Step 6: Add to path. : You will want to add this to your .profile (as .bash_profile isn't instanced in this version, but if you have it, put it there.)
export PATH=$PATH:/etc/dotnet
# Install the latest runtime in the ~/.dotnet folder. (creates a local instance of the runtime.)
# ./dotnet-install.sh --runtime dotnet 
 alias runofficedoorbell='sudo /etc/dotnet/dotnet ~/officedoorbell/OfficeDoorbell.dll doorbell'