function structurizr -a cmd -d 'interacts with the structurizr-cli docker image';
	echo $cmd
	switch $cmd
		case 'push'
			docker run -it --rm -v $STRUCTURIZR_PATH:/usr/local/structurizr structurizr/cli push \
				-workspace /usr/local/structurizr/workspace.dsl \
				-id $STRUCTURIZR_SARA \
				-key $STRUCTURIZR_KEY \
				-secret $STRUCTURIZR_SECRET
		case 'pull'
			docker run -it --rm -v $STRUCTURIZR_PATH:/usr/local/structurizr structurizr/cli pull \
				-id $STRUCTURIZR_SARA \
				-key $STRUCTURIZR_KEY \
				-secret $STRUCTURIZR_SECRET

		case '*'
			echo 'only push and pull are supported'
	end
end

