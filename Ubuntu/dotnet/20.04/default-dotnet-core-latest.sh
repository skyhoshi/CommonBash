# Install DotNet PreRequisits:
apt-get update; 
apt-get install -y --no-install-recommends libc6 libgcc1 libgssapi-krb5-2 libicu66 libssl1.1 libstdc++6 zlib1g;
# Install dotnetDiagnostics PreRequisits:
sudo apt update
sudo apt install cmake clang curl gdb gettext git libicu-dev lldb liblldb-dev libunwind8 llvm make python python-lldb tar wget zip;


# Install Dotnet Diagnostics:
cd /usr/src
sudo git clone https://github.com/dotnet/diagnostics.git diagnostics;
cd diagnostics
sudo ./build.sh
sudo ./test.sh

rm -rf /var/lib/apt/lists/*