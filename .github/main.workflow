workflow "CPT" {
  on = "push"
  resolves = "cpt"
}

action "cpt" {
  uses = "./cpt/"
  env = {
    CONAN_USERNAME = "grisumbras"
    CONAN_REMOTES = "https://api.bintray.com/conan/bincrafters/public-conan, https://api.bintray.com/conan/grisumbras/conan"
  }
}


workflow "conan remote add" {
  on = "push"
  resolves = "conan-remote-add"
}

action "conan-remote-add" {
  uses = "./remote-add/"
  env = {
    remotes = "binc@@https://api.bintray.com/conan/bincrafters/public-conan, gris@@https://api.bintray.com/conan/grisumbras/conan"
  }
}
