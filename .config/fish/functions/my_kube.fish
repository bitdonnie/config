function mykube
	kubectl get all | grep $argv[2] | awk '{ print $1}' | xargs kubectl $argv[1] 
end

