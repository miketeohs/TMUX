W3() {
podman ps -a -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
}
W3
exit 0
