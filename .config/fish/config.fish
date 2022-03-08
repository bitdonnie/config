# User abbreviations
abbr -a e nvim
abbr -a ls exa

# Git
abbr -a g git
abbr -a gc git clone
abbr -a gcom git commit -m 
abbr -a gp git push
abbr -a glg git log --graph --decorate --oneline

# Cargo
abbr -a ct cargo test
abbr -a cb cargo build
abbr -a ci cargo init
abbr -a cc cargo check
abbr -a cr cargo run

# Terraform
abbr -a tf terraform
abbr -a tfi terraform init
abbr -a tff terraform fmt
abbr -a tfv terraform validate
abbr -a tfa terraform apply
abbr -a tfd terraform destroy
abbr -a tfp terraform plan

# Docker
abbr -a d docker
abbr -a dim docker image ls
abbr -a dco docker container ls
abbr -a db docker build

# Docker Compose
abbr -a dc docker-compose
abbr -a dcu docker-compose up
abbr -a dcb docker-compose build

# Kubernetes - minikube
abbr -a mk minikube
abbr -a mkd minikube dashboard

# Kubernetes - ctl
abbr -a kc kubectl
abbr -a kcg kubectl get all
abbr -a kcd kubectl describe
abbr -a kcl kubectl logs
abbr -a kcp kubectl port-forward
abbr -a kccd kubectl create deployment
abbr -a kced kubectl expose deployment
abbr -a kcgs kubectl get services

# Pulumi
abbr -a pl pulumi

# Lualatex compiler
abbr -a lc lualatex

# PDF opener
abbr -a pdf zathura

set PATH $HOME/.cargo/bin $PATH
set PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH

# Set GPG TTY path
set GPG_TTY (tty)

# Evironment variable for ssh-agent socket
set SSH_AUTH_SOCKET $XDG_RUNTIME_DIR/ssh-agent.socket

starship init fish | source

