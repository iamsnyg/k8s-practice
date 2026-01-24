# system update
sudo apt-get update && sudo apt-get upgrade -y

# install kind
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# install kubectl
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# install kubectl binary
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# system update
sudo apt-get update && sudo apt-get upgrade -y

# docker install
sudo apt-get install -y docker.io

# add user to docker group
sudo usermod -aG docker $USER && newgrp docker

# create k8s directory
mkdir k8s && cd k8s

# configure kind cluster into vim
vim kind-cluster-config.yml << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  image: kindest/node:v1.34.3
- role: worker
  image: kindest/node:v1.34.3
- role: worker
  image: kindest/node:v1.34.3
- role: worker
  image: kindest/node:v1.34.3
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP

EOF



# give execution permission this script
# chmod +x install-k8s.sh

#  run
# ./install-k8s.sh