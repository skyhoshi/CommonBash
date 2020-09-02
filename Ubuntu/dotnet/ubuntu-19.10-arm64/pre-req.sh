
# Dependancies ## See : https://docs.microsoft.com/en-us/dotnet/core/install/dependencies?tabs=netcore31&pivots=os-linux
# liblttng-ust0
# libcurl3 (for 14.x and 16.x)
# libcurl4 (for 18.x)
# libssl1.0.0
# libkrb5-3
# zlib1g
# libicu52 (for 14.x)
# libicu55 (for 16.x)
# libicu57 (for 17.x)
# libicu60 (for 18.x)
# libicu63 (for 19.10) (not in docs)
#
# libc6
# libgcc1
# libgssapi-krb5-2
# libicu52 (for 14.x)
# libicu55 (for 16.x)
# libicu60 (for 18.x)
# libicu66 (for 20.x)
# libssl1.0.0 (for 14.x, 16.x)
# libssl1.1 (for 18.x, 20.x)
# libstdc++6
# zlib1g

# (for ubuntu 19.x) sudo apt-get install libcurl4 libssl1.1 libkrb5-3 zlib1g libicu63 gnupg ca-certificates

sudo apt update 
sudo apt upgrade 
sudo apt-get install libc6 libgcc1 libgssapi-krb5-2 libicu66 libssl1.1 libstdc++6 zlib1g
# https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/3.1.4xx/dotnet-sdk-latest-linux-arm64.tar.gz

# && curl -SL --output dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-arm.tar.gz \

# dotnet_sha512='2c84d8442fd872aafbdff7a1f131c4bacfb75ca69426d2aa2b9f3cf05a8e3a365923c14f7eb732113dd7a9fdc674c955e70817fb355aaabca25b79ed33356a15' 
#echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - 

#RiPi
apt install pigpio-tools libpigpiod-if2-1 pi-bluetooth rpi.gpio-common

sudo -i;dotnet_sdk_version=3.1.401
# As Root:
curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/3.1.4xx/dotnet-sdk-latest-linux-arm64.tar.gz 
mkdir -p /usr/share/dotnet 
tar -ozxf dotnet.tar.gz -C /usr/share/dotnet 
rm dotnet.tar.gz 
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet 
# As User:
curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/2.1./dotnet-sdk-latest-linux-arm64.tar.gz 
sudo mkdir -p /usr/share/dotnet 
sudo tar -ozxf dotnet.tar.gz -C /usr/share/dotnet 
sudo rm dotnet.tar.gz 
sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet 

# Trigger first run experience by running arbitrary cmd
&& dotnet help

# libgdiplus - Get this from Mono-project ## See : https://www.mono-project.com/download/stable/#download-lin
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
# sudo apt install mono-devel
sudo apt install mono-runtime
