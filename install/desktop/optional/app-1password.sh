# Install 1password and 1password-cli single script
ARCH=$(dpkg --print-architecture)

if [ "$ARCH" == "amd64" ]; then

    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

    # Add apt repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
    sudo tee /etc/apt/sources.list.d/1password.list

    # Add the debsig-verify policy
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    # Install 1Password & 1password-cli
    sudo apt update && sudo apt install -y 1password 1password-cli
elif [ "$ARCH" == "arm64" ]; then
    echo "Installing 1Password for ARM64..."
    curl -sSO https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz
    echo "Extracting 1Password..."
    sudo tar -xf 1password-latest.tar.gz

    echo "Moving 1Password to /opt..."
    sudo mkdir -p /opt/1Password
    sudo mv 1password-*/* /opt/1Password

    echo "Running after-install script..."
    sudo /opt/1Password/after-install.sh

    echo "Cleaning up 1Password installer..."
    sudo rm 1password-latest.tar.gz
else
    echo "Unsupported architecture: $ARCH"
fi
