variable "DEFAULT_TAG" {
  default = "loop:local"
}

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
  tags = ["${DEFAULT_TAG}"]
}

// Default target if none specified
group "default" {
  targets = ["image-local"]
}

target "image-local" {
  inherits = ["docker-metadata-action"]
  output = ["type=docker"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  platforms = [
    "linux/386",
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64"
  ]
  output = ["type=image"]
}
