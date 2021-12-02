function kubectl --description 'alias kubectl=sudo microk8s kubectl'
  sudo microk8s kubectl $argv; 
end
