cd /tmp
LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
ARCH=$(dpkg --print-architecture | sed 's/arm64/arm-64/')
wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-${ARCH}.deb"
sudo apt install -y ./localsend.deb
rm localsend.deb
cd -
