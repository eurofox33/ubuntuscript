# --- Schritt 1: System aktualisieren. ---
sudo apt update && sudo apt upgrade -y && sudo snap refresh

# --- Schritt 2: UFW aktvieren. ---
sudo ufw enable

# --- Schritt 3: Uhrzeit für Dual Boot konfigurieren. ---
timedatectl set-local-rtc 1
