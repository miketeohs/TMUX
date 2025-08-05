W4() {
watch -n 2 'podman image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"'
}
W4

