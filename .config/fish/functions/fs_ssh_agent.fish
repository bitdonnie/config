function read_ssh_env_file -d "return the ssh_env file into VAR=VALUE format"
 	cat $argv | \
	grep = | \
	awk '{ print $1 }' | \
	awk '{ split($0, a, "="); print a[1] "=" substr(a[2], 1, length(a[2]) -1) }'
end

function __get_value
	string split -f2 '=' $argv
end

function __get_key
	string split -f1 '=' $argv
end

function fs_ssh_agent -d "set the ssh-agent env variables"
  	
	# if the ssh-agent is not yet running, we initialize it
	if test ! (pgrep -u $USER ssh-agent)
		ssh-agent -t 8h > $XDG_RUNTIME_DIR/ssh-agent.env
	end

	# if the ssh-agent is already running we just source the variables
	for export in ( read_ssh_env_file (echo $XDG_RUNTIME_DIR)/ssh-agent.env);
		set -xg (__get_key $export) (__get_value $export)
	end
end

