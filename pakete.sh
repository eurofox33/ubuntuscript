# APT Pakete

# --- Schritt 1: Paketlisten aktualisieren ---
sudo apt update

# --- Schritt 2: Die gewünschten Anwendungen installieren ---
sudo apt install -y htop nvtop git curl tmux vim neovim libreoffice vlc yt-dlp obs-studio qemu-system virt-manager

# --- Schritt 3: Snap Anwendungen installieren ---
sudo snap install brave discord
sudo snap install code --classic

# --- Schritt 4: Steam installieren ---
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libnvidia-gl-575:i386

sudo apt install steam-installer

# --- Schritt 3: Erfolgsmeldung ---
echo ""
echo "Installation abgeschlossen! Alle Programme wurden erfolgreich installiert."

# --- Schritt 4: Docker einrichten ---

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
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Docker Gruppe erstellen
sudo groupadd docker

# User in die Docker Gruppe
sudo usermod -aG docker $USER

# --- Schritt 5: Erfolgsmeldung ---
echo ""
echo "Installation abgeschlossen! Docker erfolgreich installiert."
