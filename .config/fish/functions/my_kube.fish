function mykube
	sudo microk8s kubectl get all | grep $argv[2] | awk '{ print $1}' | xargs sudo microk8s kubectl $argv[1] 
end

