# --- Schritt 1: Erste Einrichtung ---
sudo apt update && sudo apt upgrade -y && sudo snap refresh

# UFW aktvieren
sudo ufw enable

# Uhrzeit für Dual Boot konfigurieren
timedatectl set-local-rtc 1

# --- Schritt 2: Die gewünschten Anwendungen installieren ---
sudo apt install -y htop nvtop git curl vim python3-venv vlc yt-dlp

# --- Schritt 3: Snap Anwendungen installieren ---
sudo snap install brave discord
sudo snap install code --classic

# --- Schritt 4: pyenv installieren ---
curl -fsSL https://pyenv.run | bash

# Set up your shell environment for Pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc

# Install Python build dependencies
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

source .bashrc

pyenv install 3.13 3.12 3.11

pyenv global 3.13

# --- Schritt 5: yt-dlp installieren ---
mkdir ~/.local/bin
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod +x ~/.local/bin/yt-dlp

# --- Schritt 6: Docker einrichten ---

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# --- Docker Pakete installieren ---
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Docker Gruppe erstellen
sudo groupadd docker

# User in die Docker Gruppe
sudo usermod -aG docker $USER
