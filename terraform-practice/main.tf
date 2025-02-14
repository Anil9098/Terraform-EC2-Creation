provider "docker" {}

resource "local_file" "myfile" {
	filename = "/home/ubuntu/terraform-practice/demo.txt"
	content = "This is a file created from terraform"
}


resource "docker_image" "nginx" {
             name = "nginx:latest"
             keep_locally = false
}


resource "docker_container" "nginx-ctr" {
           name = "nginx-container"
           image = docker_image.nginx.name

          ports {
          internal = 80
          external = 80
          }

}

