group "default" {
  targets = ["caddy"]
}

target "caddy" {
  context    = "."
  dockerfile = "./Dockerfile"
  tags       = ["ghcr.io/denuxplays/caddy:dev"]
  output     = ["type=docker"]
}
