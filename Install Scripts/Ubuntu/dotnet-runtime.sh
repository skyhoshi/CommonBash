sudo apt-get -y update
sudo apt-get -y install libunwind8 gettext
wget https://download.visualstudio.microsoft.com/download/pr/60d21925-7f8f-4004-9afe-aebd041d2d4a/0db2946738642d7f88f71f7800522e8c/dotnet-runtime-3.1.0-linux-arm.tar.gz
sudo mkdir -p /usr/share/dotnet
sudo tar -xvf dotnet-runtime-3.1.0-linux-arm.tar.gz -C /usr/share/dotnet
sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet