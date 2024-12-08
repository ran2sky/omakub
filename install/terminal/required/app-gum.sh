# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd /tmp
GUM_VERSION="0.14.3"
ARCH=$(dpkg --print-architecture)
echo "Installing Gum for architecture: $ARCH"
# Use known good version
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_${ARCH}.deb"
sudo apt-get install -y ./gum.deb
rm gum.deb
cd -
