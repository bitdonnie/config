
function dck_images_rm_all -d "Remove all images"
	command docker image ls | grep "weeks" | awk '{print $3}' | xargs docker image rm
end

function dck_container_rm_all -d "Remove all container that are not running"
	command docker container ps -a | grep "Exited" | awk '{print $1}' | xargs docker container rm
end
