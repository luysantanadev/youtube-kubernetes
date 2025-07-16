mkdir -p /etc/rancher/rke2/ # cria o diretório onde ficam armazenas as configurações do rancher
touch /etc/rancher/rke2/config.yaml # cria o arquivo de configuração
echo "server: https://ip.do.seu.master:9345" >> /etc/rancher/rke2/config.yaml # pegue o IP do primeiro server do seu cluster, aquele que subiu primeiro
echo "token: " >> /etc/rancher/rke2/config.yaml # no script anterior, tem um comando cat que pega o token, copie o valor do token e cole aqui

curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sh - # agora instala o rancher no tipo agent
systemctl enable rke2-agent.service # habilita o serviço
systemctl start rke2-agent.service # inicializa o serviço
# repita para quantos nós quiser colocar
# esse mesmo serve para mais nós do tipo server, bastando remover essa variável: INSTALL_RKE2_TYPE="agent"
