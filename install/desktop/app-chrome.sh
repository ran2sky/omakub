# Browse the web with the most popular browser. See https://www.google.com/chrome/
cd /tmp
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" == "amd64" ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_${ARCH}.deb
    sudo apt install -y ./google-chrome-stable_current_${ARCH}.deb
    rm google-chrome-stable_current_${ARCH}.deb
    xdg-settings set default-web-browser google-chrome.desktop
elif [ "$ARCH" == "arm64" ]; then
    sudo snap install chromium
    xdg-settings set default-web-browser chromium_chromium.desktop
else
    echo "Unsupported architecture: $ARCH"
fi
cd -
