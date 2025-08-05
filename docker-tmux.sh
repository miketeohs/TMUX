W2() {
docker ps -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
}
W3() {
docker ps -a -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
}
W4() {
watch -n 2 'docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"'
}
