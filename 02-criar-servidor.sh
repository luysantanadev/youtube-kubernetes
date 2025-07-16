# preparar o primeiro servidor do cluster
curl -sfL https://get.rke2.io | sh -
systemctl enable rke2-server.service
systemctl start rke2-server.service

# cria um link simbólico do kubectl
ln -s $(find /var/lib/rancher/rke2/data/ -name kubectl) /usr/local/bin/kubectl

# instala o helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# define a variável de ambiente para o 'kubeconfig'
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
echo "export KUBECONFIG='/etc/rancher/rke2/rke2.yaml'" >> ~/.bashrc
source ~/.bashrc

# obtem o token para conectar outros servidores e nós
cat /var/lib/rancher/rke2/server/node-token
