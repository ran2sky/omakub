# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd /tmp
GUM_VERSION="0.14.3"
ARCH=$(dpkg --print-architecture | sed 's/arm64/aarch64/')
# Use known good version
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_${ARCH}.deb"
sudo apt-get install -y ./gum.deb
rm gum.deb
cd -
