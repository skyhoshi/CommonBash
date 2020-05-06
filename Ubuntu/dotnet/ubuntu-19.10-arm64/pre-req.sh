
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
sudo apt update
sudo apt upgrade
sudo apt-get install libcurl4 libssl1.1 libkrb5-3 zlib1g libicu63 gnupg ca-certificates
# libgdiplus - Get this from Mono-project ## See : https://www.mono-project.com/download/stable/#download-lin
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
# sudo apt install mono-devel
sudo apt install mono-runtime
