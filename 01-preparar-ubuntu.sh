# preparar o ubuntu
systemctl stop ufw && \
systemctl disable ufw && \
apt update && \
apt upgrade -y && \
apt install -y nfs-common curl \
    wget git net-tools unzip \
    ca-certificates open-iscsi \
    open-vm-tools && \
apt autoremove -y
