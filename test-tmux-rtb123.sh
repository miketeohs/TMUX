tmux new-session -d -s rtb123
tmux send-keys 'vagrant up' C-m
tmux detach -s rtb123
