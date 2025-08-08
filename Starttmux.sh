Starttmux() {
for S in S1
#for S in S1 S2
do
    tmux new -d -s $S
    tmux select-pane -t 1 -T Main
    tmux splitw
    tmux select-pane -t 2
    tmux split-window -h
    tmux select-pane -t 3
    tmux split-window -h
    tmux select-pane -t 1 -T Main
    tmux select-pane -t 2 -T podman-ps
    tmux select-pane -t 3 -T podman-ps-a
    tmux select-pane -t 4 -T podman-images
    tmux select-pane -t 1
    tmux send-keys -t 1 'echo "Hello"' C-m
    tmux set -g pane-border-status bottom
    tmux set -g status-right '#{forecast} | #H'
    tmux set -g @forecast-locatin Singapore
# tmux send-keys -t 2 'podman ps -w 2' C-m
# podman ps -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
# tmux send-keys -t 3 'podman ps -a -w 2' C-m
# podman ps -a -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
# tmux send-keys -t 4 'watch -n 2 podman images' C-m
# watch -n 2 'podman image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"'
done
}

# tmux ls
# tmux a -t S1
# tmux a -t S2
#
# Additonal stuff
# Starttmux() {
##for S in S1 S2
for S in S1
do
    tmux new -d -s $S
    tmux select-pane -t .1 -T Dockers
    tmux splitw
    tmux select-pane -t .2
    tmux split-window -h
    tmux select-pane -t .3
    tmux split-window -h
    tmux select-pane -t 1 -T Main
    tmux select-pane -t 2 -T docker-ps
    tmux select-pane -t 3 -T docker-ps-a
    tmux select-pane -t 4 -T docker-images
    tmux select-pane -t 1
    tmux send-keys -t 1 'echo "Dockers World"' C-m
#    tmux send-keys -t 2 watch -n 2 'docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"' C-m
#    tmux send-keys -t 3 watch -n 2 'docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"' C-m
#    tmux send-keys -t 3 watch -n 2 'docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"' C-m
done
#}

#StartHtmux() {
#     tmux new -d -s S1
#     tmux select-pane -t 1 -T Main
#     tmux split-window -h
#     tmux select-pane -t 2 -T W2
#     tmux splitw
#     tmux select-pane -t 3 -T W3
#     tmux splitw
#     tmux select-pane -t 4 -T W4
#     tmux set -g pane-border-status bottom
# }

sudo mount --make-shared /
