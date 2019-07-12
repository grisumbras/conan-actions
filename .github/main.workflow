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


workflow "conan in steps" {
  on = "push"
  resolves = ["conan-install-simple", "conan-install-args"]
}

action "conan-install-simple" {
  needs = "conan-remotes-add"
  uses = "./install/"
}

action "conan-install-args" {
  needs = "conan-remotes-add"
  uses = "./install/"
  args = ". --build missing"
}

action "conan-remotes-add" {
  uses = "./remote-add/"
  env = {
    CONAN_REMOTES = "https://api.bintray.com/conan/bincrafters/public-conan, gris@@https://api.bintray.com/conan/grisumbras/conan"
  }
}
