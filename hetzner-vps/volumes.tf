# resource "hcloud_volume" "data_volume" {
#   name       = "data-volume"
#   size       = var.volume_size
#   location   = var.location
#   format     = "ext4"
#
#   # Optional: Auto-delete when server is deleted
#   # delete_protection = false
#
#   labels = {
#     environment = "production"
#     purpose     = "data"
#   }
# }

# Example volume attachment to node1
# resource "hcloud_volume_attachment" "node1_data_volume" {
#   volume_id = hcloud_volume.data_volume.id
#   server_id = hcloud_server.node1.id
#   automount = true
# }

# Note: After attaching a volume, you'll need to mount it on the server:
# 1. Check the device: lsblk
# 2. Create mount point: mkdir -p /mnt/data
# 3. Mount: mount /dev/disk/by-id/scsi-0HC_Volume_<volume-id> /mnt/data
# 4. Add to /etc/fstab for persistence:
#    /dev/disk/by-id/scsi-0HC_Volume_<volume-id> /mnt/data ext4 discard,nofail,defaults 0 0
