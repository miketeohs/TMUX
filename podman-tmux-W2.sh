W2() {
podman ps -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
}
W2

