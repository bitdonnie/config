function ssh_agent
  if ! pgrep -u $USER ssh-agent > /dev/null
    ssh-agent -t 8h > $XDG_RUNTIME_DIR/ssh-agent.env
  end
  if ! test $SSH_AUTH_SOCK
    bass source $XDG_RUNTIME_DIR/ssh-agent.env > /dev/null
  end
end

