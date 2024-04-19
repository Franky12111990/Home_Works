source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "xxxxxxx"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "e9blj5uf9glh8bs2i3rl"
  token               = "xxxxxxx"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]
  provisioner "shell" {
    inline = [
    "sudo apt-get update",
"sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release",
"curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
"echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
"sudo apt-get update",
"sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
"sudo apt-get install -y htop tmux"
    ]
  }
}
