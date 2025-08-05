W2() {
podman ps -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
}
W3() {
podman ps -a -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
}
W4() {
watch -n 2 'podman image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"'
}
